# CSS da Lancheria 🍔🎨

## Fonte e variáveis ✍️

- foi importada a fonte **Inter** do Google Fonts, que é moderna e fácil de ler  
- usei `:root` pra definir variáveis de cor, espaçamento, raio de borda e largura máxima da página  
- isso facilita trocar cores ou ajustes sem ter que mexer em várias linhas  

---

## Reset e body 🧹

- `box-sizing: border-box` deixa o cálculo de largura/altura mais previsível  
- no `body` defini fonte padrão, tamanho base em `rem`, cor de fundo clara e cor de texto padrão  
- margens zeradas pra começar o layout do zero  

---

## Cabeçalho 🧾

- `header` tem fundo vermelho escuro e texto branco  
- usei `flex` em coluna pra centralizar logo e menu em telas menores  
- o `nav ul` usa `flex` em linha e `gap` pra espaçar os links  
- links do menu mudam de cor no hover, indo pro vermelho mais vibrante  

---

## Main e títulos 📰

- `main` limita o conteúdo no centro com largura máxima e padding lateral  
- títulos `h2` usam cor secundária (vermelho escuro) e tamanho maior  
- parágrafos tem espaçamento padrão embaixo  

---

## Produtos (cards) 🛒

- a lista `#produtos ul` usa `flex`, com `wrap` pra quebrar linhas e `align-items: stretch` pra todos os cards ficarem do mesmo tamanho  
- cada `li` tem limite de largura, mas também é flexível  
- cada `article` é o card em si: fundo branco, borda arredondada, sombra leve e efeito hover com elevação  
- dentro do card tudo é `flex column` e o `flex: 1` garante que o card ocupe toda a altura disponível  
- `h3` dos produtos fica centralizado e vermelho vibrante  
- o preço usa `<data>` estilizado com destaque 💰  
- `figure` centraliza a imagem do produto, e a imagem tem borda arredondada também  
- `figcaption` fica menor e em cinza claro  

---

## Rodapé 👣

- `footer` tem fundo vermelho escuro, texto branco e centralizado  
- links ficam no vermelho vibrante e ganham sublinhado no hover  

---

## Responsividade 📱

- quando a tela é pequena, o `header` muda pra texto centralizado e o menu vira coluna  
- os produtos ficam em coluna, ocupando 100% da largura  
- isso garante que o site fique bom em celular também  

---

## Ideia geral 🚀

O CSS foi pensado pra deixar o site moderno, limpo e responsivo.  
Usei **Flexbox** pra organizar os elementos e variáveis CSS pra facilitar mudanças de cor e tamanho.  
Os cards dos produtos ficam sempre iguais em altura, mesmo se o texto de um for maior que o outro.  

---

## Veja o HTML ou o Site Online 🔗

[Aqui](Lancheria.md) ou [https://progweb.pages.dev/trabalhos/Lancheria+Css](https://progweb.pages.dev/trabalhos/Lancheria+Css)
