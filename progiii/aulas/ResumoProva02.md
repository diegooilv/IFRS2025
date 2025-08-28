# Prova — Segundo Trimestre

**Leia:** [Resumo01](ResumoProva01.md)

---

## Visão geral

No segundo trimestre revisamos e aprofundamos conceitos já vistos no primeiro trimestre, com ênfase em:

- **Modelo MVC** (Model — View — Controller)
- **Alternância de telas** usando `JDesktopPane` e `JPanel` internos
- **Seleção de Objeto via JList** clicando no JList
- **Persistência de dados** por **serialização** (salvar/ler `ArrayList` de objetos)
- **Autenticação simples** (fluxo de login controlado pelo Controller)

A ideia principal é integrar esses conceitos para criar aplicações desktop Java organizadas e fáceis de manter.

---

## Conceitos-chave 

### MVC (Model — View — Controller)

- **Model:** representa dados e regras de negócio (por exemplo, `Brincadeira`).
- **View:** componentes de interface gráfica (Swing — `JFrame`, `JPanel`, `JTextField`, `JList`, etc.).
- **Controller:** orquestra o fluxo: recebe eventos da View, chama o Model/DAO e atualiza a View.

> O _Controller_ **não** deve conter lógica de persistência pesada nem regras de domínio complexas — ele delega isso ao `DAO`/Model.

### Serialização

- Em Java, serializar significa transformar um objeto em uma sequência de bytes para salvar em arquivo e, depois, recuperar o objeto a partir desses bytes.
- Para serializar um objeto, a classe deve implementar `Serializable`.
- Arquivos de saída comuns: `.ser`, `.dat`, `.bin` — a extensão é apenas uma convenção.

### DAO (Data Access Object)

- Padrão para isolar o acesso à persistência (banco, arquivo, etc.).
- Exemplos de nomes: `BrincadeiraDAO`, `PessoaDAO`, `DBBrincadeira`.
- Convenção de nomes em Java: siglas com até 3 letras (ex.: `DAO`) ficam em maiúsculas (`AlunoDAO`).

### `.dat` vs `.ser`

- `.dat` — extensão genérica de **dados**; pode ser texto ou binário.
- `.ser` — frequentemente usada para indicar **serialização Java**.

---

## Estrutura de pastas sugerida

```
/src
  /modelo
    Brincadeira.java
  /controller
    CBrincadeira.java
    ControladorTelas.java
  /db
    BrincadeiraDAO.java   // ou DBBrincadeira.java
  /view
    TBrincadeira.java     // JPanel
    TTelaInicial.java     // JFrame
```

---

## Código exemplo (limpo e comentado)

### Modelo — `modelo/Brincadeira.java`

```java
package modelo;
// [...]

public class Brincadeira implements Serializable { // classe que representa o modelo Brincadeira

    // [...] Variáveis

    // Construtor: inicializa um objeto Brincadeira com os valores fornecidos
    public Brincadeira(int id, String nome, String descricao, float valor) {
        // [...]
    }

    // getters e setters: métodos de acesso e modificação dos campos
    // [...]
}
```

### DAO / Persistência — `db/BrincadeiraDAO.java`

```java
package db;
// [...]

public class BrincadeiraDAO {
    private static final String ARQUIVO = "brinquedo.dat"; // caminho relativo para o arquivo de dados

    // Carrega a lista de Brincadeira do arquivo. Retorna lista vazia se o arquivo não existir ou ocorrer erro.
    public static List<Brincadeira> carregar() {
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(ARQUIVO))) {
            // Lê o objeto serializado do arquivo e faz cast para List<Brincadeira>
            return (List<Brincadeira>) ois.readObject();
        } catch (FileNotFoundException e) {
            // Arquivo ainda não criado: retorna lista vazia
            return new ArrayList<>();
        } catch (IOException | ClassNotFoundException e) {
            // Problema ao ler ou desserializar: registra o erro e retorna lista vazia
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    // Salva a lista completa de Brincadeira no arquivo (sobrescreve o anterior)
    public static void salvar(List<Brincadeira> lista) {
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(ARQUIVO))) {
            // Escreve (serializa) o objeto lista no arquivo
            oos.writeObject(lista);
        } catch (IOException e) {
            // Problema ao escrever: registra o erro
            e.printStackTrace();
        }
    }
}
```

### Controller (exemplo) — `controller/CBrincadeira.java`

