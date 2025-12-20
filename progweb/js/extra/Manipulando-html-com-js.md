# Anotações: manipulando HTML com JavaScript

Resumo de como selecionar, alterar, estilizar, adicionar/remover elementos HTML e escutar eventos usando JavaScript puro.

## 📚 Índice

- [Manipulando Elementos HTML com JavaScript](#manipulando-elementos-html-com-javascript)
  - [📚 Índice](#-índice)
  - [Selecionando Elementos](#selecionando-elementos)
  - [Modificando Conteúdo](#modificando-conteúdo)
  - [Estilizando e Trabalhando com Classes](#estilizando-e-trabalhando-com-classes)
    - [Estilo direto via JavaScript](#estilo-direto-via-javascript)
    - [Manipulando classes](#manipulando-classes)
  - [Manipulando Atributos](#manipulando-atributos)
  - [Escutando Eventos](#escutando-eventos)
  - [Criando e Adicionando Elementos](#criando-e-adicionando-elementos)
  - [Removendo Elementos](#removendo-elementos)

---

## Selecionando Elementos

Você pode acessar elementos HTML usando diferentes métodos:

```js
document.getElementById("meuId");
document.getElementsByClassName("minha-classe");
document.getElementsByTagName("div");
document.querySelector(".classe-ou-id-ou-tag");
document.querySelectorAll("ul li");
```

---

## Modificando Conteúdo

Depois de selecionar um elemento, você pode alterar seu conteúdo de várias formas:

```js
elemento.textContent = "Texto visível no HTML";
elemento.innerHTML = "<strong>HTML interno</strong>";
```

---

## Estilizando e Trabalhando com Classes

### Estilo direto via JavaScript

```js
elemento.style.color = "red";
elemento.style.backgroundColor = "#ccc";
```

### Manipulando classes

```js
elemento.classList.add("ativo");
elemento.classList.remove("ativo");
elemento.classList.toggle("ativo");
```

---

## Manipulando Atributos

Você pode adicionar, obter ou remover atributos de elementos:

```js
elemento.setAttribute("href", "https://exemplo.com");
const valor = elemento.getAttribute("href");
elemento.removeAttribute("disabled");
```

---

## Escutando Eventos

Eventos como cliques, teclas e envio de formulários podem ser tratados assim:

```js
botao.addEventListener("click", () => {
  alert("Você clicou!");
});

input.addEventListener("keydown", (evento) => {
  console.log("Tecla pressionada:", evento.key);
});
```

---

## Criando e Adicionando Elementos

Você pode gerar elementos dinamicamente com JavaScript:

```js
const novoElemento = document.createElement("p");
novoElemento.textContent = "Sou novo aqui!";
document.body.appendChild(novoElemento);
```

---

## Removendo Elementos

Para remover elementos da página:

```js
const alvo = document.querySelector(".pra-remover");
alvo.remove();
```
