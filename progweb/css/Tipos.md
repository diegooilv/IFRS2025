# Tipos de CSS: Externo, Interno e Incorporado 🎨

O CSS (Cascading Style Sheets) pode ser aplicado a uma página HTML de três maneiras principais:

---

## CSS Externo 🌐

O CSS externo é um arquivo `.css` separado que você cria e depois vincula ao seu documento HTML usando a tag `<link>` dentro do `<head>`.

**Exemplo:**

```html
<link rel="stylesheet" href="estilos.css" />
```

**Vantagens:**

- 🔄 Permite reutilizar o mesmo arquivo CSS em várias páginas.
- 🧹 Mantém o código CSS separado do HTML, facilitando a organização e manutenção.

---

## CSS Interno 🏠

O CSS interno é um bloco de estilos que você coloca dentro da própria página HTML, dentro da tag `<style>` no `<head>`.

**Exemplo:**

```html
<head>
  <style>
    body {
      background-color: #eee;
      font-family: Arial, sans-serif;
    }
  </style>
</head>
```

**Vantagens:**

- 🎯 Útil para aplicar estilos específicos em uma única página sem criar um arquivo externo.
- ✍️ Fácil de editar diretamente no HTML.

---

## CSS Incorporado (Inline) 🖌️

O CSS incorporado, ou inline, é aplicado diretamente em um elemento HTML usando o atributo `style`.

**Exemplo:**

```html
<p style="color: red; font-weight: bold;">Texto vermelho e em negrito.</p>
```

**Vantagens:**

- ⚡ Permite aplicar estilos rápidos e específicos a um único elemento.
- ⬆️ Pode sobrescrever estilos externos ou internos devido à maior especificidade.

---

## Considerações 💡

- 📂 Para projetos maiores, o CSS externo é o mais recomendado por questões de organização e reaproveitamento.
- 📝 CSS interno é útil para estilos rápidos em uma única página.
- ⚠️ CSS incorporado deve ser usado com moderação, para evitar confusão e dificuldade na manutenção.

---

**Resumo:**

| Tipo           | Localização             | Vantagem principal             |
| -------------- | ----------------------- | ------------------------------ |
| 🌐 Externo     | Arquivo `.css` separado | Reutilização e organização     |
| 🏠 Interno     | Dentro da tag `<style>` | Estilos específicos de página  |
| 🖌️ Incorporado | Atributo `style` inline | Estilos rápidos para elementos |

---

> ℹ️ **Observação**: Este material foi desenvolvido com base em boas práticas e conteúdos públicos da web, com o objetivo de ensinar de forma clara e divertida os conceitos fundamentais do HTML. 🚀🌐