```java
package controlador;
// [...]

public class CBrincadeira {
    // Campos que representam componentes Swing usados pelo controller
    // [...]

    // Estruturas de dados em memória
    ArrayList<Brincadeira> listaBrincadeiras = new ArrayList<>(); // lista em memória de Brincadeira
    DefaultListModel defaultListModel = new DefaultListModel();   // modelo usado pela JList

    int index;                                // índice do item selecionado para edição
    JButton jButtonSalvarEditar;               // botão que alterna entre "Salvar" e "Editar"

    // Construtor que recebe referências aos componentes da view (injeção manual)
    // Apaguei os parâmetros pra evitar poluição.
    public CBrincadeira() {
        //[...]

        carregarLista();                                    // carrega dados do armazenamento ao iniciar
    }

    // Limpa os campos da view e já prepara um novo id
    public void limpar(){
        // [...]
    }

    // Gera um novo id sequencial com base no último elemento da lista
    public int gerarId(){
        // [...]
    }

    // Método chamado pela view para cadastrar ou editar uma Brincadeira
    public void cadastrarBrincadeira(){
        int id = Integer.parseInt(jTextFieldId.getText());           // converte o texto do campo id para inteiro
        String nome = jTextFieldNome.getText();                      // obtém o nome do campo
        String descricao = jTextFieldDescricao.getText();            // obtém a descrição
        float valor = Float.parseFloat(jTextFieldValor.getText());  // converte o texto do valor para float

        Brincadeira b = new Brincadeira(id, nome, descricao, valor); // cria o objeto modelo com os dados
        if (jButtonSalvarEditar.getText().compareToIgnoreCase("Salvar") == 0) {
            listaBrincadeiras.add(b);   // se o botão está em "Salvar", adiciona novo objeto
        }
        else{
           listaBrincadeiras.set(index, b);  // caso contrário, substitui o objeto no índice selecionado
        }
        limpar();                           // limpa campos para nova operação
        DBBrincadeira.salvar(listaBrincadeiras); // persiste a lista completa no armazenamento
        carregarLista();                    // recarrega a lista para atualizar a view
}

    // Carrega a lista do arquivo via DBBrincadeira e atualiza o DefaultListModel para a JList
    public void carregarLista(){
        listaBrincadeiras = (ArrayList<Brincadeira>) DBBrincadeira.carregar(); // obtém a lista do DAO
        defaultListModel = new DefaultListModel(); // cria novo modelo para evitar resíduos
        ArrayList<String> listaAtualizada = new ArrayList<>();
        for (Brincadeira b: listaBrincadeiras) {
            listaAtualizada.add(b.getNome() + " - " + b.getId()); // representa cada item como "nome - id"
        }
        Collections.sort(listaAtualizada);          // ordena alfabeticamente para exibição mais amigável
        defaultListModel.addAll(listaAtualizada);  // adiciona todos os itens ao modelo
        jListBrincadeiras.setModel(defaultListModel);      // atualiza a JList na view
    }

    // Seleciona o objeto com base no item selecionado na JList e preenche os campos para edição
    public void selecionarObjeto(){
        String brincadeiraSelecionada = jListBrincadeiras.getSelectedValue(); // texto selecionado na lista
        index = 0; // reseta índice antes da busca

        for (Brincadeira b:listaBrincadeiras){
            String temp = b.getNome() + " - " + b.getId(); // monta string igual à exibida na JList
            if  (temp.compareToIgnoreCase(brincadeiraSelecionada) == 0){ // se encontrou correspondência
                jTextFieldId.setText(b.getId()+"");             // preenche o campo id
                jTextFieldNome.setText(b.getNome()+"");         // preenche o campo nome
                jTextFieldDescricao.setText(b.getDescricao()+""); // preenche o campo descrição
                jTextFieldValor.setText(b.getValor()+"");       // preenche o campo valor
                jButtonSalvarEditar.setText("Editar");          // altera o texto do botão para "Editar"
                break;                                           // sai do loop após encontrar
            }
            index++;     // incrementa índice para corresponder ao elemento atual
        }

    }

}
```

### Controlador de telas — `controller/ControladorTelas.java`

```java
package controller;
// [...]
public class ControladorTelas {
    private JDesktopPane jDesktop; // referência ao JDesktopPane

    public ControladorTelas(JDesktopPane jDesktop) {
        this.jDesktop = jDesktop; // injeta o JDesktopPane usado para alternar telas
    }
    public void abrirBrincadeira() {
    // Remove todos os componentes que estavam anteriormente no JDesktopPane,
    // garantindo que a nova tela seja exibida sozinha
    jDesktop.removeAll();

    // Atualiza a interface gráfica após a remoção dos componentes
    jDesktop.updateUI();

    // Captura o tamanho atual do JDesktopPane,
    // para que o painel novo ocupe exatamente esse espaço
    Dimension resolucao = jDesktop.getSize();

    // Cria uma nova instância da tela "TBrincadeira" (JPanel)
    TBrincadeira tBrincadeira = new TBrincadeira();

    // Define que o painel "TBrincadeira" terá o mesmo tamanho do container
    tBrincadeira.setSize(resolucao);

    // Posiciona o painel no canto superior esquerdo (coordenadas 0,0)
    tBrincadeira.setLocation(0, 0);

    // Adiciona o painel ao JDesktopPane
    jDesktop.add(tBrincadeira);

    // Torna o painel visível para o usuário
    tBrincadeira.setVisible(true);
    }
}
```

