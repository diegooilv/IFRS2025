# Aula 23/05/2025

Nesta aula, discutimos como implementar um sistema de alteração de dados em uma aplicação Swing. O objetivo deste documento é apresentar de forma clara e didática a classe `ControllerView`, responsável por gerenciar a interface e o modelo de dados (`Pessoa`).

---

## Visão Geral

A classe `ControllerView` atua como intermediária entre a interface gráfica (componentes Swing) e a lista interna de objetos `Pessoa`. Ela:

- Recebe referências aos componentes de entrada e exibição (`JTextField` e `JList<String>`).
- Mantém um ArrayList de instâncias de `Pessoa`.
- Sincroniza os dados entre a interface e o modelo.

---

## Pré-requisitos

- Java 11 ou superior
- Bibliotecas Swing incluídas no JDK
- Classe de modelo `Pessoa` com getters e setters para `nome` e `telefone`

---

## Estrutura de Atributos

| Atributo             | Tipo                       | Descrição                                            |
| -------------------- | -------------------------- | ---------------------------------------------------- |
| `jTextFieldId`       | `JTextField`               | Exibe o índice da pessoa (não editável).             |
| `jTextFieldNome`     | `JTextField`               | Campo de entrada para o nome.                        |
| `jTextFieldTelefone` | `JTextField`               | Campo de entrada para o telefone.                    |
| `jList`              | `JList<String>`            | Lista visual com as pessoas formatadas como strings. |
| `arrayListPessoas`   | `ArrayList<Pessoa>`        | Armazena os objetos `Pessoa`.                        |
| `arrayListStrings`   | `ArrayList<String>`        | Strings formatadas para exibir na `JList`.           |
| `defaultListModel`   | `DefaultListModel<String>` | Modelo de lista para atualizar o componente `JList`. |
| `pEdit`              | `Pessoa`                   | Referência à pessoa selecionada para edição.         |
| `p`                  | `Pessoa`                   | Objeto temporário de criação ao salvar nova pessoa.  |

---

## Construtor

```java
public ControllerView(
    JTextField jTextFieldId,
    JTextField jTextFieldNome,
    JTextField jTextFieldTelefone,
    JList<String> jList
) {
    this.jTextFieldId = jTextFieldId;
    this.jTextFieldNome = jTextFieldNome;
    this.jTextFieldTelefone = jTextFieldTelefone;
    this.jList = jList;
    this.arrayListPessoas = new ArrayList<>();
    this.arrayListStrings = new ArrayList<>();
    this.defaultListModel = new DefaultListModel<>();
}
```

Recebe instâncias dos componentes da interface e inicializa as coleções internas.

---

## Descrição dos Métodos

### `inicio()`

Bloqueia o campo de ID para evitar edição direta pelo usuário.

```java
public void inicio() {
    jTextFieldId.setEditable(false);
    jTextFieldId.setFocusable(false);
}
```

---

### `receberPessoa()`

Retorna o objeto `Pessoa` correspondente à seleção na `JList`. Compara a string formatada de cada `Pessoa` com o valor selecionado.

```java
private Pessoa receberPessoa() {
    String selecionado = jList.getSelectedValue();
    if (selecionado == null) return null;

    for (Pessoa pessoa : arrayListPessoas) {
        String formato = String.format("Nome: %s | Telefone: %s", pessoa.getNome(), pessoa.getTelefone());
        if (selecionado.equals(formato)) {
            return pessoa;
        }
    }
    return null;
}
```

---

### `editar()`

Carrega os dados da `Pessoa` selecionada nos campos de texto para edição.

```java
public void editar() {
    Pessoa selecionada = receberPessoa();
    if (selecionada == null) return;

    pEdit = selecionada;
    jTextFieldId.setText(String.valueOf(arrayListPessoas.indexOf(selecionada)));
    jTextFieldNome.setText(pEdit.getNome());
    jTextFieldTelefone.setText(pEdit.getTelefone());
}
```

---

### `salvar()`

Cria e adiciona uma nova `Pessoa` se não houver ID preenchido e se não existir duplicata.

```java
public void salvar() {
    if (!jTextFieldId.getText().isEmpty()) return;

    Pessoa nova = new Pessoa(
        jTextFieldNome.getText(),
        jTextFieldTelefone.getText()
    );
    if (!arrayListPessoas.contains(nova)) {
        arrayListPessoas.add(nova);
    }
}
```

---

### `carregar()`

Popula o `JList` com as representações em string de cada `Pessoa` armazenada.

```java
public void carregar() {
    arrayListStrings.clear();
    defaultListModel.clear();

    for (Pessoa pessoa : arrayListPessoas) {
        String formato = String.format("Nome: %s | Telefone: %s", pessoa.getNome(), pessoa.getTelefone());
        arrayListStrings.add(formato);
    }

    defaultListModel.addAll(arrayListStrings);
    jList.setModel(defaultListModel);
}
```

---

### `alterar()`

Aplica as alterações dos campos de texto na instância selecionada (`pEdit`).

```java
public void alterar() {
    if (pEdit == null) return;

    pEdit.setNome(jTextFieldNome.getText());
    pEdit.setTelefone(jTextFieldTelefone.getText());
}
```

---

## Execução e Testes

Para testar o controlador, execute o arquivo JAR e interaja com a interface:

1. Clique em **Salvar** para adicionar uma nova pessoa.
2. Selecione uma pessoa na lista e clique em **Editar**.
3. Altere nome ou telefone e clique em **Alterar**.
4. Use **Carregar** para atualizar a lista.

[Baixe o programa (.jar)](./Dist/Aula10/Pessoa.jar)

---

## Melhorias Futuras

- Validação de formatos de telefone
- Mensagens de confirmação/erro ao usuário
- Suporte a remoção de registros
- Persistência em banco de dados ou arquivo local

---

## Bugs Conhecidos

- Indexação por posição pode ficar inconsistente se itens forem removidos (remover ainda não implementado).
- Campos não reiniciam ao salvar/alterar sem ação do usuário.
- Duplicatas são verificadas apenas por `equals()`, sem feedback visual.

---

## Avisos e Observações

> Este sistema apresenta diversos bugs conhecidos, mas que, no momento, não impactam o uso básico do controlador.
>
> Tanto o código quanto esta documentação foram desenvolvidos de forma independente, com base no conteúdo teórico apresentado em aula. Não houve participação direta do docente na construção do material.
