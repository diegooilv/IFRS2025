# Aula – 21/02

Hoje aprendi como criar um projeto no _Apache NetBeans_. Abaixo, deixo um resumo dos passos que segui para configurar e rodar meu projeto:

---

## 1. Abrindo o NetBeans

- **Iniciando o Programa:**  
  Primeiro, abri o Apache NetBeans.  
  ![Abrir NetBeans](Aula01/p1.png)

- **Criando um Novo Projeto:**  
  Em seguida, selecionei a opção para criar um novo projeto.  
  ![Criar Projeto](Aula01/p2.png)

---

## 2. Configurando o Projeto

- **Selecionando o Template:**  
  Escolhi a opção **Java with Ant**.  
  ![Selecionar Java with Ant](Aula01/p3.png)

- **Definindo Nome e Configurações Iniciais:**  
  Dei um nome ao projeto e desmarquei a criação automática da classe `main` (não há necessidade, conforme explicado na aula).  
  ![Configurar Projeto](Aula01/p4.png)

- **Visualizando a Estrutura Inicial:**  
  Essa é a estrutura inicial do meu projeto:  
  ![Estrutura Inicial](Aula01/p5.png)

- **Realizando Alterações:**  
  Após algumas modificações, minha estrutura ficou assim:  
  ![Alteração 1](img/Aula01/p6.png)  
  ![Alteração 2](img/Aula01/p7.png)  
  ![Alteração 3](img/Aula01/p8.png)  
  ![Alteração 4](img/Aula01/p9.png)  
  ![Alteração 5](img/Aula01/p10.png)

---

## 3. Desenvolvendo a Interface

- **Modo Design:**  
  Iniciei o design arrastando componentes da _Palette_ para a tela.

- **Recuperando a Aba de Propriedades:**  
  Caso a aba de propriedades desapareça, utilizei a função de busca para recuperá-la.  
  ![Recuperar Propriedades](img/Aula01/p11.png)

- **Componentes Adicionados:**  
  Ao final, adicionei:

  - Menu Bar
  - Dois Painéis
  - Um Botão (com background customizado)

  O layout final ficou assim:  
  ![Layout Final](img/Aula01/p12.png)

---

## 4. Adicionando Eventos

- **Configurando o Evento no Botão:**  
  Cliquei no botão para adicionar um evento.  
  ![Adicionar Evento](img/Aula01/p13.png)

- **Definindo a Ação do Evento:**  
  Configurei a ação que será executada ao clicar no botão.  
  ![Configurar Ação](img/Aula01/p14.png)

### Exemplo de Código do Evento

```java
private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {
    // TODO: Adicione seu código aqui
    String msg = "Sou do Inter";
    System.out.println("Clicou no Botão");
    JOptionPane.showMessageDialog(rootPane, msg);
}
```

> **Observação:** Esse código é apenas um exemplo. Em uma aplicação real, a implementação pode variar conforme a necessidade.

---

## 5. Executando o Projeto

- **Rodando o Projeto:**  
  Para testar, pressione `F6`.  
  ![Executar Projeto](img/Aula01/p15.png)

- **Resolvendo Erro "Sem Classe main":**  
  Se aparecer o erro "sem classe main", clique em `<default config>`.
  ![Configuração Padrão](img/Aula01/p16.png)

- **Testando a Interface:**  
  Ao clicar no botão, a mensagem deverá ser exibida na tela.  
  ![Mensagem Exibida](img/Aula01/p17.png)

- **Finalizando a Execução:**  
  Para encerrar, utilize `Shift+F11` ou o botão correspondente ao lado do _Run_.  
  ![Finalizando Execução](img/Aula01/p18.png)

---

## 6. Localizando

- **Localização do Projeto:**  
  Após os testes, navegue até a pasta do projeto, por exemplo:
  `C:\Users\User\Documents\NetBeansProjects\aula01\dist`

- **Executando o Arquivo .jar:**  
  Para rodar o programa em outros dispositivos (com Java instalado), execute o arquivo `.jar`.

> **Atenção:** Certifique-se de que o Java está configurado nas variáveis de ambiente. Existem outros métodos para distribuir uma aplicação Java.

---
