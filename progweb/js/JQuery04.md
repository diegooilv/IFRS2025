## 🖼️ Lidando com imagens e a API FileReader

### 🎯 Objetivos

- Entender por que usar FileReader para carregar imagens localmente.
- Conhecer o fluxo assíncrono de leitura de arquivos.
- Saber o que é um Data URL e como usá-lo no atributo src.
- Tratar casos em que nenhuma imagem é fornecida.

### 📂 A limitação do acesso a arquivos locais

Por segurança, o JavaScript não pode usar caminhos locais direto do disco. Para exibir imagens selecionadas antes de enviá-las a um servidor, utiliza-se FileReader para gerar um Data URL.

```javascript
if ($imagemInput.files && $imagemInput.files[0]) {
  const file = $imagemInput.files[0];
  const reader = new FileReader();

  // ... Lógica de leitura ...
} else {
  // ... Lógica padrão para quando não há arquivo ...
}
```

- $imagemInput.files guarda a lista de arquivos selecionados.
- Verifica-se se há pelo menos um arquivo antes de prosseguir.

### ⚡ Leitura assíncrona com FileReader

A leitura é assíncrona; ao concluir, o evento onload fornece o Data URL.

```javascript
reader.onload = function (e) {
  const imagemSrc = e.target.result;
  adicionarProdutoAoDOM(nome, preco, categoria, imagemSrc);
};

reader.readAsDataURL(file);
```

- reader.onload é executado quando a leitura termina.
- e.target.result contém o Data URL (string codificada) que pode ser usado diretamente em src de <img>.
- reader.readAsDataURL inicia a leitura do arquivo.

### ⏸️ Plano B: imagem padrão

Se não houver arquivo selecionado, usa-se uma imagem placeholder para manter a consistência visual.

```javascript
} else {
    const imagemSrc = "https://via.placeholder.com/150";
    adicionarProdutoAoDOM(nome, preco, categoria, imagemSrc);
}
```

### 🧹 Limpeza do formulário

Ao final do processamento, o formulário é resetado para preparar o próximo cadastro:

```javascript
this.reset();
```

- this.reset() limpa todos os campos, incluindo o input de arquivo.
