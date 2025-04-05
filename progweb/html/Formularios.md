# 🧾 Criando Formulários com HTML

Formulários são como **caixinhas mágicas** onde o usuário pode digitar, clicar, marcar e enviar informações.  
Você vê eles o tempo todo: login, pesquisa, comentários, cadastros...

Vamos aprender como funcionam! 🛠️

---

## 🧱 A base de tudo: `<form>`

O formulário começa com a tag `<form>`.  
Tudo que você colocar dentro dela será enviado quando o usuário clicar no botão “Enviar”.

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

Você usa `<input>` para capturar diferentes tipos de dados:

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

Usar `<label>` ajuda na acessibilidade e na organização:

```html
<label for="email">Email:</label>
<input type="email" id="email" name="email">
```

O `for="email"` conecta o rótulo ao campo com `id="email"`.

---

## 📦 Agrupando com `<fieldset>` e `<legend>`

Ótimo para dividir seções dentro de um formulário:

```html
<fieldset>
  <legend>Dados Pessoais</legend>
  <label>Nome:</label>
  <input type="text">
</fieldset>
```

---

## 🗒️ Caixa de texto grande: `<textarea>`

Para mensagens longas, tipo comentários:

```html
<label for="mensagem">Mensagem:</label><br>
<textarea id="mensagem" rows="4" cols="40"></textarea>
```

---

## 📂 Lista de opções: `<select>`

Listas suspensas (dropdown):

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

## ✅ Dicas extras

- Sempre defina o `name` em cada campo — ele é o que será enviado ao servidor.
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

Formulários são como pontes entre as pessoas e os sites.  
Com eles, a web ganha vida — com feedbacks, cadastros, buscas, interações… tudo começa com um campo pra preencher! 🧙‍♂️

---

> ℹ️ **Observação**: Este material foi desenvolvido com base em boas práticas e conteúdos públicos da web, com o objetivo de ensinar de forma clara e divertida os conceitos fundamentais do HTML. 🚀🌐
