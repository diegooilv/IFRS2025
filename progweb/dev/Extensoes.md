# 📦 Extensões para Desenvolvimento Web no VS Code

## ✅ Instalação Rápida

1. Salve o arquivo [`Extensoes.txt`](Extensoes.txt) com a lista de extensões.
2. Execute o seguinte comando no terminal:

```bash
for ext in $(grep -v '^#' extensoes-web.txt); do
  code --install-extension $ext
done
```

> 💡 Esse comando instala todas as extensões listadas, ignorando os comentários (`#`).

---

## 🧩 Lista de Extensões Explicada

| Extensão                                                     | Função                                                      |
| ------------------------------------------------------------ | ----------------------------------------------------------- |
| `adpyke.codesnap`                                            | Gera imagens bonitas de blocos de código                    |
| `atommaterial.a-file-icon-vscode`                            | Melhora os ícones dos arquivos no Explorer                  |
| `bierner.markdown-mermaid`                                   | Suporte a diagramas Mermaid em arquivos Markdown            |
| `cirlorm.mobileview`                                         | Visualiza seu site em resoluções de dispositivos móveis     |
| `davidanson.vscode-markdownlint`                             | Valida arquivos Markdown com regras de boas práticas        |
| `dbaeumer.vscode-eslint`                                     | Detecta erros e boas práticas em JavaScript com o ESLint    |
| `dracula-theme.theme-dracula`                                | Tema escuro popular e elegante                              |
| `ecmel.vscode-html-css`                                      | Autocompleta classes CSS dentro do HTML                     |
| `entuent.fira-code-nerd-font`                                | Fonte com ligaduras para código (como `===`, `!=`)          |
| `esbenp.prettier-vscode`                                     | Formatador de código (JS, HTML, CSS etc.)                   |
| `figma.figma-vscode-extension`                               | Integração com Figma (design para web)                      |
| `formulahendry.auto-close-tag`                               | Fecha tags HTML automaticamente                             |
| `formulahendry.auto-complete-tag`                            | Autocompleta tags HTML                                      |
| `formulahendry.auto-rename-tag`                              | Renomeia a tag de fechamento quando você muda a de abertura |
| `formulahendry.code-runner`                                  | Executa trechos de código no editor                         |
| `icrawl.discord-vscode`                                      | Mostra o que você está fazendo no VS Code via Discord RPC   |
| `igordvlpr.open-in-browser`                                  | Adiciona opção de abrir HTML direto no navegador            |
| `mechatroner.rainbow-csv`                                    | Colore colunas de arquivos .csv para melhor leitura         |
| `ms-ceintl.vscode-language-pack-pt-br`                       | VS Code traduzido para português brasileiro                 |
| `pkief.material-icon-theme`                                  | Tema de ícones moderno e colorido                           |
| `ritwickdey.liveserver`                                      | Atualiza o navegador automaticamente ao salvar HTML/CSS     |
| `rocketseat.theme-omni`                                      | Tema visual minimalista da Rocketseat                       |
| `streetsidesoftware.code-spell-checker`                      | Corretor ortográfico em código                              |
| `streetsidesoftware.code-spell-checker-portuguese-brazilian` | Corretor em português brasileiro                            |
| `usernamehw.errorlens`                                       | Mostra erros diretamente na linha do código                 |
| `yzhang.markdown-all-in-one`                                 | TOC automático, atalhos e melhorias para Markdown           |

## 🧙‍♂️ Dica Final

Instalar essas extensões ajuda a manter um fluxo de trabalho limpo, visual e eficiente ao desenvolver sites estáticos ou dinâmicos.
