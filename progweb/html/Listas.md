# 📝 Anotações: listas no HTML

Listas ajudam a organizar informações. No HTML, as principais são: **ordenadas** e **não ordenadas**.

---

## 🔹 `<ul>` – lista **não ordenada**

`<ul>` vem de **Unordered List** → lista sem ordem definida.

Analogia: lista de supermercado (a ordem não importa).

```html
<ul>
  <li>Arroz</li>
  <li>Feijão</li>
  <li>Macarrão</li>
</ul>
```

🔸 Aparece com bolinhas (•) por padrão.  
🔸 Cada item vai dentro de uma tag `<li>` (de "list item").

---

## 🔸 `<ol>` – lista **ordenada**

`<ol>` vem de **Ordered List** → lista com ordem.

Usar quando a **sequência importa** (passo a passo, ranking).

```html
<ol>
  <li>Ligar o forno</li>
  <li>Colocar a massa</li>
  <li>Esperar 30 minutos</li>
</ol>
```

🔸 Por padrão, aparece com números (1, 2, 3…).  
🔸 Também usa `<li>` pra cada item.

---

## 🔁 Lembrete: `<li>` é o item da lista

A tag `<li>` é usada **dentro de `<ul>` ou `<ol>`** e representa cada item.

Você não usa `<li>` sozinho — ele sempre precisa estar dentro de uma lista!

---

## 🧪 Exemplos práticos

### ✔️ Lista de tarefas com `<ul>`:

```html
<h2>Minhas Tarefas</h2>
<ul>
  <li>Estudar HTML</li>
  <li>Praticar CSS</li>
  <li>Explorar JavaScript</li>
</ul>
```

### 🥇 Top 3 jogos com `<ol>`:

```html
<h2>Meus Jogos Favoritos</h2>
<ol>
  <li>Celeste</li>
  <li>Hollow Knight</li>
  <li>Stardew Valley</li>
</ol>
```

---

## 🎨 Dica: dá pra personalizar com CSS

Exemplo:

```css
ul {
  list-style-type: square;
}

ol {
  list-style-type: upper-roman;
}
```

- `square`, `circle`, `disc`, etc.
- `upper-roman` = I, II, III…
- `decimal`, `lower-alpha`, `upper-alpha`, etc.

---

## 🚀 Dica extra: listas dentro de listas

Sim! Você pode fazer **listas dentro de listas** (aninhadas):

```html
<ul>
  <li>Frutas
    <ul>
      <li>Maçã</li>
      <li>Banana</li>
    </ul>
  </li>
  <li>Legumes</li>
</ul>
```

---

## ✅ Resumo

| Tag | Significado |
|-----|-------------|
| `<ul>` | Lista não ordenada (bolinhas) |
| `<ol>` | Lista ordenada (números) |
| `<li>` | Item de lista (usado dentro de `<ul>` ou `<ol>`) |

Com listas, o conteúdo fica mais claro e organizado.

---

> ℹ️ **Observação**: Material baseado em fontes públicas e boas práticas, reorganizado para fins didáticos.
