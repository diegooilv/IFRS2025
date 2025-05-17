# Aula 16/05/2024

Este documento apresenta o **modelo de aplicação desktop** baseado em `JDesktopPane` e múltiplas telas (`JPanel`), cada uma com sua funcionalidade específica. Inclui exemplos de implementações de controladores e modelos para diferentes entidades.

> **Projeto completo**: [Concessionária (.zip)](Projects/Concessionaria.zip)

---

## Controlador da Tela Principal

Gerencia a troca dinâmica de telas dentro do `JDesktopPane`.

```java
public class ControladorTela {

    private JDesktopPane jDesktopPane;

    public ControladorTela(JDesktopPane jDesktopPane) {
        this.jDesktopPane = jDesktopPane;
    }

    public void carro() {
        jDesktopPane.removeAll();
        jDesktopPane.updateUI();
        Dimension size = jDesktopPane.getSize();
        Carro view = new Carro();
        view.setSize(size);
        view.setLocation(0, 0);
        jDesktopPane.add(view);
        view.setVisible(true);
    }

    public void moto() {
        jDesktopPane.removeAll();
        jDesktopPane.updateUI();
        Dimension size = jDesktopPane.getSize();
        Moto view = new Moto();
        view.setSize(size);
        view.setLocation(0, 0);
        jDesktopPane.add(view);
        view.setVisible(true);
    }

    public void pessoa() {
        jDesktopPane.removeAll();
        jDesktopPane.updateUI();
        Dimension size = jDesktopPane.getSize();
        Pessoa view = new Pessoa();
        view.setSize(size);
        view.setLocation(0, 0);
        jDesktopPane.add(view);
        view.setVisible(true);
    }

    public void aviao() {
        jDesktopPane.removeAll();
        jDesktopPane.updateUI();
        Dimension size = jDesktopPane.getSize();
        Aviao view = new Aviao();
        view.setSize(size);
        view.setLocation(0, 0);
        jDesktopPane.add(view);
        view.setVisible(true);
    }
}
```

---

## Controlador de Entidades

Cada controlador gerencia:

- **Salvar** dados do formulário.
- **Limpar** campos após operação.
- **Carregar** e atualizar a lista exibida.

### Controlador de Pessoa

```java
public class ControladorPessoa {

    private Pessoa p;
    private ArrayList<Pessoa> arrayListPessoas;
    private ArrayList<String> arrayListStrings;
    private JList jList;
    private DefaultListModel defaultListModel;
    //
    private JTextField jTextFieldNome;
    private JTextField jTextFieldCpf;
    private JTextField jTextFieldEmail;
    private JTextField jTextFieldIdade;
    private JTextField jTextFieldCidade;

    public ControladorPessoa(JList jList, JTextField jTextFieldNome, JTextField jTextFieldCpf, JTextField jTextFieldEmail, JTextField jTextFieldIdade, JTextField jTextFieldCidade) {
        this.jList = jList;
        this.jTextFieldNome = jTextFieldNome;
        this.jTextFieldCpf = jTextFieldCpf;
        this.jTextFieldEmail = jTextFieldEmail;
        this.jTextFieldIdade = jTextFieldIdade;
        this.jTextFieldCidade = jTextFieldCidade;
        arrayListPessoas = new ArrayList<>();
        arrayListStrings = new ArrayList<>();
        defaultListModel = new DefaultListModel();
    }

    public void salvar() {
        p = new Pessoa(
                jTextFieldNome.getText(),
                jTextFieldCpf.getText(),
                jTextFieldEmail.getText(),
                Integer.parseInt(jTextFieldIdade.getText()),
                jTextFieldCidade.getText());
        arrayListPessoas.add(p);
    }

    public void limpar() {
        jTextFieldNome.setText("");
        jTextFieldCpf.setText("");
        jTextFieldEmail.setText("");
        jTextFieldIdade.setText("");
        jTextFieldCidade.setText("");
    }

    public void carregar() {
        defaultListModel.clear();
        arrayListStrings.clear();
        for (Pessoa pe : arrayListPessoas) {
            String info = String.format(
                    " | Nome: %s | CPF: %s | Email: %s | Idade: %d | Cidade: %s |",
                    pe.getNome(),
                    pe.getCpf(),
                    pe.getEmail(),
                    pe.getIdade(),
                    pe.getCidade()
            );
            arrayListStrings.add(info);
        }
        defaultListModel.addAll(arrayListStrings);
        jList.setModel(defaultListModel);
    }
}
```

