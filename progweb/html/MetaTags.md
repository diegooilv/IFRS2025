# 🧠 Entendendo as meta tags no HTML

As **meta tags** são elementos do HTML colocados dentro da `<head>` e que servem para fornecer **informações sobre a página** para navegadores, mecanismos de busca (como o Google), redes sociais e dispositivos.

> Elas **não aparecem visualmente** na página, mas têm grande importância técnica!

---

## 📍 Estrutura básica

```html
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="Descrição da sua página" />
  <title>Título da Página</title>
</head>
```

---

## 🔍 Explicando as principais meta tags

| Tag                              | Função                                                                 |
| -------------------------------- | ---------------------------------------------------------------------- |
| `<meta charset="UTF-8">`         | Define o conjunto de caracteres (UTF-8 aceita acentuação, emojis etc). |
| `<meta name="viewport"...>`      | Faz o layout se adaptar a diferentes telas (celular, tablet, etc.).    |
| `<meta name="description"...>`   | Descreve o conteúdo da página para buscadores (ex: Google).            |
| `<meta name="author"...>`        | Diz quem criou o conteúdo da página.                                   |
| `<meta name="robots"...>`        | Controla se motores de busca devem indexar a página.                   |
| `<meta http-equiv="refresh"...>` | Atualiza ou redireciona a página após alguns segundos.                 |

---

## ✍️ Exemplos práticos

### Descrição e autor

```html
<meta
  name="description"
  content="Este site é um projeto de estudo de HTML no IFRS." />
<meta name="author" content="Seu Nome" />
```

### Viewport (responsividade)

```html
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
```

### Evitar indexação por buscadores (ex: páginas em construção)

```html
<meta name="robots" content="noindex, nofollow" />
```

---

## 🌐 Extra: Open Graph e Twitter Cards

São meta tags especiais usadas para **melhorar o compartilhamento da sua página** em redes sociais.

### Exemplo (Open Graph para Facebook):

```html
<meta property="og:title" content="Meu Projeto Web" />
<meta
  property="og:description"
  content="Veja os projetos feitos no curso de Desenvolvimento Web." />
<meta property="og:image" content="https://meusite.com/imagem.png" />
<meta property="og:url" content="https://meusite.com" />
```

### Para Twitter:

```html
<meta name="twitter:card" content="summary_large_image" />
<meta name="twitter:title" content="Meu Projeto Web" />
<meta
  name="twitter:description"
  content="Confira o que desenvolvemos no IFRS!" />
<meta name="twitter:image" content="https://meusite.com/imagem.png" />
```

---

## ✅ Conclusão

As meta tags são essenciais para garantir que sua página:

- Esteja **acessível e responsiva**;
- Tenha **boa visibilidade em buscadores**;
- Seja **compartilhável em redes sociais** com visual bonito;
- Siga **boas práticas de SEO e acessibilidade**.

> ⚠️ Embora muitas meta tags sejam opcionais, é recomendado incluir pelo menos as básicas (`charset`, `viewport`, `description`, `title`).

---
