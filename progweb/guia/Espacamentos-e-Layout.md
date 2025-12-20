# 🛠️ Anotações: espaçamentos e layout em CSS

Resumo do que eu consulto quando travo em layout: box model, unidades, flex/grid, responsividade e umas dicas de acessibilidade.

---

## 📦 Box model (visual)

Todo elemento vira uma “caixa” com:

```
+-----------------------------+
| Margin (Externo)            |
|  +-----------------------+  |
|  | Border                |  |
|  |  +-----------------+  |  |
|  |  | Padding         |  |  |
|  |  |  +-----------+  |  |  |
|  |  |  | Content   |  |  |  |
|  |  |  +-----------+  |  |  |
|  |  +-----------------+  |  |
|  +-----------------------+  |
|                             |
+-----------------------------+
```

### Exemplo rápido

```css
.caixa {
  width: 300px;
  padding: 20px;
  border: 2px solid #333;
  margin: 30px;
  box-sizing: border-box; /* Mantém a largura total em 300px */
}
```

---

## 📏 Unidades (o que eu mais uso)

### Escala de espaçamento baseada em 8px

```css
:root {
  --space-unit: 0.5rem; /* 8px */
  --space-xxs: calc(var(--space-unit) * 0.5); /* 4px */
  --space-xs: calc(var(--space-unit) * 1); /* 8px */
  --space-sm: calc(var(--space-unit) * 2); /* 16px */
  --space-md: calc(var(--space-unit) * 3); /* 24px */
  --space-lg: calc(var(--space-unit) * 4); /* 32px */
}

.botao {
  padding: var(--space-xs) var(--space-sm);
  margin-bottom: var(--space-md);
}
```

### Quando usar cada unidade

| Unidade | Caso de Uso Ideal               | Exemplo                     |
| ------- | ------------------------------- | --------------------------- |
| `rem`   | Espaçamentos globais            | `margin: 1.5rem;`           |
| `em`    | Elementos relativos ao contexto | `padding: 0.5em;` em botões |
| `vw/vh` | Elementos que preenchem a tela  | `width: 100vw;`             |
| `%`     | Layouts fluidos                 | `width: 50%;`               |

---

## 🧩 Flexbox vs Grid (quando eu escolho)

| Critério          | Flexbox                      | Grid CSS                                   |
| ----------------- | ---------------------------- | ------------------------------------------ |
| Dimensão          | 1D (linha OU coluna)         | 2D (linhas E colunas)                      |
| Alinhamento       | Controle individual por eixo | Alinhamento em ambas direções              |
| Caso de Uso Ideal | Menus, cards em linha        | Layouts complexos (grades, áreas nomeadas) |
| Espaçamento       | `gap` (modern browsers)      | `gap` suportado nativamente                |

### Exemplo Flexbox:

```css
.navbar {
  display: flex;
  justify-content: space-between;
  gap: var(--space-md);
}
```

### Exemplo Grid:

```css
.galeria {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: var(--space-lg);
}
```

---

## ♿ Acessibilidade (lembretes)

### Coisas que eu tento não esquecer

1. **Área clicável mínima:** 48x48px pra botão/toque

   ```css
   .botao-acessivel {
     min-width: 3rem; /* 48px */
     min-height: 3rem;
     padding: var(--space-xs);
   }
   ```

2. **Espaçamento entre coisas clicáveis:**

  - deixar margem/gap claro entre elementos interativos
  - exemplo (links):

   ```css
   a + a {
     margin-left: var(--space-md); /* Espaço entre links */
   }
   ```

---

## 📱 Responsividade (mobile-first)

### Breakpoints (exemplo)

```css
/* Base (Mobile) */
.container {
  padding: var(--space-sm);
  gap: var(--space-xs);
}

/* Tablet */
@media (min-width: 768px) {
  .container {
    padding: var(--space-md);
    gap: var(--space-sm);
  }
}

/* Desktop */
@media (min-width: 1024px) {
  .container {
    max-width: 1200px;
    margin: 0 auto;
  }
}
```

---

## 🛠️ Ferramentas (pra depurar)

1. **DevTools do navegador:**

   - Inspecione box model (Elements > Computed)
   - Visualize Grid/Flex overlays

2. **Geradores online:**

   - [CSS Grid Generator](https://cssgrid-generator.netlify.app/)
   - [Flexbox Playground](https://demos.scotch.io/visual-guide-to-css3-flexbox-flexplay/)

---

## 🏗️ Exemplo de layout (esqueleto)

```html
<!DOCTYPE html>
<html lang="pt-BR">
  <head>
    <style>
      :root {
        --space-unit: 0.5rem;
        /* ... escala completa ... */
      }

      .layout {
        display: grid;
        grid-template-rows: auto 1fr auto;
        min-height: 100vh;
        gap: var(--space-md);
      }
    </style>
  </head>
  <body>
    <div class="layout">
      <header>...</header>
      <main>...</main>
      <footer>...</footer>
    </div>
  </body>
</html>
```

---

## 📚 Links que já usei

1. [CSS para Sistemas de Design](https://engineering.monday.com/css-para-sistemas-de-design/)
2. [Guia Definitivo de Flexbox](https://origamid.com/projetos/flexbox-guia-completo/)
3. [WebAIM - Espaçamento Acessível](https://webaim.org/techniques/spacing/)
