# 🎯 Especificidade no CSS

A **especificidade** é a forma como o navegador decide **qual regra de estilo aplicar** quando várias regras se aplicam ao mesmo elemento. É como um sistema de pontuação que determina **qual estilo "vence"**.

---

## 🧠 Conceito

Quando múltiplos seletores apontam para o mesmo elemento, o navegador usa a **especificidade** para decidir **qual regra tem mais peso**.

---

## 🔢 Como é calculada?

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

## ⚔️ Empate: quem ganha?

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

## 🚨 `!important`: o "último recurso"

Usar `!important` faz com que **a regra seja aplicada, independentemente da especificidade**.

```css
p {
  color: green !important;
}
```

⚠️ **Evite usar `!important`**, pois quebra a lógica da especificidade e pode causar conflitos difíceis de resolver.

---

## ✅ Boas práticas

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

> 📘 Este material foi elaborado com base em boas práticas e fontes confiáveis da web, para facilitar o entendimento do comportamento do CSS na prática. ✨
