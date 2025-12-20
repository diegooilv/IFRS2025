# 🖋️ Anotações sobre fontes na Web

O que eu costumo revisar quando mexo com fontes: fallback, tamanhos mínimos, responsividade e performance.

---

## ✅ Tipos de Fontes

- **Serifadas (`serif`)**: clássicas, elegantes (ex: Times New Roman)
- **Sem serifas (`sans-serif`)**: modernas, limpas (ex: Arial, Roboto, Inter)
- **Monoespaçadas (`monospace`)**: ideais para código (ex: Courier New, Source Code Pro)

### Font Stack básico:

```css
font-family: "Inter", "Helvetica Neue", sans-serif;
```

> Nota: sempre deixar fallback e evitar “peso demais” sem necessidade.

---

## 🌐 Google Fonts e Pré-Conexões

Pra otimizar carregamento:

```html
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
  href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap"
  rel="stylesheet" />
```

Eu tento usar só os pesos/estilos que preciso e deixar `display=swap` pra evitar texto sumindo enquanto carrega.

---

## 📁 Fontes Locais e @font-face

Pra compatibilidade, costuma ser útil ter mais de um formato:

```css
@font-face {
  font-family: "MinhaFonte";
  src: url("../fonts/minhafonte.woff2") format("woff2"), url("../fonts/minhafonte.woff")
      format("woff"), url("../fonts/minhafonte.ttf") format("truetype");
  font-weight: 400;
  font-style: normal;
  font-display: swap;
}
```

- **Formatos**: `.woff2` (preferido), `.woff`, `.ttf`.
- **font-display: swap**: evita “flash” de texto invisível.

---

## 📏 Unidades e Tamanho Mínimo

Lembrete: definir `font-size` base no `html` e usar unidades relativas ajuda bastante.

```css
html {
  font-size: 16px; /* 1rem = 16px */
}
```

### Tamanho mínimo recomendado

- **Corpo de texto**: ≥ 1rem (16px)
- **Legenda/Labels**: ≥ 0.75rem (12px)

Eu prefiro `rem` pra escalar melhor e ajusto com media queries quando precisa.

---

## 🧱 Tamanhos por Ocasião

| Elemento | Tamanho sugerido | Observações                         |
| -------- | ---------------- | ----------------------------------- |
| `h1`     | 2.5rem (40px)    | Título principal                    |
| `h2`     | 2rem (32px)      | Subtítulo principal                 |
| `h3`     | 1.75rem (28px)   | Título de seção                     |
| `p`      | 1rem (16px)      | Corpo de texto                      |
| `small`  | 0.875rem (14px)  | Legendagem, notas de rodapé         |
| Botões   | 1rem–1.125rem    | Toque amigável em mobile            |
| Inputs   | ≥1rem            | Facilita leitura e entrada de dados |

---

## 📱 Exemplos de Responsividade (Media Queries)

```css
/* Tablets */
@media (max-width: 768px) {
  html {
    font-size: 15px;
  }
  h1 {
    font-size: 2.25rem;
  }
}

/* Celulares */
@media (max-width: 480px) {
  html {
    font-size: 14px;
  }
  h1 {
    font-size: 2rem;
  }
  p {
    font-size: 0.9375rem; /* 15px */
  }
}
```

Os breakpoints variam; isso aqui é só um ponto de partida.

---

## 🎨 Legibilidade e Line-Height

- **line-height** que geralmente funciona: 1.4–1.6 no texto.
- Mais alto = mais confortável em textos longos; mais baixo = destaca título.

```css
body {
  line-height: 1.5;
}
h1 {
  line-height: 1.2;
}
```

---

## ⚖️ Contraste e Acessibilidade

### Valores WCAG recomendados

- **Normal text** (≤ 18pt / ≤ 24px): relação ≥ 4.5:1
- **Large text** (> 18pt / > 24px): relação ≥ 3:1

Se eu tiver dúvida, eu confiro no [WebAIM Contrast Checker](https://webaim.org/resources/contrastchecker/).

---

## 🚀 Performance e Subsets de Fontes

- Dá pra gerar **subsets** (só os caracteres usados) pra reduzir peso.
- Ferramenta que ajuda: [google-webfonts-helper](https://google-webfonts-helper.herokuapp.com/).

```css
@font-face {
  /* como antes, mas usando arquivos de subset reduzido */
}
```

- `font-display: swap` ajuda na performance percebida.

---

## 🧠 Escolha de fontes (minhas regras)

- **Contexto**: fonte tem “cara” do projeto.
- **Legibilidade**: tem que ficar boa em vários tamanhos.
- **Limite**: tento ficar em 2–3 famílias.
- **Combinações**: serif + sans-serif costuma funcionar.

---

## 📚 Fontes de Referência

- [Google Fonts](https://fonts.google.com)
- [MDN Web Docs – font](https://developer.mozilla.org/en-US/docs/Web/CSS/font)
- [CSS Tricks – Using @font-face](https://css-tricks.com/snippets/css/using-font-face/)
- [WCAG Contrast](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum/)
