import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpTimeoutException;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

// Necessário baixar um .jar pra funcionar!
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.JsonNode;

// Disponíveis no Projeto
import dao.PokemonDAO;
import model.Pokemon;

public class Pokemons {

    // Minha API de Pokemon
    private static final String BASE_URL = "https://dex.diegooilv.xyz/pokemon/id/";
    private final HttpClient httpClient;
    private final ObjectMapper objectMapper;

    public Pokemons() {
        this.httpClient = HttpClient.newBuilder()
                .connectTimeout(Duration.ofSeconds(5))
                .build();
        this.objectMapper = new ObjectMapper();
    }

    private String fetchPokemonData(int id) throws IOException, InterruptedException {
        String url = BASE_URL + id;
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .timeout(Duration.ofSeconds(8))
                .GET()
                .build();

        HttpResponse<String> response;
        try {
            response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());
        } catch (HttpTimeoutException e) {
            throw new IOException("Timeout ao buscar Pokémon " + id, e);
        }

        if (response.statusCode() == 200) {
            return response.body();
        } else {
            throw new IOException("Status " + response.statusCode());
        }
    }

    private Pokemon createPokemonFromApiData(String json, int expectedId) {
        try {
            JsonNode root = objectMapper.readTree(json);

            int id = root.path("id").asInt(-1);
            if (id != expectedId && id != -1) {
                System.err.println("Aviso: ID retornado (" + id + ") difere do esperado (" + expectedId + "). Ignorando.");
                return null;
            }

            String name = root.path("name").path("english").asText(null);
            String linkImage = root.path("image").path("hires").asText(null);
            String linkIcon = root.path("image").path("sprite").asText(null);

            if (name == null || linkImage == null || linkIcon == null) {
                System.err.println("Campos obrigatórios ausentes para ID " + expectedId + ". Ignorando.");
                return null;
            }

            int raridade = 0;

            return new Pokemon(name, linkImage, linkIcon, raridade);

        } catch (IOException e) {
            System.err.println("Falha ao parsear JSON do Pokémon " + expectedId + ": " + e.getMessage());
            return null;
        }
    }

    public List<Pokemon> createAllPokemons(int startId, int endId) {
        if (startId > endId) {
            throw new IllegalArgumentException("startId > endId");
        }

        List<Pokemon> pokemons = new ArrayList<>();
        System.out.println("Iniciando criação de Pokémons de " + startId + " a " + endId + "...");

        for (int id = startId; id <= endId; id++) {
            try {
                String jsonData = fetchPokemonData(id);
                Pokemon pokemon = createPokemonFromApiData(jsonData, id);
                if (pokemon != null) {
                    pokemons.add(pokemon);
                } else {
                }
            } catch (InterruptedException ie) {
                Thread.currentThread().interrupt();
                System.err.println("Execução interrompida. Parando no ID " + id);
                break;
            } catch (IOException e) {
                System.err.println("Ignorando Pokémon ID " + id + " devido a erro: " + e.getMessage());
            } catch (Exception e) {
                System.err.println("Erro inesperado no ID " + id + ": " + e.getClass().getSimpleName() + " - " + e.getMessage());
            }
        }

        System.out.println("Processo concluído. Total válido: " + pokemons.size());
        return pokemons;
    }

    public static void main(String[] args) {
        Pokemons factory = new Pokemons();
        // Máximo disponível na API: 898
        List<Pokemon> allPokemons = factory.createAllPokemons(1, 100);

        if (!allPokemons.isEmpty()) {
            PokemonDAO dao = new PokemonDAO();
            dao.save(allPokemons);
            System.out.println("Pokémons salvos no banco: " + allPokemons.size());
        } else {
            System.out.println("Nenhum Pokémon válido para salvar.");
        }
    }
}