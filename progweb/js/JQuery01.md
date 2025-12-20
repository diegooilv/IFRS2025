## 💻 Anotações: JavaScript, jQuery e `document.ready`

Coisas pra lembrar aqui:

- HTML = estrutura
- CSS = visual
- JavaScript = comportamento/interação
- jQuery = biblioteca que facilita várias tarefas comuns no DOM

### 🌐 Papel do JavaScript

JavaScript é a linguagem que adiciona comportamento e interatividade às páginas no navegador. Enquanto o HTML fornece a estrutura e o CSS cuida da apresentação, o JavaScript implementa a lógica que torna a página dinâmica.

| Tecnologia     | Função principal                                      |
| :------------- | :---------------------------------------------------- |
| HTML           | Estrutura e conteúdo                                  |
| CSS            | Estilo e apresentação                                 |
| JavaScript     | Comportamento e interatividade                        |

### 🛠️ O que é jQuery?

jQuery é uma biblioteca JavaScript que simplifica manipulação do DOM, eventos e animações. A ideia é escrever menos código pra tarefas repetidas.

### 📖 Estrutura base: `$(document).ready()`

`$(document).ready()` garante que o código rode depois que o DOM estiver pronto (evita tentar acessar elementos que ainda não existem).

```javascript
$(document).ready(function () {
  // Todo o código jQuery/JavaScript vai aqui.
  // Será executado após o carregamento do DOM.
});
```

- `$()`: atalho para o objeto jQuery.
- `document`: refere-se ao documento HTML.
- `.ready(function() { ... })`: assegura que o DOM esteja pronto antes de manipular elementos.

Usar `ready()` evita erros ao acessar elementos que ainda não foram carregados pelo navegador.

### 🧩 Variáveis iniciais

Dentro do bloco `ready()` costuma-se inicializar variáveis que controlam os dados do aplicativo:

```javascript
let produtosCadastrados = [];
let proximoId = 1;
```

- `produtosCadastrados`: array que funciona como um banco de dados temporário em memória.
- `proximoId`: contador para gerar IDs únicos para novos produtos (inicia em 1).
