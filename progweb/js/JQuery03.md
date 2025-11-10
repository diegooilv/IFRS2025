## 📝 Captura de dados e evento de formulário (submit)

### 🎯 Objetivos

- Captar o evento de submissão de formulário com jQuery.
- Prevenir o comportamento padrão do formulário usando event.preventDefault().
- Ler valores de inputs com .val().
- Aplicar validação simples antes do cadastro.

### 📥 Capturando o submit

O formulário dispara o evento submit quando o usuário tenta enviá-lo. É comum interceptar esse evento para processar os dados sem recarregar a página.

```javascript
$("form").on("submit", function (event) {
  event.preventDefault();

  // ...
});
```

- **`$('form')`**: seleciona o formulário.
- **`.on('submit', ...`**: anexa o handler para a submissão.
- **`event.preventDefault()`**: evita o reload padrão do navegador.

### 🔎 Leitura e preparação dos dados

Dentro do handler, os valores dos campos são lidos e preparados:

```javascript
const nome = $("#nome-produto").val();
const preco = parseFloat($("#preco-produto").val()).toFixed(2);
const categoria = $("#categoria-cadastro option:selected").val();
const $imagemInput = $("#imagem-produto")[0];
```

- **`.val()`** recupera o valor atual dos inputs.
- **`parseFloat(...).toFixed(2)`** normaliza o preço com duas casas decimais.
- **`option:selected`** obtém a opção escolhida no select.
- **`[0]`** retorna o elemento DOM nativo necessário para trabalhar com FileReader.

### 🛡️ Validação simples

Antes de cadastrar, verifica-se se os campos obrigatórios foram preenchidos:

```javascript
if (!nome || isNaN(preco) || !categoria) {
  alert("Por favor, preencha todos os campos obrigatórios.");
  return;
}
```

- **`!nome`** detecta string vazia.
- **`isNaN(preco)`** detecta conversão inválida de número.
- **`return`** interrompe o fluxo em caso de dados incompletos.

### 🖼️ Tratamento de imagens

O restante do fluxo lida com o upload/visualização de imagens usando FileReader (explicado em detalhe em outro módulo).
