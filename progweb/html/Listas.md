# 📝 Trabalhando com Listas no HTML

Listas são ótimas pra organizar informações, mostrar etapas ou destacar itens.  
No HTML, existem **dois tipos principais**: ordenadas e não ordenadas. Vamos entender como cada uma funciona!

---

## 🔹 `<ul>` – Lista **não ordenada**

`<ul>` vem de **Unordered List** → lista sem ordem definida.

É como uma **lista de supermercado**: não importa a ordem, você só quer os itens.

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

## 🔸 `<ol>` – Lista **ordenada**

`<ol>` vem de **Ordered List** → lista com ordem.

Use quando a **sequência importa**, como em um passo a passo ou ranking.

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

## 🔁 Relembrando: `<li>` é o item da lista

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

## 🎨 Dica: você pode personalizar listas com CSS!

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

## 🎓 Conclusão

| Tag | Significado |
|-----|-------------|
| `<ul>` | Lista não ordenada (bolinhas) |
| `<ol>` | Lista ordenada (números) |
| `<li>` | Item de lista (usado dentro de `<ul>` ou `<ol>`) |

Com listas, você pode deixar seu conteúdo mais claro, organizado e fácil de ler! ✔️

---

> ℹ️ **Observação**: Este conteúdo foi criado com base em materiais abertos e boas práticas da web, adaptado para fins educativos e explicativos com uma abordagem leve e lúdica. 🌐✨