### Controlador de Carro

```java
public class ControladorCarro {

    private Carro c;
    private ArrayList<Carro> arrayListCarros;
    private ArrayList<String> arrayListStrings;
    private JList jList;
    private DefaultListModel defaultListModel;

    private JTextField jTextFieldMarca;
    private JTextField jTextFieldModelo;
    private JTextField jTextFieldCor;
    private JTextField jTextFieldAno;
    private JTextField jTextFieldPlaca;

    public ControladorCarro(JList jList, JTextField jTextFieldMarca, JTextField jTextFieldModelo, JTextField jTextFieldCor, JTextField jTextFieldAno, JTextField jTextFieldPlaca) {
        this.jList = jList;
        this.jTextFieldMarca = jTextFieldMarca;
        this.jTextFieldModelo = jTextFieldModelo;
        this.jTextFieldCor = jTextFieldCor;
        this.jTextFieldAno = jTextFieldAno;
        this.jTextFieldPlaca = jTextFieldPlaca;
        arrayListCarros = new ArrayList<>();
        arrayListStrings = new ArrayList<>();
        defaultListModel = new DefaultListModel();
    }

    public void salvar() {
        c = new Carro(
                jTextFieldMarca.getText(),
                jTextFieldModelo.getText(),
                jTextFieldCor.getText(),
                Integer.parseInt(jTextFieldAno.getText()),
                jTextFieldPlaca.getText()
        );
        arrayListCarros.add(c);
    }

    public void limpar() {
        jTextFieldMarca.setText("");
        jTextFieldModelo.setText("");
        jTextFieldCor.setText("");
        jTextFieldAno.setText("");
        jTextFieldPlaca.setText("");
    }

    public void carregar() {
        defaultListModel.clear();
        arrayListStrings.clear();
        for (Carro ca : arrayListCarros) {
            String info = String.format(
                    " | Marca: %s | Modelo: %s | Cor: %s | Ano: %d | Placa: %s |",
                    ca.getMarca(),
                    ca.getModelo(),
                    ca.getCor(),
                    ca.getAno(),
                    ca.getPlaca()
            );
            arrayListStrings.add(info);
        }
        defaultListModel.addAll(arrayListStrings);
        jList.setModel(defaultListModel);
    }
}

```

### Controlador de Moto e Avião

> Implementações similares aos controladores anteriores, adaptadas aos construtores e atributos de cada modelo.

---

## Modelo de Dados

Exemplo de classe modelo que representa uma pessoa:

```java
public class Pessoa {
    // nome, CPF, e-mail, idade, cidade
    private String nome;
    private String cpf;
    private String email;
    private int idade;
    private String cidade;

    public Pessoa(String nome, String cpf, String email, int idade, String cidade) {
        this.nome = nome;
        this.cpf = cpf;
        this.email = email;
        this.idade = idade;
        this.cidade = cidade;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }
}
```

Modelos de `Carro`, `Moto` e `Aviao` seguem o mesmo padrão.

---

## Dicas de Integração

- **Inicialize** cada controlador dentro de seu respectivo `JPanel`.
- **Configure** listeners nos botões para chamar `salvar()`, `carregar()` e `limpar()`.

## Execute o Projeto! [Baixe Aqui (.jar)](Dist/Aula09/Concessionaria.jar)

---

> **Observação:** Tanto o código quanto esta documentação foram desenvolvidos de forma independente, com base no conteúdo teórico apresentado em aula. Não houve participação direta do docente na construção do material.
