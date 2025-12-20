# 🎯 Anotações: especificidade no CSS

Especificidade = a “pontuação” que decide qual regra ganha quando mais de uma bate no mesmo elemento.

---

## 🧠 Ideia

Se vários seletores pegam o mesmo elemento, o navegador escolhe o que tem mais peso.

---

## 🔢 Como eu penso no cálculo

A pontuação da especificidade é composta por quatro níveis, **da mais forte para a mais fraca**:

| Nível                           | Valor | Exemplo                             |
| ------------------------------- | ----- | ----------------------------------- |
| Estilo inline                   | 1000  | `<p style="color:red">`             |
| ID                              | 100   | `#menu`, `#cabecalho`               |
| Classe, atributo, pseudo-classe | 10    | `.botao`, `[type="text"]`, `:hover` |
| Tipo (tag), pseudo-elemento     | 1     | `p`, `h1`, `::before`               |

---

## 📚 Exemplos

```css
/* Especificidade: 1 (1 elemento) */
p {
  color: blue;
}

/* Especificidade: 10 (1 classe) */
.texto {
  color: red;
}

/* Especificidade: 100 (1 ID) */
#mensagem {
  color: green;
}
```

🔎 Se as três regras forem aplicadas ao mesmo elemento, o texto será **verde**, pois o ID tem maior especificidade.

---

## ⚔️ Empate

Se duas regras tiverem **mesma especificidade**, vence a que estiver **mais abaixo** no CSS.

```css
h1 {
  color: blue;
}

h1 {
  color: red;
}
/* Resultado: vermelho, por estar depois */
```

---

## 🚨 `!important` (último recurso)

Usar `!important` faz com que **a regra seja aplicada, independentemente da especificidade**.

```css
p {
  color: green !important;
}
```

⚠️ Eu evito `!important` porque depois vira bagunça pra resolver conflito.

---

## ✅ Lembretes

- Use **classes** para estilizar vários elementos.
- Use **IDs apenas para elementos únicos**.
- Evite seletores muito complexos ou aninhados.
- Evite usar `!important`, a menos que seja realmente necessário.

---

## 🧠 Resumo Rápido

| Seletor                                                           | Valor |
| ----------------------------------------------------------------- | ----- |
| Estilo inline (`style=""`)                                        | 1000  |
| ID (`#exemplo`)                                                   | 100   |
| Classe / atributo / pseudo-classe (`.classe`, `[attr]`, `:hover`) | 10    |
| Tipo / pseudo-elemento (`div`, `::before`)                        | 1     |

---

> 📘 Nota: o que mais ajuda aqui é lembrar a tabela (inline > ID > classe > tag).
