# 📦 Anotações: box model (modelo de caixa)

No CSS, todo elemento vira uma “caixa”. O box model é basicamente: conteúdo + padding + border + margin.

---

## 🧱 Estrutura do Modelo de Caixa

Cada elemento é composto por **quatro partes**, de dentro pra fora:

```txt
┌──────────────────────────────────────────┐
│                 margin                   │
│  ┌────────────────────────────────────┐  │
│  │              border                │  │
│  │  ┌──────────────────────────────┐  │  │
│  │  │           padding            │  │  │
│  │  │  ┌───────────────────────┐   │  │  │
│  │  │  │       content         │   │  │  │
│  │  │  └───────────────────────┘   │  │  │
│  │  └──────────────────────────────┘  │  │
│  └────────────────────────────────────┘  │
└──────────────────────────────────────────┘
```

- `content` → conteúdo visível (texto, imagem, etc)
- `padding` → espaço **interno**
- `border` → linha ao redor
- `margin` → espaço **externo**

---

## 🧩 O que é cada parte? (bem direto)

### `content`

É o conteúdo real do elemento (como texto ou imagem). A largura e altura são definidas aqui.

```css
width: 200px;
height: 100px;
```

---

### `padding`

Espaço **dentro da caixa**, entre o conteúdo e a borda.

```css
padding: 20px;
```

---

### `border`

Linha que envolve o `padding` e o `content`. Pode ter espessura, cor e estilo.

```css
border: 2px solid black;
```

---

### `margin`

Espaço **fora da caixa**, entre o elemento e os outros ao redor.

```css
margin: 10px;
```

---

## 📏 Cálculo de tamanho (padrão)

Por padrão, o navegador **soma tudo**:

```plaintext
Tamanho total = width + padding + border + margin
```

Exemplo:

```css
width: 200px;
padding: 20px;
border: 5px;
margin: 10px;
```

➡️ Largura total: **200 + 20*2 + 5*2 = 250px**
➡️ Altura total: igual, se `height: 100px` → **100 + 40 + 10 = 150px**

---

## 🔄 `box-sizing`

Você pode mudar esse comportamento com:

```css
box-sizing: border-box;
```

Com isso, a **largura total inclui padding e borda**, o que facilita o controle do layout.

---

## 🧪 Exemplo prático

```css
.card {
  width: 300px;
  padding: 20px;
  border: 2px solid #333;
  margin: 10px;
  box-sizing: border-box;
}
```

O `.card` continuará **com 300px de largura total**, já incluindo o `padding` e a `border`.

---

## 📝 Resumo

| Parte     | Função                               |
| --------- | ------------------------------------ |
| `content` | Conteúdo interno                     |
| `padding` | Espaço **interno** (dentro da borda) |
| `border`  | Contorno da caixa                    |
| `margin`  | Espaço **externo** (fora da borda)   |

---

## 🧠 Dica que eu uso sempre

Sempre que possível, use:

```css
* {
  box-sizing: border-box;
}
```

Isso evita muita surpresa no tamanho final.

---

> 🧾 Nota: isso aqui é um dos pontos que mais dá confusão em layout.
