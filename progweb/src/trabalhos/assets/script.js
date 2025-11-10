$(document).ready(function () {
  let produtosCadastrados = [];
  let proximoId = 1;

  function adicionarProdutoAoDOM(nome, preco, categoria, imagemSrc) {
    const produtoId = proximoId++;

    produtosCadastrados.push({
      id: produtoId,
      nome: nome,
      preco: preco,
      categoria: categoria,
      imagem: imagemSrc,
    });

    const novoElementoHtml = `
            <article class="produto" data-categoria="${categoria}" data-id="${produtoId}">
                <img src="${imagemSrc}" alt="Imagem do produto ${nome}">
                <p><strong>${nome}</strong></p>
                <p>R$ ${preco.replace(".", ",")}</p>
                <button type="button" class="btn-retirar">Retirar</button>
            </article>
        `;

    $(".lista-produtos").append(novoElementoHtml);

    console.log(
      `Produto "${nome}" adicionado com sucesso com ID ${produtoId}.`
    );
  }

  $("form").on("submit", function (event) {
    event.preventDefault();

    const nome = $("#nome-produto").val();
    const preco = parseFloat($("#preco-produto").val()).toFixed(2);
    const categoria = $("#categoria-cadastro option:selected").val();
    const $imagemInput = $("#imagem-produto")[0];

    if (!nome || isNaN(preco) || !categoria) {
      alert("Por favor, preencha todos os campos obrigatórios.");
      return;
    }

    if ($imagemInput.files && $imagemInput.files[0]) {
      const file = $imagemInput.files[0];
      const reader = new FileReader();

      reader.onload = function (e) {
        const imagemSrc = e.target.result;
        adicionarProdutoAoDOM(nome, preco, categoria, imagemSrc);
      };

      reader.readAsDataURL(file);
    } else {
      const imagemSrc = "https://via.placeholder.com/150";
      adicionarProdutoAoDOM(nome, preco, categoria, imagemSrc);
    }

    this.reset();
  });

  $(".lista-produtos").on("click", ".btn-retirar", function () {
    const $produtoElemento = $(this).closest(".produto");
    const produtoId = parseInt($produtoElemento.data("id"));
    const nomeProduto = $produtoElemento.find("strong").text();

    if (confirm(`Tem certeza que deseja remover o produto "${nomeProduto}"?`)) {
      $produtoElemento.remove();
      productosCadastrados = produtosCadastrados.filter(
        (p) => p.id !== produtoId
      );
    }
  });

  $("#categoria-filtro").on("change", function () {
    const categoriaSelecionada = $(this).val();
    const $todosProdutos = $(".lista-produtos .produto");

    if (categoriaSelecionada === "todos") {
      $todosProdutos.show();
    } else {
      $todosProdutos.hide();
      $(`[data-categoria="${categoriaSelecionada}"]`).show();
    }
  });

  $(".lista-produtos .produto:nth-child(1)")
    .attr("data-categoria", "eletronicos")
    .attr("data-id", proximoId++);
  $(".lista-produtos .produto:nth-child(2)")
    .attr("data-categoria", "roupas")
    .attr("data-id", proximoId++);
});
