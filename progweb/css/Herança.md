# 🌱 Herança no CSS

A **herança** no CSS permite que **algumas propriedades definidas em um elemento pai sejam automaticamente aplicadas aos seus filhos**. Isso ajuda a manter o código mais limpo e consistente, evitando repetições desnecessárias.

---

## 🧬 O que significa "herdar"?

Quando um elemento **herda uma propriedade**, isso quer dizer que **ele assume o mesmo valor dessa propriedade definido em seu elemento pai**, sem que você precise repetir a regra.

---

## ✅ Propriedades que herdam por padrão

Estas propriedades **são herdadas automaticamente** pelos elementos filhos:

### 🎨 Estilo de texto

- `color`
- `font-family`
- `font-size`
- `font-style`
- `font-variant`
- `font-weight`
- `letter-spacing`
- `line-height`
- `text-align`
- `text-indent`
- `text-transform`
- `visibility`
- `white-space`
- `word-spacing`
- `quotes`

---

## 🚫 Propriedades que **não** herdam por padrão

Estas propriedades **não são herdadas automaticamente** — você precisa defini-las diretamente ou forçar a herança com `inherit`:

### 📦 Layout e caixa

- `margin`
- `padding`
- `border`
- `width`
- `height`
- `max-width`
- `min-width`
- `max-height`
- `min-height`
- `box-shadow`
- `box-sizing`

### 🖼️ Aparência visual

- `background`
- `background-color`
- `background-image`
- `display`
- `position`
- `top`, `right`, `bottom`, `left`
- `z-index`
- `overflow`

### ⚙️ Comportamento e outros

- `opacity`
- `cursor`
- `float`
- `clear`
- `flex`, `grid`, `align-*`, `justify-*`
- `transition`
- `animation`
- `transform`
- `clip-path`
- `filter`

---

## 🔧 Como forçar a herança?

Use a palavra-chave `inherit` para fazer qualquer propriedade herdar o valor do pai:

```css
p {
  background-color: inherit;
}
```

---

## 🧪 Exemplo prático

```css
body {
  color: darkblue;
  font-family: Arial;
}

section {
  background-color: lightgray;
}

article {
  background-color: inherit; /* herda de section */
  color: inherit; /* herda de body */
}
```

```html
<body>
  <section>
    <article>
      <p>Texto com cor herdada do body e fundo herdado do section.</p>
    </article>
  </section>
</body>
```

---

## 📌 Resumo

| Item                    | Explicação                                                   |
| ----------------------- | ------------------------------------------------------------ |
| Herança automática      | Só para propriedades relacionadas a **texto e visibilidade** |
| Não herdadas por padrão | Propriedades de **layout**, **dimensão** e **visuais**       |
| Forçar herança          | Use `inherit` para herdar manualmente qualquer propriedade   |

---

> ℹ️ **Dica:** Usar a herança com sabedoria ajuda a manter seu CSS mais limpo e fácil de manter. Evite repetir estilos desnecessariamente!
