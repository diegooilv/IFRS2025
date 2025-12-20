# Anotações: seletores no CSS

Seletor = a parte que “escolhe” quais elementos vão receber o estilo.

---

## 🔷 Seletor de tipo

Aponta pela tag (`body`, `main`, `p`, etc.).

```css
body {
  background-color: black;
}

main {
  font-size: 12px;
}
```

---

## 🟣 Seletor de classe

Uso quando quero repetir estilo em vários elementos. Começa com ponto (`.`).

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

Uso pra um elemento específico (idealmente único na página). Começa com `#`.

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

* ✅ Classes (`.classe`) = reutilizável.
* ✅ ID (`#id`) = único.
* ⚠️ Não repetir o mesmo ID na mesma página.

---

> ℹ️ **Observação**: Material baseado em boas práticas e fontes públicas, reorganizado para fins didáticos.
