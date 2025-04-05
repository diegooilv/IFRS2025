# 🧮 Tipos de `<input>` em HTML

A tag `<input>` é uma das mais versáteis do HTML.  
Com ela, você pode criar campos de texto, botões, seletores de data, arquivos, cor e muito mais!

Cada tipo é definido pelo atributo `type`.

---

## 📋 Tabela resumida dos principais `type=""`

| Tipo             | Para quê serve                               |
|------------------|----------------------------------------------|
| `text`           | Texto simples                                |
| `password`       | Senha (oculta)                               |
| `email`          | E-mail (validação automática)                |
| `number`         | Apenas números                               |
| `tel`            | Telefone                                     |
| `url`            | URLs (validação automática)                  |
| `search`         | Campo de busca                               |
| `date`           | Seletor de data                              |
| `time`           | Seletor de horário                           |
| `datetime-local` | Data e hora (sem fuso horário)               |
| `month`          | Mês e ano                                    |
| `week`           | Semana do ano                                |
| `range`          | Barra deslizante                             |
| `color`          | Seletor de cor                               |
| `file`           | Upload de arquivos                           |
| `checkbox`       | Caixa de seleção (múltipla escolha)          |
| `radio`          | Botão de opção única                         |
| `hidden`         | Campo invisível                              |
| `submit`         | Botão para enviar o formulário               |
| `reset`          | Botão para limpar todos os campos            |
| `button`         | Botão genérico (sem ação padrão)             |
| `image`          | Botão de envio com imagem                    |

---

## 🔤 1. `text`

```html
<input type="text" placeholder="Seu nome">
```

Campo de texto comum. Pode adicionar `maxlength`, `required`, etc.

---

## 🔐 2. `password`

```html
<input type="password" placeholder="Digite sua senha">
```

Oculta o texto digitado com bolinhas.

---

## 📧 3. `email`

```html
<input type="email" required>
```

Valida automaticamente se o conteúdo parece um e-mail.

---

## 🔢 4. `number`

```html
<input type="number" min="1" max="100">
```

Campo só pra números. Pode limitar valores com `min` e `max`.

---

## ☎️ 5. `tel`

```html
<input type="tel" placeholder="(11) 99999-9999">
```

Para números de telefone. Não valida por padrão, mas pode usar `pattern`.

---

## 🌍 6. `url`

```html
<input type="url" placeholder="https://site.com">
```

Valida se é uma URL.

---

## 🔍 7. `search`

```html
<input type="search" placeholder="Pesquisar...">
```

Visual parecido com `text`, mas otimizado pra buscas (alguns navegadores mostram botão de limpar).

---

## 📅 8. `date`, `time`, `datetime-local`, `month`, `week`

```html
<input type="date">
<input type="time">
<input type="datetime-local">
<input type="month">
<input type="week">
```

Campos especiais com seletores nativos do navegador.

---

## 🎚️ 9. `range`

```html
<input type="range" min="0" max="100" value="50">
```

Barra deslizante para escolher um valor entre um mínimo e máximo.

---

## 🎨 10. `color`

```html
<input type="color">
```

Seletor de cor, abre uma paleta no navegador.

---

## 📎 11. `file`

```html
<input type="file" multiple>
```

Permite o usuário selecionar arquivos para enviar.  
Use `multiple` para permitir mais de um arquivo.

---

## ✅ 12. `checkbox`

```html
<input type="checkbox" id="aceito">
<label for="aceito">Aceito os termos</label>
```

Permite marcar ou desmarcar opções. Pode ter vários marcados ao mesmo tempo.

---

## ⚪ 13. `radio`

```html
<input type="radio" name="cor" value="azul"> Azul
<input type="radio" name="cor" value="vermelho"> Vermelho
```

Somente uma opção por grupo (definido pelo `name`).

---

## 👻 14. `hidden`

```html
<input type="hidden" name="token" value="abc123">
```

Campo invisível, usado para enviar dados "escondidos".

---

## 🚀 15. `submit`, `reset`, `button`

```html
<input type="submit" value="Enviar">
<input type="reset" value="Limpar">
<input type="button" value="Clique aqui">
```

- `submit`: envia o formulário
- `reset`: limpa os campos
- `button`: botão genérico que você controla com JavaScript

---

## 🖼️ 16. `image`

```html
<input type="image" src="botao.png" alt="Enviar">
```

Um botão de envio com imagem — como um `submit` mais visual.

---

## 🧠 Dicas Extras

- Use `required` para tornar o campo obrigatório.
- Use `pattern` para aplicar expressões regulares (ex: validar telefone).
- Sempre use `label` com `for` para melhorar a acessibilidade.

---

## 🎓 Conclusão

O `<input>` é poderoso, mas fica ainda mais forte quando combinado com CSS e JavaScript.

Dominar seus tipos permite criar **interfaces completas e intuitivas**, com poucos blocos de código.

---

> ℹ️ **Observação**: Este conteúdo foi criado com base em materiais de domínio público da web e práticas recomendadas em HTML, com foco educativo, acessível e direto ao ponto. 🧑‍💻✨