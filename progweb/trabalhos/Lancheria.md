# Semântica e Estrutura da Página "Sabor & Prosa"

Este documento resume de forma simples a semântica e a estrutura HTML.

## Desenho Esquemático

![Desenho Esquemático](img/lancheria/desenho%20esquemático.png)

## Estrutura Geral

- `<!DOCTYPE html>`: define o documento como HTML5.
- `<html lang="pt-BR">`: especifica o idioma (Português do Brasil).
- `<head>`: metadados da página (charset, viewport, título).
- `<body>`: contém todo o conteúdo visível, organizado em:
  - `<header>`: cabeçalho
    - `<h1>`: título principal
    - `<nav>`: menu de navegação (links para seções internas)
  - `<main>`: conteúdo principal
    - `<section id="sobre">`: seção "Sobre Nós"
      - `<h2>`: subtítulo da seção
      - `<p>`: parágrafos descritivos
    - `<section id="produtos">`: seção "Nossos Produtos"
      - `<h2>`: subtítulo da seção
      - `<ul>`: lista de produtos
        - `<li>`: item de lista
          - `<article>`: bloco semântico de cada produto
            - `<h3>`: nome do produto
            - `<p><data value="...">...`: preço com valor para máquina
            - `<p>`: descrição do produto
            - `<figure>`: figura ilustrativa
              - `<img>`: imagem do produto
              - `<figcaption>`: legenda da imagem
  - `<footer>`: rodapé
    - `<address>`: informações de contato (telefone, e-mail)

## Semântica dos Elementos

- **`<header>`**, **`<main>`**, **`<footer>`**: delimitam as áreas principais da página.
- **`<nav>`**: agrupa links de navegação.
- **`<section>`**: define blocos temáticos independentes.
- **`<article>`**: representa um conteúdo autônomo (cada produto).
- **`<h1>`**, **`<h2>`**, **`<h3>`**: estabelecem hierarquia de títulos.
- **`<data>`**: associa um valor numérico (preço) ao texto exibido, facilitando processamento.
- **`<figure>`** + **`<figcaption>`**: relacionam imagem e legenda de forma semântica.
- **`<address>`**: indica informações de contato.

---

> [Lancheria.html](../src/trabalhos/Lancheria.html)

---

> [https://progweb.pages.dev/Lancheria](https://progweb.pages.dev/trabalhos/Lancheria)
