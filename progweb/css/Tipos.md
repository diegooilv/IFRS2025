# 🎨 Anotações: tipos de CSS (externo, interno, inline)

Tem 3 jeitos comuns de colocar CSS no HTML. Eu uso assim:

---

## CSS externo 🌐

CSS externo = arquivo `.css` separado, ligado no `<head>` com `<link>`.

**Exemplo:**

```html
<link rel="stylesheet" href="estilos.css" />
```

**Por que eu gosto:**

- 🔄 Permite reutilizar o mesmo arquivo CSS em várias páginas.
- 🧹 Mantém o código CSS separado do HTML, facilitando a organização e manutenção.

---

## CSS interno 🏠

CSS interno = `<style>` dentro do `<head>`.

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

**Quando faz sentido:**

- 🎯 Útil para aplicar estilos específicos em uma única página sem criar um arquivo externo.
- ✍️ Fácil de editar diretamente no HTML.

---

## CSS inline 🖌️

CSS inline = `style="..."` direto no elemento.

**Exemplo:**

```html
<p style="color: red; font-weight: bold;">Texto vermelho e em negrito.</p>
```

**Serve pra:**

- ⚡ Permite aplicar estilos rápidos e específicos a um único elemento.
- ⬆️ Pode sobrescrever estilos externos ou internos devido à maior especificidade.

---

## Lembretes 💡

- 📂 Projeto maior: eu prefiro externo (organiza e reaproveita).
- 📝 Interno: quebra um galho pra testes/uma página só.
- ⚠️ Inline: usar pouco, senão vira difícil de manter.

---

**Resumo:**

| Tipo           | Localização             | Vantagem principal             |
| -------------- | ----------------------- | ------------------------------ |
| 🌐 Externo     | Arquivo `.css` separado | Reutilização e organização     |
| 🏠 Interno     | Dentro da tag `<style>` | Estilos específicos de página  |
| 🖌️ Incorporado | Atributo `style` inline | Estilos rápidos para elementos |

---

> ℹ️ **Observação**: Material baseado em boas práticas e fontes públicas, reorganizado para fins didáticos.
