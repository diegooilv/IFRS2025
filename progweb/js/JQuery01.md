## 💻 Introdução ao JavaScript, jQuery e o evento document.ready

### 🎯 Objetivos

- Entender o papel do JavaScript no desenvolvimento web.
- Conhecer o que é jQuery e por que é utilizada.
- Aprender a sintaxe básica e a importância de `$(document).ready()`.
- Identificar a estrutura inicial de um script.

### 🌐 O papel do JavaScript

JavaScript é a linguagem que adiciona comportamento e interatividade às páginas no navegador. Enquanto o HTML fornece a estrutura e o CSS cuida da apresentação, o JavaScript implementa a lógica que torna a página dinâmica.

| Tecnologia     | Função principal                                      |
| :------------- | :---------------------------------------------------- |
| HTML           | Estrutura e conteúdo                                  |
| CSS            | Estilo e apresentação                                 |
| JavaScript     | Comportamento e interatividade                        |

### 🛠️ O que é jQuery?

jQuery é uma biblioteca JavaScript que simplifica tarefas comuns de manipulação do DOM, tratamento de eventos e animações. Seu objetivo é reduzir o código necessário para operações frequentes, facilitando o desenvolvimento front-end.

### 📖 Estrutura base: `$(document).ready()`

O bloco `$(document).ready()` garante que o código só será executado depois que o DOM estiver pronto. Isso evita tentativas de acessar elementos que ainda não existem na página.

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
