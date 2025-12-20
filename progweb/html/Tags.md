# 🏷️ Anotações: tags HTML

HTML é a linguagem usada para construir páginas web. As peças principais são as **tags**.

---

## 🧠 O que é uma tag?

Analogia: uma página HTML é como uma **caixa de Lego**; as **tags** são os blocos da estrutura.

Cada tag define um pedaço do conteúdo: título, parágrafo, imagem, link, lista… tudo é uma tag!

---

## 🧱 Estrutura de uma tag

A maioria das tags tem uma **tag de abertura** e uma **tag de fechamento**, assim:

```html
<p>Esse é um parágrafo.</p>
```

- `<p>` → abertura
- `</p>` → fechamento
- Tudo que estiver no meio é o conteúdo da tag.

🔹 Algumas tags são **auto-fechadas**, como imagens:

```html
<img src="gato.jpg" alt="Um gatinho fofo" />
```

---

## 🔍 Tags comuns

| Tag             | Função                       | Exemplo                                      |
| --------------- | ---------------------------- | -------------------------------------------- |
| `<h1>` a `<h6>` | Títulos, do maior ao menor   | `<h1>Meu título</h1>`                        |
| `<p>`           | Parágrafos                   | `<p>Texto do parágrafo</p>`                  |
| `<a>`           | Links (âncoras)              | `<a href="https://site.com">Clique aqui</a>` |
| `<img>`         | Imagens                      | `<img src="foto.jpg" alt="Descrição">`       |
| `<ul>`          | Lista não ordenada           | `<ul><li>Item</li></ul>`                     |
| `<ol>`          | Lista ordenada               | `<ol><li>Item</li></ol>`                     |
| `<li>`          | Item de uma lista            | `<li>Item da lista</li>`                     |
| `<strong>`      | Destaque em negrito          | `<strong>Importante!</strong>`               |
| `<em>`          | Ênfase (itálico)             | `<em>Observe isso</em>`                      |
| `<br>`          | Quebra de linha (sem fechar) | `Primeira linha<br>Segunda linha`            |

---

## 🌐 Exemplo completo (mini página)

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Minha Primeira Página</title>
  </head>
  <body>
    <h1>Olá, mundo!</h1>
    <p>Essa é a minha primeira página web. 🎉</p>
    <a href="https://exemplo.com">Visite meu site</a>
    <img src="gato.jpg" alt="Um gatinho fofo" />
  </body>
</html>
```

## 🧠 HTML semântico

HTML semântico é usar **tags que representam o significado do conteúdo**.

Em vez de usar `<div>` pra tudo (“caixa genérica”), usar tags que **descrevem o que está ali**.

---

### 🧾 Exemplo semântico vs. genérico:

❌ Código genérico:

```html
<div>
  <div>Meu Título</div>
  <div>Meu parágrafo de texto.</div>
</div>
```

✅ Código semântico:

```html
<article>
  <h1>Meu Título</h1>
  <p>Meu parágrafo de texto.</p>
</article>
```

---

### 🧩 Algumas tags semânticas úteis:

| Tag         | Significado                                       |
| ----------- | ------------------------------------------------- |
| `<header>`  | Cabeçalho da página ou de uma seção               |
| `<nav>`     | Navegação (menus, links importantes)              |
| `<main>`    | Conteúdo principal da página                      |
| `<section>` | Uma seção do conteúdo                             |
| `<article>` | Um artigo ou conteúdo independente                |
| `<aside>`   | Conteúdo lateral (como barras laterais ou extras) |
| `<footer>`  | Rodapé da página                                  |

---

### 🦾 Por que usar?

- ✅ **Organiza o código**
- ✅ **Ajuda na acessibilidade** (leitores de tela entendem melhor)
- ✅ **Melhora o SEO** (os buscadores entendem o que é mais relevante)
- ✅ **Facilita manutenção**

---

### 🧪 Exemplo simples com semântica:

```html
<main>
  <article>
    <header>
      <h1>Notícia Importante</h1>
      <p>Publicado em 2025</p>
    </header>
    <p>Este é o conteúdo da notícia...</p>
    <footer>Autor: Fulano</footer>
  </article>
</main>
```

---

## 📌 Lembrete

Nem todas as tags **são visíveis** na página!  
Algumas servem pra dar estrutura e **informações ao navegador**, como:

```html
<head>
  <title>Título da aba</title>
</head>
```

Outras ajudam a **organizar** a página:

- `<div>` → divisão genérica (tipo uma caixa invisível)
- `<span>` → destaque dentro de uma linha
- `<section>` → separa blocos de conteúdo relacionado
- `<article>` → conteúdo independente (como um produto, notícia ou post)
- `<nav>` → agrupamento de links de navegação
- `<aside>` → conteúdo secundário (como uma barra lateral, publicidade, sugestões)
- `<header>` → cabeçalho de uma página ou de uma seção
- `<footer>` → rodapé da página ou de uma seção
- `<main>` → conteúdo principal único da página
- `<address>` → informações de contato
- `<figure>` → agrupa uma imagem com sua legenda
- `<figcaption>` → legenda de uma `<figure>`
- `<dl>` → lista de definições (pares de termo e descrição)
- `<dt>` → termo da lista de definições
- `<dd>` → descrição do termo em uma lista de definições
- `<fieldset>` → agrupa campos de formulário relacionados
- `<legend>` → legenda para um `<fieldset>`

---

## ✅ Resumo

As **tags** dizem ao navegador o que é cada parte do conteúdo e como organizar a estrutura.

---

> ℹ️ **Observação**: Material baseado em fontes públicas e boas práticas, reorganizado para fins didáticos.
