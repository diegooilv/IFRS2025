# Seletores no CSS

Seletores são usados para **apontar quais elementos HTML** serão estilizados com CSS. Eles são fundamentais para aplicar estilos corretamente em uma página web.

---

## 🔷 Seletor de Tipo

Aplica estilos diretamente a elementos HTML pelo nome da tag.

```css
body {
  background-color: black;
}

main {
  font-size: 12px;
}
```

---

## 🟣 Seletor de Classe

Utilizado quando queremos aplicar estilos a **vários elementos** com uma mesma identidade visual. A classe é precedida por um ponto (`.`).

```css
.main {
  font-size: 12px;
}

.fundo-escuro {
  background-color: black;
}
```

---

## 🟢 Seletor de ID

Utilizado para estilizar **um único elemento específico**. O ID é precedido por uma cerquilha (`#`).

```css
#main {
  font-size: 12px;
}

#fundo {
  background-color: black;
}
```

---

## 📄 Exemplo no HTML

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <title>Exemplo de Seletores</title>
  <link rel="stylesheet" href="estilos.css" />
</head>
<body id="fundo">
  <main class="main" id="main">
    Conteúdo
  </main>
</body>
</html>
```

---

## 📌 Resumo

| Tipo de seletor | Símbolo  | Exemplo |
| --------------- | -------- | ------- |
| Tipo            | (nenhum) | `main`  |
| Classe          | `.`      | `.main` |
| ID              | `#`      | `#main` |

* ✅ Use **classes (`.classe`)** para estilos reutilizáveis.
* ✅ Use **IDs (`#id`)** para estilizar elementos únicos.
* ⚠️ Nunca repita o mesmo ID em mais de um elemento na mesma página.

---

> ℹ️ **Observação**: Este material foi desenvolvido com base em boas práticas e conteúdos públicos da web, com o objetivo de ensinar de forma clara e divertida os conceitos fundamentais do CSS. 🚀🎨
