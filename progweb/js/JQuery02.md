## ⚙️ Criando elementos dinâmicos com a função adicionarProdutoAoDOM

### 🎯 Objetivos

- Compreender como gerar elementos a partir de dados do formulário.
- Entender a relação entre o array de objetos e a interface.
- Aprender a manipular o DOM com jQuery usando .append().
- Valorizar o uso de atributos data- no HTML.

### 🧱 Armazenamento e geração de dados

A função adicionarProdutoAoDOM recebe os dados do formulário, cria um objeto produto, armazena-o no array e gera o HTML correspondente para exibição.

```javascript
function adicionarProdutoAoDOM(nome, preco, categoria, imagemSrc) {
  const produtoId = proximoId++;

  // Armazena o objeto no Array
  produtosCadastrados.push({
    id: produtoId,
    nome: nome,
    preco: preco,
    categoria: categoria,
    imagem: imagemSrc,
  });

  // ...
}
```

- produtoId captura o ID atual e incrementa o contador.
- produtosCadastrados.push adiciona o novo objeto ao array.

### 🖼️ Estrutura HTML e atributos data-

O elemento HTML é criado como uma string usando template literals, o que facilita a interpolação de variáveis e a manutenção do código.

```javascript
const novoElementoHtml = `
            <article class="produto" data-categoria="${categoria}" data-id="${produtoId}">
                <img src="${imagemSrc}" alt="Imagem do produto ${nome}">
                <p><strong>${nome}</strong></p>
                <p>R$ ${preco.replace(".", ",")}</p>
                <button type="button" class="btn-retirar">Retirar</button>
            </article>
        `;
```

- data-categoria e data-id guardam metadados no próprio elemento, úteis para filtragem e remoção.
- Template literals permitem que o HTML seja escrito de forma legível e mantenha interpolação direta de variáveis.

### ➕ Inserção no DOM

O HTML gerado é inserido no contêiner de produtos com .append(), fazendo com que o novo item apareça imediatamente na interface.

```javascript
$(".lista-produtos").append(novoElementoHtml);
```
