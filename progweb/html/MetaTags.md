# 🧠 Meta Tags no HTML

As **meta tags** são inseridas dentro do `<head>` do HTML. Elas servem para fornecer informações sobre a página para navegadores, mecanismos de busca e redes sociais.  
Embora invisíveis ao usuário, são fundamentais para **acessibilidade, indexação (SEO)**, compatibilidade e visual em compartilhamentos.

---

## 📌 Meta Tags Comuns (HTML5)

```html
<!-- Codificação de caracteres -->
<meta charset="UTF-8" />

<!-- Responsividade para dispositivos móveis -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- Descrição da página (aparece em buscadores) -->
<meta name="description" content="Descrição breve da página." />

<!-- Palavras-chave (não tão usadas atualmente, mas válidas) -->
<meta name="keywords" content="HTML, CSS, JavaScript, Web, IFRS" />

<!-- Autor da página -->
<meta name="author" content="Seu Nome" />

<!-- Indexação por robôs de busca -->
<meta name="robots" content="index, follow" />

<!-- Compatibilidade com versões antigas do Internet Explorer -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- Tipo e codificação do conteúdo -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<!-- Atualização automática da página (a cada 30s neste exemplo) -->
<meta http-equiv="refresh" content="30" />
```

---

## 📱 Meta Tags para Mobile

```html
<!-- Cor da barra de navegação no Chrome Android -->
<meta name="theme-color" content="#0d1117" />

<!-- Impede que o Safari/iOS transforme números em links de telefone -->
<meta name="format-detection" content="telephone=no" />
```

---

## 🔗 Meta Tags Sociais (Open Graph + Twitter)

Essas tags controlam como seu site aparece ao ser compartilhado em redes sociais.

### Open Graph (Facebook, WhatsApp, LinkedIn etc.)

```html
<meta property="og:title" content="Título da Página" />
<meta property="og:description" content="Descrição curta e atrativa." />
<meta property="og:image" content="https://seusite.com/imagem.jpg" />
<meta property="og:url" content="https://seusite.com/" />
<meta property="og:type" content="website" />
```

### Twitter Cards

```html
<meta name="twitter:card" content="summary_large_image" />
<meta name="twitter:title" content="Título para Twitter" />
<meta name="twitter:description" content="Descrição para o Twitter" />
<meta name="twitter:image" content="https://seusite.com/imagem.jpg" />
```

---

## 🧪 Meta Tags Específicas ou Avançadas

| Meta Tag                                                     | Finalidade                                                  |
| ------------------------------------------------------------ | ----------------------------------------------------------- |
| `<meta name="generator" content="Visual Studio Code">`       | Ferramenta usada na criação (opcional)                      |
| `<meta name="rating" content="general">`                     | Classificação de conteúdo (ex: general, mature)             |
| `<meta name="revisit-after" content="7 days">`               | Sugere com que frequência os robôs devem revisitar a página |
| `<meta name="copyright" content="2025, IFRS">`               | Informação de direitos autorais                             |
| `<meta name="language" content="pt-br">`                     | Idioma da página                                            |
| `<meta name="distribution" content="global">`                | Alcance do conteúdo (global, local, etc.)                   |
| `<meta name="identifier-url" content="https://seusite.com">` | URL oficial da página                                       |

---

## 📚 Lista completa de meta tags no W3Schools

Para uma visão ainda mais abrangente, veja:

🔗 **[Meta Tags - Lista completa (W3Schools)](https://www.w3schools.com/tags/tag_meta.asp)**

---

## ✅ Conclusão

As meta tags são essenciais para tornar seu site:

- Otimizado para buscadores (SEO)
- Compatível com diversos dispositivos
- Bonito ao ser compartilhado em redes sociais

> Este material foi produzido de forma **autônoma**, com base em **fontes livres e atualizadas da web**.
