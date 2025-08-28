# 🖥️ Java 

```mermaid
graph TD
    style Start fill:#87CEFA,stroke:#333,stroke-width:2px
    style Login fill:#FFA07A,stroke:#333,stroke-width:2px
    style Controller fill:#90EE90,stroke:#333,stroke-width:2px
    style Model fill:#FFD700,stroke:#333,stroke-width:2px
    style DAO fill:#D8BFD8,stroke:#333,stroke-width:2px
    style Arquivo fill:#FFE4B5,stroke:#333,stroke-width:2px
    style Tela fill:#87CEFA,stroke:#333,stroke-width:2px
    style Lista fill:#FFB6C1,stroke:#333,stroke-width:2px
    style Campos fill:#ADD8E6,stroke:#333,stroke-width:2px
    style Botao fill:#90EE90,stroke:#333,stroke-width:2px
    style Mensagem fill:#FF6347,stroke:#333,stroke-width:2px

    Start[🚀 Programa inicia] --> Carregar[📂 Carrega dados salvos]
    Carregar --> Tela[Tela Principal atualizada]

    Tela --> Login[📝 Tela de Login]
    Login --> Controller[🟢 Controller verifica login]
    Controller -->|✅ Email e senha corretos| Tela
    Controller -->|❌ Errado| Mensagem[⚠️ Alerta: Email ou senha incorreta]

    Tela --> Lista[JList: lista de objetos 🟦]
    Lista --> Controller[🟢 Controller pega objeto selecionado]
    Controller --> Campos[📋 Preenche campos id, nome, descrição, valor]
    Controller --> Botao[🔘 Botão muda para Editar]

    Controller --> DAO[💾 DAO / BrincadeiraDAO.java]
    DAO --> Arquivo[(📄 brinquedo.dat)]
    DAO --> Controller
```

---

## 🔹 Legenda

- **💾 DAO / 📂 Arquivo:** onde os dados são salvos e carregados
- **🟢 Controller:** decide tudo e conecta Model + View
- **📝 Login / ⚠️ Mensagem:** simples, didático, compara strings
- **🟦 JList:** clique → seleciona objeto → preenche campos
- **📋 Campos + 🔘 Botão:** interface pronta para editar ou salvar
- **Tela Principal:** exibe a lista e campos para o usuário

---

## 🔹 Fluxo resumido em palavras

1. 🚀 Programa inicia → carrega dados 💾📂
2. 📝 Usuário faz login → ✅ Controller verifica → tela principal ou ⚠️ alerta
3. 🟦 Clicar na lista → 🟢 Controller pega objeto → 📋 campos preenchidos → 🔘 botão vira Editar
4. Alteração → 🟢 Controller salva tudo → 💾 DAO escreve em 📄 arquivo
5. Tela se atualiza automaticamente
