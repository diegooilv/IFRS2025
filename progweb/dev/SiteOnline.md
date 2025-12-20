# 🌐 Anotações: colocando o site no ar

Depois que o site está rodando localmente, dá pra **publicar** usando serviços gratuitos de hospedagem.

Aqui ficam algumas opções comuns e um passo a passo básico de cada uma.

---

## 🧭 Qual escolher?

| Plataforma           | Ideal Para                      | Precisa de Git? | Link do Site            |
|----------------------|----------------------------------|------------------|--------------------------|
| GitHub Pages         | Usuários de Git/GitHub          | ✅               | `github.io`             |
| Netlify              | Simples e direto ao ponto       | ❌ (arrastar/soltar) | `netlify.app`        |
| Discloud             | Usuários do Discord             | ❌               | `discloud.app`          |
| Cloudflare Pages     | Sites estáticos integrados ao Git | ✅               | `pages.dev`             |
| Heroku               | Sites com backend (ou não)      | ✅ (CLI recomendado) | `herokuapp.com`     |

---

## 🚀 Opção 1: GitHub Pages
**Bom se já usa Git/GitHub**

### Passo a passo (resumo)

1. Acesse [github.com](https://github.com/) e **crie uma conta** (se ainda não tiver).
2. Crie um **novo repositório** (ex: `meusite`).
3. Faça o **upload dos arquivos** do seu site (HTML, CSS etc).
4. Vá em **Settings** → **Pages**.
5. Em **"Source"**, selecione a branch (`main`) e a pasta raiz (`/root` ou `/docs`).
6. Em alguns minutos, seu site estará no ar:  
   👉 `https://seunome.github.io/meusite/`

💡 *Lembrete:* atualiza com novos commits.

---

## ☁️ Opção 2: Netlify
**Deploy rápido (dá pra arrastar/soltar)**

### Passo a passo (resumo)

1. Vá para [netlify.com](https://www.netlify.com/) e **crie sua conta**.
2. No painel, clique em **"Add new site"** → **"Deploy manually"**.
3. Faça **upload da pasta** do seu site (com `index.html` dentro).
4. Pronto! O link será algo como:  
   👉 `https://nomedosite.netlify.app/`

💡 *Lembrete:* dá pra conectar ao GitHub e automatizar.

---

## ⚡ Opção 3: Discloud
**Útil se já usa Discord**

### Passo a passo (resumo)

1. Crie sua conta em [discloud.app](https://discloud.app/).
2. No painel, clique em **"Novo App"** → **"Website"**.
3. Envie seu projeto **em um arquivo `.zip`**, com `index.html` na raiz.
4. O site será gerado com um link direto:  
   👉 `https://nomedosite.discloud.app`

💡 *Lembrete:* costuma ser mais usado em projetos simples.

---

## 🌩️ Opção 4: Cloudflare Pages
**Bom para sites estáticos integrados ao Git**

### Passo a passo (resumo)

1. Vá em [pages.cloudflare.com](https://pages.cloudflare.com/) e **entre com sua conta Cloudflare**.
2. Clique em **"Create a project"** e conecte ao seu repositório GitHub.
3. Defina a pasta do projeto (geralmente `.`) e deixe o comando de build vazio (para HTML puro).
4. O site estará acessível em:  
   👉 `https://nomedosite.pages.dev`

💡 *Lembrete:* push no repositório normalmente já dispara atualização.

---

## 🧪 Opção 5: Heroku
**Mais voltado pra apps com backend**

### Passo a passo (resumo)

1. Crie sua conta em [heroku.com](https://www.heroku.com/).
2. Instale o [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli).
3. Crie um novo app com o comando:
   ```bash
   heroku create meusite
   ```
4. Use Git para fazer o deploy. Para sites estáticos, adicione um arquivo `static.json` com a configuração necessária.
5. Seu site ficará acessível via:  
   👉 `https://meusite.herokuapp.com/`

💡 *Lembrete:* dá pra hospedar HTML simples, mas o foco costuma ser backend (Node, Python, etc).

---

## 🌐 Exemplo real
Este projeto está publicado em:

🔗 **[https://progweb.pages.dev](https://progweb.pages.dev)**

---

## ✅ Resumo

Pra site estático, normalmente GitHub Pages / Netlify / Cloudflare Pages já resolvem.

