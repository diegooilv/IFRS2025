# 🧑‍💻 Guia Completo de Git: Terminal & GitHub Desktop

Este guia profissional abrange desde o uso básico de Git no terminal até fluxos de trabalho avançados, resolução de conflitos, CI/CD e comparação entre terminal e GitHub Desktop.

---

## 📂 Fluxos de Trabalho (Workflows)

### Git Flow vs GitHub Flow vs Trunk-Based Development

| Modelo               | Branches Principais                             | Uso Ideal                             |
| -------------------- | ----------------------------------------------- | ------------------------------------- |
| **Git Flow**         | `main`, `develop`, `feature/*`, `hotfix/*`      | Projetos com lançamentos estruturados |
| **GitHub Flow**      | `main`, `feature/*`                             | Deploy contínuo, integração frequente |
| **Trunk-Based Dev.** | `main` com branches curtos ou `feature toggles` | Equipes enxutas, entregas rápidas     |

### Diagrama Visual de Branches

```
* main
|\
| ├─ develop
| |  ├─ feature/login
| |  ├─ feature/ui
| ├─ hotfix/bug-123
```

### Criar Feature Branch

```bash
# baseado no develop ou main
git checkout -b feature/nova-funcionalidade
```

---

## ⚔️ Resolução de Conflitos

### Terminal: Passo a Passo

```bash
# Atualizar remoto
git fetch origin
# Mesclar main
git merge origin/main
# Editar arquivos com conflitos
# Marcar resolvidos
git add .
# Commit final
git commit -m "Resolve conflitos"
```

## 📁 .gitignore Prático

Exemplo de `.gitignore` para várias linguagens:

```gitignore
# Node.js
node_modules/
.env

# Python
__pycache__/
*.py[cod]

# Java
*.class
*.jar

# VSCode
.vscode/
```

> Dica: use templates do GitHub: [https://github.com/github/gitignore](https://github.com/github/gitignore)

---

## 🔧 Comandos Avançados Úteis

- **Stash:** salvar alterações temporárias

  ```bash
  git stash save "WIP: ajuste no CSS"
  git stash pop
  ```

- **Rebase Interativo:** reorganizar commits

  ```bash
  git rebase -i HEAD~3
  ```

- **Cherry-pick:** aplicar commit específico

  ```bash
  git cherry-pick <commit-hash>
  ```

---

## 💻 Aprimorando o GitHub Desktop

**Criar Novo Repositório**
![Criar Repositório](path/to/new-repo-screenshot.png)

**Gráfico de Branches e Histórico**
![Histórico Git](path/to/history-screenshot.png)

**Fluxo de Pull Request**

- Botão **Create Pull Request** integra ao browser

**Atalhos Úteis**:

- `Ctrl+Enter`: Commit
- `Ctrl+Shift+K`: Fetch origin

---

## 📝 Boas Práticas de Mensagens de Commit

Utilize **Conventional Commits**:

```text
feat: adiciona login com Google
fix: corrige cálculo de impostos
docs: atualiza README.md
```

Ferramentas de validação: Commitlint, Husky, Git Hooks.

---

## 🛠️ Integração com CI/CD (GitHub Actions)

Exemplo `.github/workflows/main.yml`:

```yaml
name: CI
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm install
      - run: npm test
```

---

## 🔄 Troubleshooting Comum

| Problema                                  | Solução                                    |
| ----------------------------------------- | ------------------------------------------ |
| `Your local changes would be overwritten` | `git stash && git pull && git stash pop`   |
| Desfazer commit não enviado               | `git reset --soft HEAD~1`                  |
| Recuperar arquivo deletado                | `git checkout HEAD -- caminho/arquivo.txt` |

---

## 🔀 Fluxo de Pull Request (GitHub)

**Criar e fazer checkout de uma branch:**

```bash
git checkout -b feature/xyz
```

**Commit e push:**

```bash
git add . && git commit -m "feat: xyz"
git push -u origin feature/xyz
```

**No GitHub:** **New Pull Request** → escolha base `main` → `Squash and merge` → exclua branch

---

## ⚔️ Comparativo: Terminal vs GitHub Desktop

| Recurso                | Terminal                  | GitHub Desktop              |
| ---------------------- | ------------------------- | --------------------------- |
| Complexidade           | Alta (controle total)     | Baixa (interface gráfica)   |
| Resolução de Conflitos | Manual (editor de texto)  | Visual (UI embutida)        |
| Histórico              | `git log --graph`         | Gráfico interativo          |
| Indicado para          | Avançados, scripts, CI/CD | Iniciantes, equipes visuais |

---

## 📑 Cheat Sheet Git (Resumo)

| Ação             | Comando                                 |
| ---------------- | --------------------------------------- |
| Inicializar repo | `git init`                              |
| Clonar           | `git clone <url>`                       |
| Status           | `git status`                            |
| Stage            | `git add <file>` / `git add .`          |
| Commit           | `git commit -m "msg"`                   |
| Push             | `git push origin <branch>`              |
| Pull             | `git pull origin <branch>`              |
| Branch           | `git branch` / `git checkout -b <name>` |

---

## 🔗 Ferramentas Complementares

- **GitKraken**: cliente gráfico avançado.
- **Oh My Zsh**: plugins de Git para terminal.
- **GitHub CLI** (`gh`): gerencie repositórios e PRs no terminal.
