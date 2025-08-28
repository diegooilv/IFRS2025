# Resumo Visual — Java Desktop

---

## 1️⃣ Estrutura MVC

```mermaid
graph TD
    style M fill:#FFD700,stroke:#333,stroke-width:2px
    style V fill:#87CEFA,stroke:#333,stroke-width:2px
    style C fill:#90EE90,stroke:#333,stroke-width:2px

    M[Model: Guarda os dados] --> C[Controller: Decide o que fazer]
    V[View: Tela do usuário] --> C
    C --> V
```

- **Model (amarelo):** objetos como Brincadeira, Pessoa, etc.
- **View (azul):** janelas, botões, campos de texto, listas.
- **Controller (verde):** recebe clique, chama Model e atualiza View.

---

## 2️⃣ Fluxo de salvar e carregar dados

```mermaid
graph TD
    style Main fill:#FFC0CB,stroke:#333,stroke-width:2px
    style DAO fill:#D8BFD8,stroke:#333,stroke-width:2px
    style Arquivo fill:#FFE4B5,stroke:#333,stroke-width:2px
    style Model fill:#ADD8E6,stroke:#333,stroke-width:2px

    Main[Programa principal] -->|usa| DAO[DAO / BrincadeiraDAO.java]
    DAO -->|salvar / carregar| Arquivo[(brinquedo.dat)]
    Main -->|usa| Model[Brincadeira.java]
```

- **Salvar:** lista de objetos → arquivo
- **Carregar:** arquivo → lista de objetos

---

## 3️⃣ Seleção de item na lista (JList)

```mermaid
graph TD
    style Lista fill:#FFA07A,stroke:#333,stroke-width:2px
    style Controller fill:#90EE90,stroke:#333,stroke-width:2px
    style Campos fill:#87CEFA,stroke:#333,stroke-width:2px

    Lista[JList: itens] -->|usuário clica| Controller
    Controller -->|pega objeto| Model[Brincadeira]
    Controller -->|preenche| Campos[Campos de id, nome, descrição, valor]
    Controller -->|muda| Botao[Botão: Salvar → Editar]
```

- Clicar seleciona um objeto
- Preenche campos na tela
- Muda botão para “Editar”

---

## 4️⃣ Login simples

```mermaid
graph TD
    style Tela fill:#87CEFA,stroke:#333,stroke-width:2px
    style Controller fill:#90EE90,stroke:#333,stroke-width:2px
    style Dados fill:#FFD700,stroke:#333,stroke-width:2px
    style Mensagem fill:#FF6347,stroke:#333,stroke-width:2px

    Tela[Tela de Login] --> Controller
    Controller -->|compara| Dados[(Email + Senha)]
    Controller -->|ok| TelaPrincipal[Tela Principal]
    Controller -->|erro| Mensagem[Alerta: Email ou senha incorreta]
```

- Digitar email/senha → Controller verifica → mostra tela principal ou alerta

---

## 5️⃣ Fluxo geral do programa

```mermaid
graph TD
    style Start fill:#87CEFA,stroke:#333,stroke-width:2px
    style Carregar fill:#FFD700,stroke:#333,stroke-width:2px
    style Usuario fill:#FFA07A,stroke:#333,stroke-width:2px
    style Controller fill:#90EE90,stroke:#333,stroke-width:2px
    style Salvar fill:#D8BFD8,stroke:#333,stroke-width:2px
    style View fill:#87CEFA,stroke:#333,stroke-width:2px

    Start[Programa inicia] --> Carregar[Carrega dados salvos]
    Carregar --> View[Tela atualizada]
    View --> Usuario[Usuário clica / digita]
    Usuario --> Controller[Controller processa ação]
    Controller --> Salvar[Salva a lista inteira]
    Salvar --> View[Tela atualizada]
```

- Inicia → carrega dados → usuário interage → controller processa → salva → tela atualizada

---

## ✅ Dicas para prova

- Model = dados, View = tela, Controller = decide e liga tudo
- Salvar toda a lista evita perder informações
- Clicar na lista preenche campos e muda botão
- Login simples = comparar strings
- Alternar telas = remover tudo do JDesktopPane e adicionar novo painel
