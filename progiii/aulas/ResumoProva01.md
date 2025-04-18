# Resumo para Estudos – Prova 1 de Programação III 🎓

Este resumo tem como objetivo fornecer uma base prática e rápida para consulta antes da prova. A estrutura foi organizada para facilitar a compreensão dos principais tópicos abordados.

---

## Índice 📚

- [Resumo para Estudos – Prova 1 de Programação III 🎓](#resumo-para-estudos--prova-1-de-programação-iii-)
  - [Índice 📚](#índice-)
  - [Base do Java 💻](#base-do-java-)
    - [Tipos de Variáveis 📝](#tipos-de-variáveis-)
      - [Tipos Primitivos](#tipos-primitivos)
      - [Tipos Não Primitivos](#tipos-não-primitivos)
    - [Estruturas de Controle 🔄](#estruturas-de-controle-)
      - [Condicional (if...else) ❓](#condicional-ifelse-)
      - [Laço de Repetição (for) 🔁](#laço-de-repetição-for-)
    - [Conceitos de POO Utilizados 🏗️](#conceitos-de-poo-utilizados-️)
      - [Polimorfismo](#polimorfismo)
      - [Encapsulamento 🔒](#encapsulamento-)
  - [Modelo MVC 🎨](#modelo-mvc-)
    - [Estrutura Sugerida do Projeto 🗂️](#estrutura-sugerida-do-projeto-️)
  - [Guia Prático 🚀](#guia-prático-)
    - [Passo a Passo 🛠️](#passo-a-passo-️)
      - [Criação do Projeto](#criação-do-projeto)
      - [Estrutura do Projeto](#estrutura-do-projeto)
      - [Próximos Passos](#próximos-passos)
    - [Vídeo de Apoio 📹](#vídeo-de-apoio-)
  - [App JList](#app-jlist)
  - [Observações 📝](#observações-)

---

## Base do Java 💻

Nesta seção são apresentados os fundamentos do Java, com ênfase nos conteúdos iniciais e na sintaxe básica.

### Tipos de Variáveis 📝

#### Tipos Primitivos

Utilizados para armazenar valores simples:

```java
String string = "Frase"; // Use aspas duplas para strings (lembre-se: char usa aspas simples)
int numero = 0;          // Números inteiros
char letra = 'w';        // Caracteres individuais
float numeroFlutuante = 2.4f;   // Números com ponto flutuante (lembre do 'f' no final)
double numeroDecimal = 13.1415; // Números decimais (geralmente preferido ao float)
boolean verdadeiro = true;      // Valores lógicos: true ou false
```

> **Observação:**
>
> - Existem outros tipos, mas os apresentados foram os trabalhados em aula.
> - _String_ não é um tipo primitivo, mas foi incluído por questões didáticas. 😉

#### Tipos Não Primitivos

Utilizados para criar objetos e representar conceitos mais complexos:

```java
public class Pessoa {
    String nome;
    // Outros atributos e métodos podem ser adicionados
}
```

Exemplo de criação e uso de um objeto:

```java
public class Main {
    public static void main(String[] args) {
        Pessoa pessoa = new Pessoa(); // Instanciando um objeto do tipo Pessoa
    }
}
```

### Estruturas de Controle 🔄

#### Condicional (if...else) ❓

Utilizado para decisões baseadas em condições:

```java
int variavel = 2;
if (variavel == 1) {
    // Código para quando variavel for igual a 1
} else if (variavel == 3) {
    // Código para quando variavel for igual a 3
} else {
    // Código para as demais condições
}
```

#### Laço de Repetição (for) 🔁

Exemplo de laço para imprimir valores de 0 a 9:

```java
for (int i = 0; i < 10; i++) {
    System.out.println(i); // Saída: 0 1 2 3 4 5 6 7 8 9
}
```

> **Nota:**  
> Outros laços como _while_, _do-while_ e _switch_ existem, mas foram ignorados por não terem sido utilizados em Programação III. 🤷‍♂️

### Conceitos de POO Utilizados 🏗️

#### Polimorfismo

- **Sobrescrita (Override)** e **Sobrecarga (Overload)** de métodos.
  > _Embora não tenha tido uso intensivo, foi mencionado durante as aulas._

#### Encapsulamento 🔒

- **Setters e Getters:** Gerenciam o acesso aos atributos das classes.
- **Modificadores de Acesso:** `private` e `public` (o `protected` ainda não foi explorado).

> **Observação:**  
> Outros pilares da Programação Orientada a Objetos tiveram participação reduzida nesta disciplina, conforme abordado em aula.

---

## Modelo MVC 🎨

O **Modelo MVC** (Model – View – Controller) organiza o desenvolvimento de aplicações de forma modular, atribuindo responsabilidades específicas a cada parte:

- **M (Model / Modelo):** Representa as entidades do sistema, como _Pessoa_, _Carro_, etc.
- **V (View / Visão):** Responsável pela interface gráfica (por exemplo, um JFrame).
- **C (Controller / Controlador):** Atua como intermediário, manipulando eventos e interligando o model e a view.

### Estrutura Sugerida do Projeto 🗂️

```
Projeto
└── Source Package
    ├── control
    │    └── Controlador.java
    ├── model
    │    └── Modelo.java
    └── view
         └── View.java (JFrame)
```

> **Função de Cada Componente:**
>
> - **Controlador:** Gerencia a comunicação entre o model e a view, manipulando eventos e a lógica da aplicação.
> - **Modelo:** Define a estrutura dos dados (ex: Pessoa, Carro, etc.).
> - **View:** Cria a interface visual através de componentes gráficos (por exemplo, JFrame). 😃

---

## Guia Prático 🚀

Esta seção é um roteiro prático para criar um projeto Java com a estrutura MVC.

### Passo a Passo 🛠️

#### Criação do Projeto

1. **Local:** Vá ao canto superior esquerdo → **File > Create New Project**
2. **Selecionar:** _Java With Ant > Java Application_
3. **Configurar:**
   - Clique em _Next_.
   - Defina o nome do projeto.
   - Desmarque a opção **Create Main**.
4. **Finalizar:** Clique em _Finish_.

#### Estrutura do Projeto

Organize a estrutura conforme abaixo:

```
Projeto
└── Source Package
    ├── control (Java Package)
    │    └── Controlador.java (Java Class)
    ├── model (Java Package)
    │    └── Modelo.java (Java Class)
    └── view (Java Package)
         └── View.java (JFrame)
```

#### Próximos Passos

- Defina a lógica do seu modelo conforme o problema.
- Implemente o controle dos eventos na classe _Controlador_.
- Desenvolva a interface visual na classe _View_ e integre com o _Controlador_.
- **Compilar & Executar:** Utilize _Shift+F11_ para compilar e _F6_ para executar.

### Vídeo de Apoio 📹

Para complementar os estudos, assista ao vídeo explicativo:

---

## App JList

[Assista ao vídeo](https://www.youtube.com/watch?v=JcbALSW-Okc)

> Houve um pequeno erro no aplicativo de gravação, mas nada muito grave. Assista em tela cheia!  
> **Dica:** Ver os vídeos em sequência pode ajudar a fixar melhor o conteúdo apresentado nas aulas.

---

## Observações 📝

- **Nomenclatura:**
  - Nome do projeto: **P**rojeto
  - Nome das pastas: **p**asta
  - Nome das classes: **C**lasse
  - Nome das variáveis: **n**ome**C**ompleto
  - Nome dos métodos: **m**ostrar**R**esultados

> **Nota Final:**  
> Este material foi desenvolvido de forma autônoma, com base nos conteúdos apresentados em aula. Aprofunde-se nos tópicos e pratique os exemplos para fixar melhor os conceitos! 🚀
