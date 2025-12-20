# 🧑‍💻 Anotações de Git: Terminal & GitHub Desktop

Resumo do que eu mais uso/consulto: comandos básicos, alguns fluxos comuns, como lidar com conflito e um mini “cheat sheet”.

---

## 📂 Fluxos de trabalho (workflows)

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

### Criar feature branch

```bash
# baseado no develop ou main
git checkout -b feature/nova-funcionalidade
```

---

## ⚔️ Conflitos (resumo rápido)

### No terminal (passo a passo)

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

## 📁 `.gitignore` (na prática)

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

> Dica que salva tempo: templates do GitHub: [https://github.com/github/gitignore](https://github.com/github/gitignore)

---

## 🔧 Comandos que eu acabo usando

- **Stash:** guardar alterações temporárias

  ```bash
  git stash save "WIP: ajuste no CSS"
  git stash pop
  ```

- **Rebase interativo:** reorganizar commits

  ```bash
  git rebase -i HEAD~3
  ```

- **Cherry-pick:** aplicar um commit específico

  ```bash
  git cherry-pick <commit-hash>
  ```

---

## 💻 GitHub Desktop (atalhos e lembretes)

**Criar novo repositório**
![Criar Repositório](path/to/new-repo-screenshot.png)

**Gráfico de branches e histórico**
![Histórico Git](path/to/history-screenshot.png)

**Fluxo de Pull Request**

- Botão **Create Pull Request** integra ao browser

**Atalhos Úteis**:

- `Ctrl+Enter`: Commit
- `Ctrl+Shift+K`: Fetch origin

---

## 📝 Mensagens de commit (lembrete)

Eu tento seguir **Conventional Commits**:

```text
feat: adiciona login com Google
fix: corrige cálculo de impostos
docs: atualiza README.md
```

Ferramentas que costumam aparecer: Commitlint, Husky, Git hooks.

---

## 🛠️ CI/CD (GitHub Actions – exemplo)

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

## 🔄 Problemas comuns

| Problema                                  | Solução                                    |
| ----------------------------------------- | ------------------------------------------ |
| `Your local changes would be overwritten` | `git stash && git pull && git stash pop`   |
| Desfazer commit não enviado               | `git reset --soft HEAD~1`                  |
| Recuperar arquivo deletado                | `git checkout HEAD -- caminho/arquivo.txt` |

---

## 🔀 Pull request (fluxo rápido)

**Criar e fazer checkout de uma branch:**

```bash
git checkout -b feature/xyz
```

**Commit e push:**

```bash
git add . && git commit -m "feat: xyz"
git push -u origin feature/xyz
```

**No GitHub:** **New Pull Request** → base `main` → `Squash and merge` → excluir branch

---

## ⚔️ Terminal vs GitHub Desktop (diferença na prática)

| Recurso                | Terminal                  | GitHub Desktop              |
| ---------------------- | ------------------------- | --------------------------- |
| Complexidade           | Alta (controle total)     | Baixa (interface gráfica)   |
| Resolução de Conflitos | Manual (editor de texto)  | Visual (UI embutida)        |
| Histórico              | `git log --graph`         | Gráfico interativo          |
| Indicado para          | Avançados, scripts, CI/CD | Iniciantes, equipes visuais |

---

## 📑 Cheat sheet (resumo)

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

## 🔗 Ferramentas complementares

- **GitKraken**: cliente gráfico avançado.
- **Oh My Zsh**: plugins de Git para terminal.
- **GitHub CLI** (`gh`): gerencie repositórios e PRs no terminal.
