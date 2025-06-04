# Edição e Persistência de Dados

Este documento apresenta a implementação de leitura, gravação e edição de objetos da classe Pessoa por meio de serialização Java. A validação de campos, como CPF, está concentrada na classe Pessoa, garantindo que os dados mantenham sempre o formato correto.

---

## Classe PessoaDAO

Responsável por gravar e recuperar a lista de instâncias de Pessoa em um arquivo .dat

```java
/**
 *
 * @author Diego
 */
public class PessoaDAO {

    private static final String ARQUIVO = "pessoas.dat";

    public void salvar(List<Pessoa> pessoas) {
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(ARQUIVO))) {
            oos.writeObject(pessoas);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Pessoa> carregar() {
        File file = new File(ARQUIVO);
        if (!file.exists()) {
            return new ArrayList<>();
        }
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(file))) {
            return (List<Pessoa>) ois.readObject();
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }
}
```

Este código abre um fluxo para gravação da lista de objetos Pessoa em formato binário. No método carregar, verifica a existência do arquivo. Se não existir, retorna uma lista vazia. Caso exista, tenta ler o conteúdo e converter para List<Pessoa>. Em caso de erro, retorna lista vazia e imprime o stack trace.

---

## Atualização na Classe Pessoa

A inclusão de serialVersionUID em Pessoa garante compatibilidade entre versões durante a desserialização. O modificador final impede herança que possa comprometer a lógica interna de validação.

```java
public final class Pessoa implements Serializable {
    private static final long serialVersionUID = 1L;
    ...
}
```

Cada atributo recebe validação em seu setter. Por exemplo, o CPF deve conter exatamente 11 dígitos. Caso o valor seja inválido, o setter dispara IllegalArgumentException, impedindo armazenamento de valor incorreto.

---

## Carregar a Lista ao Iniciar

Ao inicializar o controlador, chama-se o método carregar para preencher a lista em memória

```java
List<Pessoa> listPessoas;

public ConstrutorControlador(...) {
    listPessoas = pessoaDAO.carregar();
}
```

Se não houver arquivo gravado, a lista fica vazia. Caso contrário, recebe todos os registros persistidos. Dessa forma, a interface inicia exibindo o conteúdo armazenado.

---

## Criação de Nova Pessoa

Quando o usuário informa os dados nos campos e aciona a criação, ocorre o seguinte

```java
public void criarPessoa() {
    Pessoa p = new Pessoa(...);
    listPessoas.add(p);
    salvar(listPessoas);
}
```

A tentativa de instanciar Pessoa passa pelas validações internas. Se algum dado estiver incorreto, como CPF com quantidade de dígitos errada, ocorre IllegalArgumentException antes de adicionar à lista. Se tudo estiver válido, o novo objeto é adicionado a listPessoas e o método salvar grava todo o conteúdo no arquivo.

---

## Edição de Pessoa

Para permitir edição de um registro existente, é criado um botão de seleção na JList. O código a seguir localiza o objeto selecionado e preenche os campos de texto com seus valores atuais

```java
public void butaoEditar() {
    String string = jList.getSelectedValue();
    if (string == null) {
        JOptionPane.showMessageDialog(null, "Selecione algo na lista!");
        return;
    }
    for (Pessoa p : pessoas) {
        String string2 = "| ID: " + p.getId()
                + " | Nome: " + p.getNome()
                + " | Número: " + p.getNumero()
                + " | Email: " + p.getEmail()
                + " | CPF: " + p.getCpf()
                + " | Endereço: " + p.getEndereco();
        if (string.equals(string2)) {
            jTextFieldId.setText(String.valueOf(p.getId()));
            jTextFieldNome.setText(p.getNome());
            jTextFieldEmail.setText(p.getEmail());
            jTextFieldEndereco.setText(p.getEndereco());
            jTextFieldCpf.setText(p.getCpf());
            jTextFieldNumero.setText(p.getNumero());

            p2 = p;
            jButton.setText("Salvar");
            return;
        }
    }
}
```

Se nenhum item for selecionado, exibe uma mensagem pedindo seleção. A comparação entre o texto selecionado e a string formatada de cada Pessoa permite identificar o objeto correto. Em seguida, preenchem-se campos de texto e armazena-se a referência em p2, preparando para atualização dos valores.

---

## Salvar Alterações

Quando o botão principal exibe Salvar, o código de atualização é executado

```java
private void salvar() {
    try {
        p2.setNome(jTextFieldNome.getText());
        p2.setNumero(jTextFieldNumero.getText());
        p2.setEmail(jTextFieldEmail.getText());
        p2.setCpf(jTextFieldCpf.getText());
        p2.setEndereco(jTextFieldEndereco.getText());

        jButton.setText("Criar");
        limpar();
        pessoaDAO.salvar(pessoas);
        carregarList();
    } catch (IllegalArgumentException e) {
        JOptionPane.showMessageDialog(null, e.getMessage());
    }
}
```

Cada setter de Pessoa valida o valor informado. Caso o CPF esteja fora do padrão, IllegalArgumentException é lançado e a interface exibe a mensagem de erro sem salvar dados incorretos. Se não houver exceção, altera-se o texto do botão de volta para Criar, limpa-se os campos e persiste-se novamente a lista completa, garantindo a atualização no arquivo.

---

## Fluxo do Botão Principal

A alternância entre criação e edição ocorre conforme o texto exibido

```java
public void botao() {
    if (jButton.getText().equals("Criar")) {
        criarUsuario();
        carregarList();
    } else if (jButton.getText().equals("Salvar")){
        salvar();
    }
}
```

Quando o texto do botão for Criar, ocorre a criação de um novo objeto Pessoa e gravação no arquivo. Quando o texto for Salvar, ocorre a atualização da instância p2 e regravação da lista. Dessa forma, o mesmo componente atende aos dois cenários, mantendo a lógica clara e separada.

---

## Considerações Finais

- A classe PessoaDAO centraliza leitura e gravação em arquivo binário
- A classe Pessoa concentra todas as validações de campos em seus setters
- Na interface, a seleção na JList e o preenchimento de campos ocorrem sem necessidade de lógica de validação replicada
- O fluxo de alternância entre modos criação e edição mantém o código organizado e de fácil manutenção

Esta estrutura promove organização clara entre persistência, modelo e interface, facilitando futuras alterações ou extensões.
