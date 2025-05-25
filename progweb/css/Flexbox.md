# 🎯 CSS: Flexbox

O Flexbox (Flexible Box) é um modelo de layout do CSS que **facilita a distribuição de espaço** entre os elementos de um container, mesmo quando o tamanho deles é desconhecido ou dinâmico.

---

## 🧱 Estrutura básica

```css
.container {
  display: flex;
}
```

A propriedade `display: flex` transforma o elemento em um **flex container**, e todos os seus filhos se tornam **itens flexíveis**.

---

## 🗺️ Eixos principais

O Flexbox trabalha com **dois eixos**:

- **Eixo principal (main axis):** direção dos itens (`row` ou `column`)
- **Eixo cruzado (cross axis):** perpendicular ao eixo principal

| `flex-direction` | Eixo principal | Sentido dos itens      |
| ---------------- | -------------- | ---------------------- |
| `row` (padrão)   | horizontal     | da esquerda p/ direita |
| `row-reverse`    | horizontal     | da direita p/ esquerda |
| `column`         | vertical       | de cima p/ baixo       |
| `column-reverse` | vertical       | de baixo p/ cima       |

---

## 🧩 Propriedades do Container

### `display: flex`

Ativa o flexbox.

---

### `flex-direction`

Define a direção do eixo principal.

```css
.container {
  flex-direction: row; /* padrão */
}
```

---

### `justify-content`

Alinha os itens ao longo do eixo principal.

| Valor           | Alinhamento                             |
| --------------- | --------------------------------------- |
| `flex-start`    | Início do eixo (padrão)                 |
| `flex-end`      | Final do eixo                           |
| `center`        | Centralizado                            |
| `space-between` | Espaço igual entre os itens             |
| `space-around`  | Espaço igual ao redor dos itens         |
| `space-evenly`  | Espaço **exatamente igual** entre todos |

---

### `align-items`

Alinha os itens no **eixo cruzado**.

| Valor        | Alinhamento                    |
| ------------ | ------------------------------ |
| `stretch`    | Estica para ocupar o container |
| `flex-start` | Alinha no início               |
| `flex-end`   | Alinha no final                |
| `center`     | Centralizado                   |
| `baseline`   | Alinha com base no texto       |

---

### `flex-wrap`

Permite que os itens quebrem linha.

```css
.container {
  flex-wrap: wrap;
}
```

| Valor          | Comportamento                 |
| -------------- | ----------------------------- |
| `nowrap`       | Todos na mesma linha (padrão) |
| `wrap`         | Quebra para próxima linha     |
| `wrap-reverse` | Quebra linha ao contrário     |

---

## 🎛️ Propriedades dos Itens

### `flex-grow`

Define quanto o item cresce para ocupar espaço livre.

```css
.item {
  flex-grow: 1;
}
```

---

### `flex-shrink`

Define se o item encolhe quando não há espaço.

```css
.item {
  flex-shrink: 1; /* padrão */
}
```

---

### `flex-basis`

Define o tamanho **inicial** do item antes do `grow/shrink`.

```css
.item {
  flex-basis: 200px;
}
```

---

### `flex` (shorthand)

Atalho para `flex-grow`, `flex-shrink` e `flex-basis`.

```css
.item {
  flex: 1 1 200px; /* grow | shrink | basis */
}
```

---

### `align-self`

Alinha um **único item** no eixo cruzado, sobrescrevendo `align-items`.

```css
.item {
  align-self: center;
}
```

---

## 🧪 Exemplo completo

```html
<style>
  .container {
    display: flex;
    justify-content: space-around;
    align-items: center;
    height: 200px;
    background: #eee;
  }

  .item {
    background: #6c5ce7;
    color: white;
    padding: 20px;
    flex: 1;
    margin: 10px;
  }
</style>

<div class="container">
  <div class="item">1</div>
  <div class="item">2</div>
  <div class="item">3</div>
</div>
```

---

## 📝 Resumo rápido

| Propriedade       | Função                                   |
| ----------------- | ---------------------------------------- |
| `display: flex`   | Ativa o modelo Flexbox                   |
| `flex-direction`  | Define a direção dos itens               |
| `justify-content` | Alinhamento no eixo principal            |
| `align-items`     | Alinhamento no eixo cruzado              |
| `flex-wrap`       | Permite quebra de linha                  |
| `flex`            | Crescimento, encolhimento e tamanho base |
| `align-self`      | Alinhamento individual do item           |

---

> 🚀 Flexbox é ideal para **layouts responsivos**, com distribuição dinâmica de espaço. Após dominar isso, o próximo passo é o **Grid Layout**!
