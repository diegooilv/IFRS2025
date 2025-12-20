# Resumo para Estudos – Prova 1 de Programação III 🎯

Resumo dos conceitos principais pra consulta rápida antes da prova.

---

## Índice 📖

- [Base do Java](#base-do-java-)
- [Modelo MVC](#modelo-mvc-)
- [Guia Prático](#guia-prático-)
- [Boas Práticas](#boas-práticas-)
- [Recursos Adicionais](#recursos-adicionais-)

---

## Base do Java 💻

### Tipos de Variáveis 🧮

#### Tipos Primitivos

| Tipo      | Exemplo                 | Descrição                     |
| --------- | ----------------------- | ----------------------------- |
| `int`     | `int idade = 25;`       | Números inteiros (32 bits)    |
| `double`  | `double pi = 3.1415;`   | Números decimais (64 bits)    |
| `float`   | `float altura = 1.75f;` | Números decimais (32 bits) \* |
| `char`    | `char letra = 'A';`     | Caractere único               |
| `boolean` | `boolean ativo = true;` | Valores lógicos               |

> ⚠️ **Importante:**
>
> - O sufixo `f` é obrigatório em literais float
> - `String` **não é tipo primitivo** (mas é amplamente utilizado)

#### Tipos de Referência

```java
public class Pessoa {
    private String nome;

    // Construtor
    public Pessoa(String nome) {
        this.nome = nome;
    }

    // Getter
    public String getNome() {
        return nome;
    }
}
```

### Estruturas de Controle 🎛️

#### Condicional if-else

```java
int nota = 85;
if (nota >= 90) {
    System.out.println("Excelente!");
} else if (nota >= 70) {
    System.out.println("Bom!");  // Este será executado
} else {
    System.out.println("Precisa melhorar");
}
```

#### Loop for

```java
// Imprime números pares de 0 a 8
for(int i = 0; i < 10; i += 2) {
    System.out.println(i);  // 0 2 4 6 8
}
```

### POO em Java 🏗️

#### Encapsulamento

```java
public class ContaBancaria {
    private double saldo;  // Atributo privado

    public void depositar(double valor) {
        if(valor > 0) {
            saldo += valor;
        }
    }

    public double getSaldo() {
        return saldo;
    }
}
```

---

## Modelo MVC 🖼️

### Estrutura Recomendada

```plaintext
src/
├── controller/
│   ├── UsuarioController.java
│   └── ...
├── model/
│   ├── Usuario.java
│   └── ...
└── view/
    ├── LoginView.java
    └── ...
```

### Responsabilidades

| Componente     | Função Principal                    | Exemplo                  |
| -------------- | ----------------------------------- | ------------------------ |
| **Model**      | Gerenciar dados e regras de negócio | Classe `Produto`         |
| **View**       | Exibir informações e coletar inputs | `JFrame` com formulários |
| **Controller** | Mediar interações Model-View        | Tratar eventos de botão  |

---

## Guia Prático 🛠️

### Criação de Projeto MVC

1. **Novo Projeto**

   - `File > New Project > Java with Ant > Java Application`
   - Desmarque "Create Main Class"

2. **Estrutura de Pastas**

   ```plaintext
   src/
   ├── controller/
   ├── model/
   └── view/
   ```

---

## Boas Práticas ✅

### Convenções de Nomenclatura

| Elemento | Exemplo Correto     | Exemplo Incorreto    |
| -------- | ------------------- | -------------------- |
| Classe   | `UsuarioController` | `usuario_controller` |
| Variável | `numeroConta`       | `NumeroConta`        |
| Método   | `calcularSaldo()`   | `Calcular_Saldo()`   |
| Pacote   | `model.utils`       | `ModelUtils`         |

### Dicas de Implementação

1. Sempre encapsule atributos com `private`
2. Use `@Override` para métodos sobrescritos
3. Mantenha a view o mais "burra" possível
4. Teste cada componente separadamente

---

## Recursos Adicionais 📚

### **Vídeos Recomendados**

1. [Introdução ao MVC](https://youtube.com/watch?v=35h8DURLCe8)
2. [Trabalhando com JList](https://youtube.com/watch?v=JcbALSW-Okc)
3. [Gerenciamento de Telas](https://youtube.com/watch?v=Lf0dposBsNY)
4. [Alterando o Background de um JDesktopPane](https://www.youtube.com/watch?v=9UTWKN01rLA)

### Material Complementar

- [Documentação Oficial Java](https://docs.oracle.com/javase/8/docs/api/)
- [Exemplos de MVC](https://www.javatpoint.com/mvc-in-java)
