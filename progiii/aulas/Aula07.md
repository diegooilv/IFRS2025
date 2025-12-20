# Aula 04/04/2025

## Objetivo

Desenvolver uma aplicação Java com interface gráfica utilizando a biblioteca Swing, composta por dois painéis funcionais:

- **Painel de entrada de dados**: contendo campos para ID, Nome, CPF e Telefone, além de um botão para salvar as informações.
- **Painel de visualização**: exibindo os dados cadastrados em uma lista, permitindo a visualização das entradas de forma organizada.

## Conceitos Aplicados

### 🧱 Programação Orientada a Objetos (POO)

A aplicação foi estruturada com base nos princípios da Programação Orientada a Objetos, utilizando:

- **Encapsulamento**: os dados da classe `Pessoa` são acessados e modificados por meio de métodos públicos (`get` e `set`), protegendo o estado interno do objeto.
- **Abstração**: a classe `Pessoa` representa uma entidade do mundo real com suas principais características (ID, nome, CPF, telefone).
- **Modularidade**: separação clara entre as responsabilidades de cada classe, facilitando manutenção e reuso.
- **Reutilização de código**: uso de coleções (`ArrayList`) e componentes Swing organizados de forma reutilizável.

### 🧩 Arquitetura MVC (Model–View–Controller)

O projeto segue uma estrutura simplificada baseada no padrão MVC:

- **Model (Modelo):**
  - A classe `Pessoa` representa os dados da aplicação.
- **View (Visão):**
  - A interface gráfica é composta por painéis com campos de texto, botão e lista (`JPanel`, `JTextField`, `JList`), permitindo a interação do usuário.
- **Controller (Controlador):**
  - A classe `PessoaControlador` faz a mediação entre os dados e a interface gráfica. Ela manipula os dados inseridos, atualiza a visualização e controla o fluxo da aplicação.

Essa separação contribui para um código mais organizado, testável e de fácil manutenção.

## Recursos Disponíveis

- 🔗 [Executável JAR do projeto](Dist/Aula07/Proj4.jar)
- 📁 [Download da estrutura completa do projeto (ZIP)](Projects/Proj4.zip)

---

> ℹ️ **Observação**: Material baseado em conteúdo de aula, reorganizado para fins didáticos.
