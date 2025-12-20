# 🌐 Anotações: introdução à programação web

Antes de escrever código, vale entender o que acontece quando um site carrega. A ideia começa com **hipertexto**.

---

## 🔗 O que é hipertexto?

Analogia: lendo um livro e, ao clicar numa palavra, ela leva para outra página (ou outro livro).

Isso é **hipertexto**: conteúdo conectado por links.
É o que faz a web ser uma “teia” (web) de informações conectadas.

- Texto comum = você lê do início ao fim.
- Hipertexto = você **navega** entre partes conectadas.

O HTML é a **linguagem do hipertexto**.

---

## 🌍 Como a web funciona?

Analogia: internet como uma cidade com bibliotecas. O navegador pede “livros” (páginas) para “bibliotecários” (servidores).

- Digita um endereço (ex.: `gatinhos.com`)
- O navegador manda um pedido
- O servidor responde com o conteúdo

Esse processo usa regras de comunicação chamadas **HTTP**.

---

## 📡 O que é HTTP?

HTTP = *HyperText Transfer Protocol*  
Ou seja, **protocolo de transferência de hipertexto**.

Ele define como o navegador **pede** páginas e como o servidor **responde**.

Exemplo de uma troca:

1. Navegador: “Quero a página `/gatinhos.html`”
2. Servidor: “Tá aqui! 🐱”

Toda vez que você visita um site, está rolando uma conversa invisível como essa.

---

## 🧠 E o HTML?

O HTML é a “linguagem do hipertexto”. Ele descreve o conteúdo da página. Exemplo:

```html
<h1>Bem-vindo!</h1>
<p>Veja mais sobre <a href="gatos.html">gatinhos</a>.</p>
```

Acima temos:
- Um título (`<h1>`)
- Um parágrafo (`<p>`)
- Um **link** clicável (`<a href="...">`) → isso é o **hipertexto em ação**!

---

## 🧩 O que mais compõe uma página web?

Além do HTML, temos:

| Linguagem | Papel na página |
|-----------|-----------------|
| HTML      | Estrutura e conteúdo |
| CSS       | Estilo e aparência (cores, fontes, layout) |
| JavaScript| Comportamento e interações (menus, cliques, animações) |

---

## 🚀 Próximos trimestres

No curso, a sequência típica é:

- Criar páginas com HTML ✍️
- Estilizar com CSS 🎨
- Adicionar interação com JavaScript ⚙️

---

> ℹ️ **Observação**: Material baseado em fontes públicas e boas práticas, reorganizado para fins didáticos.
