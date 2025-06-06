# Aula 06/06/25

## Conclusão do Sistema de Edição

Hoje foi finalizado o sistema de edição. O funcionamento segue esta ordem:

### 1. Criação de novos itens

- O usuário preenche os campos e clica no botão **"Criar"**.
- Isso pode ser feito várias vezes.
- A cada criação:

  - Um novo objeto é instanciado e adicionado a um `ArrayList`.
  - Em seguida, é chamado o método `carregarLista()`, que:

    - Lê os dados do `ArrayList`.
    - Constrói um `DefaultListModel<String>` com essas informações.
    - Seta esse modelo no `JList` da interface.

### 2. Seleção de item para edição

- O usuário clica em um item da `JList`.
- Nesse momento:

  - O botão **muda seu texto de "Criar" para "Salvar"**.
  - O sistema:

    - Obtém o texto selecionado.
    - Percorre o `ArrayList` buscando o objeto correspondente ao texto.
    - Quando encontra, guarda esse objeto em uma variável temporária para edição.

### 3. Edição e salvamento

- O usuário edita os campos e clica no botão **"Salvar"**.
- O objeto temporário é atualizado com os novos valores.
- O método `carregarLista()` é chamado novamente para atualizar a `JList` com os dados modificados.

> No projeto abaixo já existe um botão extra para edição, ao contrário do anterior que só utilizava o clique na JList. A lógica é a mesma, pois o método acionado pelo botão é simplesmente chamado também no evento correto da JList.
> [AlterarArray.zip](Projects/AlterarArray01.zip) (Clique em "Pessoa")
