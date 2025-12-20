## 🗑️ Anotações: removendo produtos e delegação de eventos

Pontos-chave:

- Delegação de eventos com `.on()` no jQuery.
- Por que delegação é necessária pra elementos dinâmicos.
- Fluxo de remoção: confirmação → DOM → array.
- Usar `.closest()` e `.data()` pra localizar itens.

### 🔗 Delegação de eventos

Botões criados dinamicamente não recebem handlers ligados diretamente. A solução é delegar o evento a um ancestral estático:

```javascript
$(".lista-produtos").on("click", ".btn-retirar", function () {
  // ... Lógica de remoção ...
});
```

- O handler fica no contêiner estático (.lista-produtos).
- O callback roda apenas quando o clique ocorrer em um elemento que corresponda a '.btn-retirar', mesmo que tenha sido adicionado depois.

### 🔍 Identificando o produto a remover

Ao clicar no botão, localiza-se o article correspondente para obter o id e o nome:

```javascript
const $produtoElemento = $(this).closest(".produto");
const produtoId = parseInt($produtoElemento.data("id"));
const nomeProduto = $produtoElemento.find("strong").text();
```

- $(this).closest('.produto') sobe na hierarquia até encontrar o elemento .produto.
- .data('id') lê o atributo data-id; parseInt converte para número.
- find('strong').text() obtém o nome para a confirmação.

### 🛑 Confirmação e remoção do DOM

Pede-se confirmação antes de remover:

```javascript
if (confirm(`Tem certeza que deseja remover o produto "${nomeProduto}"?`)) {
  $produtoElemento.remove();
  // ... Remoção do Array ...
}
```

- confirm exibe caixa de diálogo com OK/Cancelar.
- $produtoElemento.remove() exclui o elemento da página.

### 📉 Atualização do array de dados

Além de remover do DOM, o produto é eliminado do array em memória:

```javascript
produtosCadastrados = produtosCadastrados.filter((p) => p.id !== produtoId);
```

- .filter cria um novo array sem o produto cujo id corresponde ao removido, mantendo os dados sincronizados com a interface.
