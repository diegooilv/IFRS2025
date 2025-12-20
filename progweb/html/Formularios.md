# 🧾 Criando Formulários com HTML

Anotação: formulário é a parte do HTML que coleta dados do usuário (login, busca, cadastro, etc.).

---

## 🧱 A base de tudo: `<form>`

O formulário começa com a tag `<form>`.
O que estiver dentro é o que vai junto quando enviar.

```html
<form action="/enviar" method="POST">
  <!-- campos aqui -->
</form>
```

| Atributo | Função |
|----------|--------|
| `action` | Pra onde os dados vão (URL do servidor) |
| `method` | Como os dados vão (GET ou POST) |

---

## ✏️ Campos de entrada com `<input>`

Eu uso `<input>` pra capturar vários tipos de dados:

```html
<input type="text" placeholder="Digite seu nome">
```

### 🧩 Tipos comuns de input:

| Tipo           | Para quê serve                   | Exemplo |
|----------------|----------------------------------|---------|
| `text`         | Texto comum                      | Nome, cidade |
| `email`        | Valida e-mails                   | `usuario@email.com` |
| `password`     | Campo com senha (oculto)         | •••••••• |
| `number`       | Apenas números                   | 1, 2, 3... |
| `checkbox`     | Caixa para marcar múltiplas opções | ✔️ |
| `radio`        | Seleção única entre opções       | ◉ |
| `submit`       | Botão que envia o formulário     | Enviar! 🚀 |

---

## 📝 Rótulos com `<label>`

`<label>` ajuda na acessibilidade e organiza melhor:

```html
<label for="email">Email:</label>
<input type="email" id="email" name="email">
```

O `for="email"` conecta o rótulo ao campo com `id="email"`.

---

## 📦 Agrupando com `<fieldset>` e `<legend>`

Bom pra separar seções dentro do formulário:

```html
<fieldset>
  <legend>Dados Pessoais</legend>
  <label>Nome:</label>
  <input type="text">
</fieldset>
```

---

## 🗒️ Caixa de texto grande: `<textarea>`

Pra mensagens longas (tipo comentário):

```html
<label for="mensagem">Mensagem:</label><br>
<textarea id="mensagem" rows="4" cols="40"></textarea>
```

---

## 📂 Lista de opções: `<select>`

Lista suspensa (dropdown):

```html
<label for="cidade">Escolha uma cidade:</label>
<select id="cidade">
  <option>São Paulo</option>
  <option>Rio de Janeiro</option>
  <option>Belo Horizonte</option>
</select>
```

---

## 🔘 Exemplo completo

```html
<form action="/enviar" method="POST">
  <label for="nome">Nome:</label><br>
  <input type="text" id="nome" name="nome"><br>

  <label for="email">Email:</label><br>
  <input type="email" id="email" name="email"><br>

  <label for="mensagem">Mensagem:</label><br>
  <textarea id="mensagem" name="mensagem" rows="4" cols="40"></textarea><br>

  <input type="submit" value="Enviar">
</form>
```

---

## ✅ Dicas (pra lembrar)

- Sempre colocar `name` em cada campo — é isso que chega no servidor.
- Use `required` para tornar campos obrigatórios:
  ```html
  <input type="text" required>
  ```
- Campos podem ter `placeholder` pra mostrar dicas dentro do input:
  ```html
  <input placeholder="Digite seu nome">
  ```

---

## 🎓 Conclusão

| Tag         | O que faz                       |
|-------------|---------------------------------|
| `<form>`    | Define o formulário              |
| `<input>`   | Cria campos de entrada           |
| `<label>`   | Define rótulos para inputs       |
| `<textarea>`| Campo de texto longo             |
| `<select>`  | Lista suspensa                   |
| `<fieldset>`| Agrupa campos relacionados       |

Resumo: formulário é a ponte entre a página e os dados que o usuário manda.

---

> ℹ️ **Observação**: Material baseado em boas práticas e fontes públicas, reorganizado para fins didáticos.
