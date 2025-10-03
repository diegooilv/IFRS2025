import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Treinador implements Serializable {

    String nome;
    List<Pokemon> pokemons;
    int pokeballs;

    public int getPokeballs() {
        return pokeballs;
    }

    public Treinador(String nome) {
        pokemons = new ArrayList<>();
        pokeballs = 10;
        this.nome = nome;
    }

    public int getPontos() {
        int sum = 0;
        for (Pokemon p : pokemons) {
            switch (p.getRaridade()) {
                case 0 ->
                    sum += 10;
                case 1 ->
                    sum += 15;
                case 2 ->
                    sum += 25;
                case 3 ->
                    sum += 40;
                default ->
                    sum += 0;
            }
        }

        return sum;
    }

    public void addPokemon(Pokemon p) {
        this.pokemons.add(p);
    }

    public void subPokebola() {
        this.pokeballs -= 1;
    }

    public List<Pokemon> getPokemons() {
        return pokemons;
    }

    public void addPokebola(int i) {
        this.pokeballs += i;
    }

    public void removePokemon(Pokemon p) {
        pokemons.remove(p);
    }

    public String getNome() {
        return this.nome;
    }

}