# Aula 30/05/2025

O objetivo desta aula é alterar a maneira como o ID é gerado na aplicação, delegando essa responsabilidade ao programa em vez de deixá-la sob controle do usuário. Essa abordagem garante maior consistência e evita possíveis erros relacionados à entrada manual de dados.

## Alteração no Controlador

A principal alteração ocorre no método `gerarId`, que agora será responsável por calcular automaticamente o próximo ID com base nos elementos já existentes no `ArrayList`.

```java
private int gerarId() {
    // Retorna 0 se o ArrayList estiver vazio; caso contrário, retorna o último ID + 1.
    return arrayListCarro.isEmpty() ? 0 : arrayListCarro.getLast().getId() + 1;
}
```

> **Observação**: Caso `getLast()` não funcione, troque por: `arrayListCarro.get(arrayListCarro.size() - 1)`.

---

## Exemplo de Controlador Completo

Abaixo está um exemplo completo do controlador implementado:

```java
public final class ControladorCarro {

    // Componentes da interface gráfica
    JTextField jTextFieldId;
    JTextField jTextFieldModelo;
    JTextField jTextFieldMarca;
    JList<String> jList;

    // Estruturas de dados
    ArrayList<String> arrayListStrings;
    ArrayList<Carro> arrayListCarro;

    // Modelo para a lista
    DefaultListModel<String> defaultListModel;

    /**
     * Construtor do ControladorCarro.
     */
    public ControladorCarro(JTextField jTextFieldId, JTextField jTextFieldModelo, JTextField jTextFieldMarca, JList<String> jList) {
        this.jTextFieldId = jTextFieldId;
        this.jTextFieldModelo = jTextFieldModelo;
        this.jTextFieldMarca = jTextFieldMarca;
        this.jList = jList;

        // Inicialização das estruturas de dados
        arrayListStrings = new ArrayList<>();
        arrayListCarro = new ArrayList<>();
        defaultListModel = new DefaultListModel<>();

        // Configurações iniciais
        this.jTextFieldId.setEditable(false);
        this.jTextFieldId.setFocusable(false);
        limpar();
    }

    /**
     * Limpa os campos da interface gráfica.
     */
    public void limpar() {
        jTextFieldId.setText(String.valueOf(gerarId()));
        jTextFieldMarca.setText("");
        jTextFieldModelo.setText("");
    }

    /**
     * Gera o próximo ID disponível.
     */
    public int gerarId() {
        return arrayListCarro.isEmpty() ? 0 : arrayListCarro.get(arrayListCarro.size() - 1).getId() + 1;
    }

    /**
     * Salva um novo carro no ArrayList.
     */
    public void salvar() {
        Carro c = new Carro(
            Integer.parseInt(jTextFieldId.getText()),
            jTextFieldModelo.getText(),
            jTextFieldMarca.getText()
        );
        arrayListCarro.add(c);
    }

    /**
     * Carrega os dados do ArrayList para a JList.
     */
    public void carregar() {
        arrayListStrings.clear();
        defaultListModel.clear();

        for (Carro co : arrayListCarro) {
            arrayListStrings.add("Modelo: " + co.getModelo() + " | Marca: " + co.getMarca());
        }

        // Ordena a lista de strings antes de exibi-la
        Collections.sort(arrayListStrings);
        defaultListModel.addAll(arrayListStrings);
        jList.setModel(defaultListModel);
    }

    /**
     * Registra um novo usuário (carro) e atualiza a interface.
     */
    public void novoUsuario() {
        salvar();
        carregar();
        limpar();
    }
}
```

> **Nota sobre Encapsulamento**: O encapsulamento não foi priorizado nesta implementação, pois o foco era testar funcionalidades sem restrições.

---

## Observações Adicionais

Além do controlador de carros, o programa também inclui telas para **Moto** e **Pessoa**. A lógica para **Moto** é praticamente idêntica à de **Carro**, enquanto a tela de **Pessoa** apresenta funcionalidades adicionais. **Teste!**

---

## Teste

Você pode baixar e testar o programa diretamente nos links abaixo:

- [Download do Executável (.jar)](Dist/Aula11/AlterarArray.jar)
- [Download do Projeto (.zip)](Projects/AlterarArray01.zip)
