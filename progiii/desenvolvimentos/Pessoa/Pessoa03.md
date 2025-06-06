# ApiService

Classe `ApiService` em Java para consumir a API REST em `https://api.diegooilv.xyz/userJava`.  
Oferece dois métodos principais:

1. **GET** — busca todos os usuários cadastrados.
2. **POST** — cria um novo usuário.

---

## 📋 Conteúdo

- [ApiService](#apiservice)
  - [📋 Conteúdo](#-conteúdo)
  - [Pré-requisitos](#pré-requisitos)
  - [API Endpoints](#api-endpoints)
    - [GET /userJava](#get-userjava)
    - [POST /userJava](#post-userjava)
  - [Uso no código Java](#uso-no-código-java)
  - [Detalhes de implementação](#detalhes-de-implementação)
    - [Método `buscarPessoas(String endpoint)`](#método-buscarpessoasstring-endpoint)
    - [Método `criarPessoa(String endpoint, Pessoa pessoa)`](#método-criarpessoastring-endpoint-pessoa-pessoa)
  - [Tratamento de Erros](#tratamento-de-erros)

---

## Pré-requisitos

1. **Java 11+** (ou versão que suporte `HttpURLConnection` e **Text Blocks**).
2. Dependências internas:
   - Nenhuma biblioteca externa — todo o JSON é manipulado “na mão” usando classes padrão (`java.net.*`, `java.io.*`).
3. Ter conectividade com a internet para acessar `https://api.diegooilv.xyz/userJava`.

---

## API Endpoints

A API base é:

[https://api.diegooilv.xyz/userJava](https://api.diegooilv.xyz/userJava)

### GET /userJava

- **Descrição**: Retorna uma lista de todos os usuários cadastrados.
- **Resposta (200 OK)**: JSON no formato de _array_ de objetos:
  ```jsonc
  [
    {
      "id": 1,
      "nome": "João da Silva",
      "numero": "(51) 99876-5432",
      "email": "joao.silva@email.com",
      "cpf": "295.379.310-01",
      "endereco": "Rua das Flores 123"
    },
    {
      "id": 2,
      "nome": "Maria Oliveira",
      "numero": "(11) 91234-5678",
      "email": "maria.oliveira@email.com",
      "cpf": "862.883.667-50",
      "endereco": "Avenida Central 456"
    }
    // ...demais usuários...
  ]
  ```

### POST /userJava

- **Descrição**: Cria um novo usuário (cadastra no banco da API).
- **Body (application/json)**: Um único objeto JSON com todos os campos:

  ```jsonc
  {
    "id": 7,
    "nome": "Diego",
    "numero": "(51) 99966-9999",
    "email": "dieg@odiego.com",
    "cpf": "668.268.590-41",
    "endereco": "IFRS, 12"
  }
  ```

- **Resposta (201 Created)**: JSON vazio ou mensagem padrão da API (retorna sucesso ou erro).
- **Códigos de resposta**:

  - `201 Created` → criacao bem-sucedida.
  - `400 Bad Request` → algum campo inválido.
  - `500 Internal Server Error` → erro no servidor da API.

---

## Uso no código Java

```java
import service.ApiService;
import model.Pessoa;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        ApiService api = new ApiService();
        String endpoint = "https://api.diegooilv.xyz/userJava";

        // 1. Buscar todos os usuários
        List<Pessoa> lista = api.buscarPessoas(endpoint);
        for (Pessoa p : lista) {
            System.out.println(p.getId() + " | " + p.getNome() + " | " + p.getCpf());
        }

        // 2. Criar um novo usuário
        Pessoa nova = new Pessoa(
            10,
            "Diego Oliveira",
            "(51) 99966-9999",
            "diego@odiego.com",
            "668.268.590-41",
            "IFRS, 12"
        );
        boolean sucesso = api.criarPessoa(endpoint, nova);
        if (sucesso) {
            System.out.println("Usuário criado com sucesso!");
        } else {
            System.out.println("Falha ao criar usuário.");
        }
    }
}
```

---

## Detalhes de implementação

### Método `buscarPessoas(String endpoint)`

1. **Abre conexão HTTP GET** para o `endpoint`.
2. **Verifica código de resposta**:

   - Se diferente de `200 OK`, imprime erro e retorna lista vazia.

3. **Lê todo o JSON** da resposta (como `String`).
4. **Remove os colchetes externos** (`[ ... ]`) e faz um `split` simples em `"},{"` para separar objetos (cuidado: funciona se os campos não tiverem vírgulas internas).
5. Para cada segmento:

   - Reinsere `{}` no início/fim conforme a posição.
   - Remove aspas e chaves.
   - Faz parsing de cada campo com `split(":", 2)`.
   - Constrói objeto `Pessoa(id, nome, numero, email, cpf, endereco)`.
   - Adiciona à lista.

6. **Captura exceções internas** (por JSON mal formatado ou falhas de conversão); imprime no console e ignora o objeto inválido, continuando com o próximo.

```java
public List<Pessoa> buscarPessoas(String endpoint) {
    List<Pessoa> pessoas = new ArrayList<>();
    try {
        URL url = new URL(endpoint);
        HttpURLConnection conexao = (HttpURLConnection) url.openConnection();
        conexao.setRequestMethod("GET");
        conexao.setRequestProperty("Accept", "application/json");

        int responseCode = conexao.getResponseCode();
        if (responseCode != HttpURLConnection.HTTP_OK) {
            System.out.println("Erro no GET: " + responseCode);
            return pessoas;
        }

        BufferedReader in = new BufferedReader(
            new InputStreamReader(conexao.getInputStream(), "UTF-8")
        );
        StringBuilder resposta = new StringBuilder();
        String linha;
        while ((linha = in.readLine()) != null) {
            resposta.append(linha);
        }
        in.close();

        String json = resposta.toString().trim();
        if (json.startsWith("[") && json.endsWith("]")) {
            json = json.substring(1, json.length() - 1);
        } else {
            System.out.println("Formato JSON inesperado");
            return pessoas;
        }

        String[] objetos = json.split("\\},\\{");
        for (int i = 0; i < objetos.length; i++) {
            String obj = objetos[i];
            if (i == 0) {
                obj = obj + "}";
            } else if (i == objetos.length - 1) {
                obj = "{" + obj;
            } else {
                obj = "{" + obj + "}";
            }

            try {
                String objSemChaves = obj
                    .replace("{", "")
                    .replace("}", "")
                    .replace("\"", "");
                String[] campos = objSemChaves.split(",");

                int id = 0;
                String nome = "";
                String numero = "";
                String email = "";
                String cpf = "";
                String endereco = "";

                for (String campo : campos) {
                    String[] par = campo.split(":", 2);
                    if (par.length < 2) continue;
                    String chave = par[0].trim();
                    String valor = par[1].trim();

                    switch (chave) {
                        case "id" -> id = Integer.parseInt(valor);
                        case "nome" -> nome = valor;
                        case "numero" -> numero = valor;
                        case "email" -> email = valor;
                        case "cpf" -> cpf = valor;
                        case "endereco" -> endereco = valor;
                    }
                }

                Pessoa p = new Pessoa(id, nome, numero, email, cpf, endereco);
                pessoas.add(p);

            } catch (Exception e) {
                System.err.println("Erro ao processar objeto JSON: " + obj);
                e.printStackTrace();
                // Continua para o próximo objeto, mesmo que um falhe
            }
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return pessoas;
}
```

---

### Método `criarPessoa(String endpoint, Pessoa pessoa)`

1. **Abre conexão HTTP POST** para o `endpoint`.
2. **Seta `Content-Type` para `application/json`**.
3. **Monta o JSON** via _Text Block_ Java, formatando todos os campos:

   ```java
   String json = """
       {
         "id": %d,
         "nome": "%s",
         "numero": "%s",
         "email": "%s",
         "cpf": "%s",
         "endereco": "%s"
       }
       """.formatted(
           pessoa.getId(),
           pessoa.getNome(),
           pessoa.getNumero(),
           pessoa.getEmail(),
           pessoa.getCpf(),
           pessoa.getEndereco()
       );
   ```

4. **Escreve o JSON no `OutputStream`** da conexão.
5. **Verifica o `responseCode`**:

   - `200 OK` ou `201 CREATED` → retorna `true`.
   - Caso contrário → imprime o código de erro e retorna `false`.

6. **Captura exceções** (como falha de conexão) e retorna `false`.

```java
public boolean criarPessoa(String endpoint, Pessoa pessoa) {
    try {
        URL url = new URL(endpoint);
        HttpURLConnection conexao = (HttpURLConnection) url.openConnection();
        conexao.setRequestMethod("POST");
        conexao.setDoOutput(true);
        conexao.setRequestProperty("Content-Type", "application/json; charset=UTF-8");

        String json = """
            {
              "id": %d,
              "nome": "%s",
              "numero": "%s",
              "email": "%s",
              "cpf": "%s",
              "endereco": "%s"
            }
            """.formatted(
                pessoa.getId(),
                pessoa.getNome(),
                pessoa.getNumero(),
                pessoa.getEmail(),
                pessoa.getCpf(),
                pessoa.getEndereco()
        );

        try (OutputStream os = conexao.getOutputStream()) {
            byte[] input = json.getBytes("UTF-8");
            os.write(input, 0, input.length);
        }

        int responseCode = conexao.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK ||
            responseCode == HttpURLConnection.HTTP_CREATED) {
            return true;
        } else {
            System.out.println("Erro ao criar pessoa: " + responseCode);
            return false;
        }

    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}
```

---

## Tratamento de Erros

- **GET**:

  - Se o código de resposta HTTP não for `200 OK`, imprime no console `Erro no GET: <código>` e retorna uma **lista vazia**.
  - **Objetos JSON inválidos** (ex: endereço mal formatado) são capturados no loop `try-catch` interno, ignorados e registrados no console.

- **POST**:

  - Se o código de resposta não for `200 OK` nem `201 CREATED`, imprime no console `Erro ao criar pessoa: <código>` e retorna `false`.
  - Qualquer exceção durante a criação (por exemplo, falha na conexão) também retorna `false`.
