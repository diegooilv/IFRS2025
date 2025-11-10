## 🔎 Filtragem de produtos e o evento change

### 🎯 Objetivos

- Manipular o evento change em selects.
- Filtrar elementos usando seletores de atributo (data-categoria).
- Controlar visibilidade com .show() e .hide().
- Tratar a opção "todos" para exibir todos os produtos.

### 📥 Capturando a mudança de filtro

A filtragem ocorre sempre que a opção do select é alterada:

```javascript
$("#categoria-filtro").on("change", function () {
  const categoriaSelecionada = $(this).val();
  const $todosProdutos = $(".lista-produtos .produto");

  // ... Lógica de filtragem ...
});
```

- **`$('#categoria-filtro')`** seleciona o select do filtro.
- **`.on('change', ...)`** escuta alterações de valor.
- **`$(this).val()`** obtém a categoria selecionada.
- **`$todosProdutos`** é a coleção de todos os elementos .produto.

### ⚙️ Lógica de filtragem e visibilidade

Decide-se entre mostrar todos os produtos ou apenas os de uma categoria específica:

```javascript
if (categoriaSelecionada === "todos") {
  $todosProdutos.show();
} else {
  $todosProdutos.hide();
  $(`[data-categoria="${categoriaSelecionada}"]`).show();
}
```

- Se for "todos", todos os produtos ficam visíveis.
- Caso contrário, oculta-se tudo e exibe-se apenas os elementos cujo data-categoria corresponde à seleção, usando seletor de atributo.

### 💡 Inicialização de produtos estáticos

Se houver produtos já presentes no HTML original, é possível atribuir data-categoria e data-id para que funcionem com as rotinas de filtro e remoção:

```javascript
$(".lista-produtos .produto:nth-child(1)")
  .attr("data-categoria", "eletronicos")
  .attr("data-id", proximoId++);
$(".lista-produtos .produto:nth-child(2)")
  .attr("data-categoria", "roupas")
  .attr("data-id", proximoId++);
```

- **`:nth-child()`** seleciona elementos existentes.
- **`.attr()`** define os atributos de dados necessários.
- **`proximoId++`** garante IDs únicos para os produtos existentes.
