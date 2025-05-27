# 🖋️ Guia Profissional de Fontes no Desenvolvimento Web

Este guia ensina como usar fontes de forma profissional em projetos web, abordando boas práticas, legibilidade, responsividade, performance e acessibilidade.

---

## ✅ Tipos de Fontes

- **Serifadas (`serif`)**: clássicas, elegantes (ex: Times New Roman)
- **Sem serifas (`sans-serif`)**: modernas, limpas (ex: Arial, Roboto, Inter)
- **Monoespaçadas (`monospace`)**: ideais para código (ex: Courier New, Source Code Pro)

### Font Stack básico:

```css
font-family: "Inter", "Helvetica Neue", sans-serif;
```

> Sempre forneça fontes de fallback e limites de peso para maior compatibilidade e performance.

---

## 🌐 Google Fonts e Pré-Conexões

Para otimizar carregamento:

```html
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
  href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap"
  rel="stylesheet" />
```

Use apenas os pesos e estilos necessários e considere o parâmetro `display=swap` para evitar flash de texto invisível.

---

## 📁 Fontes Locais e @font-face

Armazene arquivos em diversos formatos para compatibilidade:

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

- **Formats**: `.woff2` (preferido), `.woff`, `.ttf`.
- **font-display: swap**: mantém UX enquanto a fonte carrega.

---

## 📏 Unidades e Tamanho Mínimo

Defina o `font-size` base no root e use unidades relativas:

```css
html {
  font-size: 16px; /* 1rem = 16px */
}
```

### Tamanho mínimo recomendado

- **Corpo de texto**: ≥ 1rem (16px)
- **Legenda/Labels**: ≥ 0.75rem (12px)

Use rem para escalabilidade e media queries para responsividade.

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

Ajuste breakpoints conforme design system do projeto.

---

## 🎨 Legibilidade e Line-Height

- **line-height** ideal: de 1.4 a 1.6 para texto corrido.
- Mais alto melhora legibilidade em blocos longos; mais baixo destaca títulos.

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

Use ferramentas como [WebAIM Contrast Checker](https://webaim.org/resources/contrastchecker/) para validar.

---

## 🚀 Performance e Subsets de Fontes

- Gere **subsets** contendo apenas caracteres usados (latim básico, números, símbolos) para reduzir peso.
- Ferramentas: [google-webfonts-helper](https://google-webfonts-helper.herokuapp.com/).

```css
@font-face {
  /* como antes, mas usando arquivos de subset reduzido */
}
```

- Prefira `font-display: swap` para performance percebida.

---

## 🧠 Boas Práticas de Escolha de Fontes

- **Contexto e Marca**: selecione fontes alinhadas ao branding e tom do site.
- **Legibilidade**: prefira famílias com boa clareza em vários tamanhos.
- **Limite**: use até 2–3 famílias de fontes distintas.
- **Combinações clássicas**: serif + sans-serif para contraste sofisticado.

---

## 📚 Fontes de Referência

- [Google Fonts](https://fonts.google.com)
- [MDN Web Docs – font](https://developer.mozilla.org/en-US/docs/Web/CSS/font)
- [CSS Tricks – Using @font-face](https://css-tricks.com/snippets/css/using-font-face/)
- [WCAG Contrast](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum/)