---

## Onde chamar `carregar()` e `salvar()`?

- **Ao iniciar** o Controller (ou ao iniciar a aplicação) chame `carregar()` para preencher as listas/Views com dados já salvos.
- **Ao alterar** os dados (criar, editar, excluir), chame `salvar()` passando o `ArrayList` completo — assim o arquivo sempre reflete o estado atual.

**Importante:** salvar o _ArrayList completo_ evita inconsistências quando a aplicação fecha inesperadamente.

---

## Fluxo simplificado

1. App inicia → Controller principal chama `DAO.carregar()` → popula Model/Views.
2. Usuário interage com a View → eventos disparam métodos do Controller.
3. Controller valida/transforma dados e chama DAO para persistir (`salvar(lista)`).
4. Controller atualiza a View.

---

## Sistema de Login (forma simples vista em aula)

- **Fluxo (modo visto em aula):**

  1. A View recebe email/senha do usuário (campos de texto).
  2. O Controller compara diretamente essas strings com valores armazenados em variáveis (por exemplo, `storedEmail` e `storedPassword`) usando `equals()` ou `compareToIgnoreCase()`.
  3. Se as strings coincidirem, o Controller decide qual tela abrir (chama `ControladorTelas.abrirX()`); caso contrário, mostra mensagem de erro.

- **Exemplo simples (pseudo-código):**

```java
String inputEmail = txtEmail.getText();
String inputSenha = txtSenha.getText();

// Valores definidos no código (didático)
String storedEmail = "professor@escola.com";
String storedSenha = "12345";

if (inputEmail.equals(storedEmail) && inputSenha.equals(storedSenha)) {
    controlTelas.abrirPainelPrincipal();
} else {
    JOptionPane.showMessageDialog(null, "Email ou senha inválidos");
}
```

> Observação: este método é **inseguro e apenas didático**. Em aplicações reais use armazenamento seguro (DAO + serialização/banco), hashing de senhas, e verificação adequada.

# Seleção de Objeto via `JList`

**O que acontece**
Quando o usuário clica em um item da `JList` queremos identificar qual objeto do modelo foi escolhido, preencher os campos do formulário com os dados desse objeto e colocar a interface em modo _Editar_ (por exemplo, trocar o texto do botão para “Editar”).

## Fluxo 

1. **Evento de seleção:** o componente `JList` dispara um evento de seleção quando o usuário clica em um item.
2. **Mapear para o objeto do modelo:** decidir como traduzir o item visual para o objeto `Brincadeira` correspondente. Duas abordagens comuns:

   - **a)** _Parsing de string exibida_ (ex.: `"nome - id"`): comparar a string exibida com cada item em `listaBrincadeiras` até achar o objeto que corresponde.
   - **b)** _Model com objetos_ (recomendado): armazenar diretamente instâncias de `Brincadeira` no `ListModel`; ao selecionar, você obtém o objeto sem parsing.

3. **Preencher campos da View:** uma vez identificado o objeto, preencher `id`, `nome`, `descrição`, `valor` nos campos correspondentes.
4. **Ajustar estado da interface:** colocar o botão em modo “Editar”, salvar o índice do objeto selecionado para futuras operações de atualização, e garantir que os campos estejam habilitados/visíveis conforme necessário.
5. **Tratar erros e exceções:** ao preencher/converter valores (ex.: string → número), tratar possíveis erros de conversão e avisar o usuário se necessário.
6. O botão "Editar" irá salvar o objeto "antigo" e chamar o método `carregar();` novamente.

## Resumo

Ao clicar na `JList` você pega o item selecionado, mapeia para o objeto do modelo (de preferência obtido diretamente do `ListModel`), preenche os campos da view, ajusta o estado para edição e trata erros de conversão/ausência de seleção.

---

## Boas práticas e dicas para a prova

- Entenda claramente o papel de cada camada (Model, View, Controller, DAO).
- Saiba explicar por que salvamos o `ArrayList` inteiro.
- Saiba como carregar um objeto clicando no JList.
- Conheça a sintaxe básica de serialização (`ObjectOutputStream` / `ObjectInputStream`).
- Mostre onde o `carregar()` e `salvar()` são chamados no fluxo (ex.: construtor do Controller, após operação de salvar/editar/excluir/carregarJList).
- Esteja pronto para descrever a alternância de telas com `JDesktopPane`.

---

💡 Caso ainda tenha dúvidas sobre como funciona a persistência, confira a explicação detalhada em:  
[📂 Persistência](Extras/Persistencia.md)
