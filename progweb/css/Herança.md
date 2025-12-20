# 🌱 Anotações: herança no CSS

Herança = algumas propriedades do “pai” passam pros filhos automaticamente (principalmente as de texto).

---

## 🧬 O que significa "herdar"?

Se o pai tem um valor, o filho pode acabar usando o mesmo sem eu repetir CSS.

---

## ✅ O que costuma herdar (padrão)

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

## 🚫 O que normalmente NÃO herda

Essas aqui eu geralmente preciso definir direto no elemento (ou forçar com `inherit`).

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

## 🔧 Forçar herança

`inherit` força pegar o valor do pai:

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

> ℹ️ Nota: se eu repetir muita coisa, talvez dê pra puxar via herança (ou criar uma classe).
