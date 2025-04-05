# 🌐 Colocando Seu Site no Ar!

Você já criou seu site, testou no navegador... e agora?  
Chegou a hora de **publicar na internet** e compartilhar com o mundo! 😄

Existem várias plataformas gratuitas para **hospedar seu site** — simples de usar e perfeitas para projetos, portfólios ou estudos.  

Abaixo, você confere **as 5 melhores opções**, com passo a passo para cada uma.

---

## 🧭 Qual Escolher?

| Plataforma           | Ideal Para                      | Precisa de Git? | Link do Site            |
|----------------------|----------------------------------|------------------|--------------------------|
| GitHub Pages         | Usuários de Git/GitHub          | ✅               | `github.io`             |
| Netlify              | Simples e direto ao ponto       | ❌ (arrastar/soltar) | `netlify.app`        |
| Discloud             | Usuários do Discord             | ❌               | `discloud.app`          |
| Cloudflare Pages     | Sites estáticos integrados ao Git | ✅               | `pages.dev`             |
| Heroku               | Sites com backend (ou não)      | ✅ (CLI recomendado) | `herokuapp.com`     |

---

## 🚀 Opção 1: GitHub Pages  
**Ideal para quem já usa Git e GitHub**

### Como publicar:

1. Acesse [github.com](https://github.com/) e **crie uma conta** (se ainda não tiver).
2. Crie um **novo repositório** (ex: `meusite`).
3. Faça o **upload dos arquivos** do seu site (HTML, CSS etc).
4. Vá em **Settings** → **Pages**.
5. Em **"Source"**, selecione a branch (`main`) e a pasta raiz (`/root` ou `/docs`).
6. Em alguns minutos, seu site estará no ar:  
   👉 `https://seunome.github.io/meusite/`

💡 *Dica:* Atualize o site apenas com novos commits!

---

## ☁️ Opção 2: Netlify  
**Hospedagem rápida com arrastar e soltar**

### Como publicar:

1. Vá para [netlify.com](https://www.netlify.com/) e **crie sua conta**.
2. No painel, clique em **"Add new site"** → **"Deploy manually"**.
3. Faça **upload da pasta** do seu site (com `index.html` dentro).
4. Pronto! O link será algo como:  
   👉 `https://nomedosite.netlify.app/`

💡 *Dica:* Você pode conectar ao GitHub para atualizações automáticas.

---

## ⚡ Opção 3: Discloud  
**Perfeita para quem já usa o Discord**

### Como publicar:

1. Crie sua conta em [discloud.app](https://discloud.app/).
2. No painel, clique em **"Novo App"** → **"Website"**.
3. Envie seu projeto **em um arquivo `.zip`**, com `index.html` na raiz.
4. O site será gerado com um link direto:  
   👉 `https://nomedosite.discloud.app`

💡 *Dica:* Ideal para projetos simples ou integrados com bots.

---

## 🌩️ Opção 4: Cloudflare Pages  
**Ótimo para sites estáticos com Git**

### Como publicar:

1. Vá em [pages.cloudflare.com](https://pages.cloudflare.com/) e **entre com sua conta Cloudflare**.
2. Clique em **"Create a project"** e conecte ao seu repositório GitHub.
3. Defina a pasta do projeto (geralmente `.`) e deixe o comando de build vazio (para HTML puro).
4. O site estará acessível em:  
   👉 `https://nomedosite.pages.dev`

💡 *Dica:* Toda vez que você der push no repositório, o site será atualizado automaticamente.

---

## 🧪 Opção 5: Heroku  
**Para quem quer mais controle ou backend**

### Como publicar:

1. Crie sua conta em [heroku.com](https://www.heroku.com/).
2. Instale o [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli).
3. Crie um novo app com o comando:
   ```bash
   heroku create meusite
   ```
4. Use Git para fazer o deploy. Para sites estáticos, adicione um arquivo `static.json` com a configuração necessária.
5. Seu site ficará acessível via:  
   👉 `https://meusite.herokuapp.com/`

💡 *Dica:* Mesmo sites HTML simples funcionam, mas Heroku é mais voltado para apps com backend (Node, Python, etc).

---

## 🌐 Exemplo Real:  
Este projeto está publicado em:

🔗 **[https://progweb.pages.dev](https://progweb.pages.dev)**

---

## ✅ Conclusão

Você não precisa pagar nada para colocar seu site no ar!  
Com ferramentas como **GitHub Pages**, **Netlify**, e **Cloudflare Pages**, o processo é simples e gratuito.

> 📌 **Recomendo começar pelo GitHub Pages ou Netlify** se estiver criando seu primeiro site.

