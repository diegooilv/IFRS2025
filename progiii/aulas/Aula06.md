# Aula - 28/03/25

## Projeto Base
- **Projeto:** [Sistema.zip](Projects/Sistema/Sistema.zip)
- **Descrição:** Projeto desenvolvido pelo professor junto com os alunos.

## Objetivo da Aula
Criar um sistema que salve informações e as exiba de forma visual em uma lista.

> **Destaque:** O controlador é o coração do sistema, onde toda a lógica acontece.

---

## Estrutura Base do Controlador

```java
public class Controlador {

    JTextField jtextFieldID;
    JTextField jtextFieldNome;
    JTextField jtextFieldCpf;
    JList jListPessoas;

    Pessoa pe;

    ArrayList<Pessoa> listaPessoas = new ArrayList<>();
    ArrayList<String> listaPessoasAtualizado = new ArrayList<>();
    DefaultListModel<String> listaDePessoas = new DefaultListModel<>();

    public Controlador(JTextField jtextFieldID, JTextField jtextFieldNome, JTextField jtextFieldCpf, JList<String> jListPessoas) {
        this.jtextFieldID = jtextFieldID;
        this.jtextFieldNome = jtextFieldNome;
        this.jtextFieldCpf = jtextFieldCpf;
        this.jListPessoas = jListPessoas;
    }
    // ... demais métodos
}
```

---

## Métodos Principais

### Salvar Pessoa
Este método é chamado ao acionar o botão de salvar e realiza as seguintes ações:
- Obtém os valores dos campos de texto.
- Cria um objeto `Pessoa`.
- Adiciona a pessoa à lista.
- Atualiza a exibição da lista.

```java
public void salvarPessoa() {
    String cpf = jtextFieldCpf.getText();
    String nome = jtextFieldNome.getText();
    int id = Integer.parseInt(jtextFieldID.getText());
    pe = new Pessoa(id, nome, cpf);
    listaPessoas.add(pe);
    atualizarLista();
}
```

> **Observação:** Este método é executado ao clicar no botão de salvar.

---

### Atualizar a Lista
Este método atualiza a `JList` exibindo os dados salvos.  
**Passos:**
1. Limpa o modelo da lista (`listaDePessoas`).
2. Cria uma nova lista de strings formatadas com os dados de cada pessoa.
3. Ordena essa lista.
4. Adiciona os itens ordenados ao modelo.
5. Atualiza o `JList` com o novo modelo.

```java
public void atualizarLista() {
    // Limpa o modelo para evitar duplicatas
    listaDePessoas.clear();

    // Atualiza a lista com os dados formatados
    listaPessoasAtualizado = new ArrayList<>();
    for (Pessoa p : listaPessoas) {
        listaPessoasAtualizado.add("| Nome: " + p.getNome() + " | Cpf: " + p.getCpf() + " |");
    }
    
    // Ordena a lista alfabeticamente
    Collections.sort(listaPessoasAtualizado);
    
    // Adiciona todos os itens ordenados ao modelo
    listaDePessoas.addAll(listaPessoasAtualizado);
    
    // Atualiza o JList com o novo modelo
    jListPessoas.setModel(listaDePessoas);
}
```

> **Dica:** Em aula foi sugerido recriar o modelo com `listaDePessoas = new DefaultListModel<>();` a cada atualização. No entanto, a abordagem de limpar o modelo usando `.clear()` é mais eficiente e direta.

---

## Versão Final

Se desejar testar a versão final do sistema, baixe o executável:
- **Sistema.jar:** [Sistema.jar](Dist/Aula06/Sistema.jar)

> **Observação:** Caso encontre algum erro, por favor, envie uma issue para que possamos corrigir.
