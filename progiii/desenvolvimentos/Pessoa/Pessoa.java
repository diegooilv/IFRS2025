/**
 *
 * @author Diego
 */
public final class Pessoa implements Serializable {

    private static final long serialVersionUID = 1L;

    private int id;
    private String nome;
    private String numero;
    private String email;
    private String cpf;
    private String endereco;

    public Pessoa(int id, String nome, String numero, String email, String cpf, String endereco) {
        setId(id);
        setNome(nome);
        setNumero(numero);
        setEmail(email);
        setCpf(cpf);
        setEndereco(endereco);
    }

    public int getId() {
        return id;
    }

    // Validação de ID: somente valores não negativos são aceitos
    public void setId(int id) {
        if (id < 0) {
            throw new IllegalArgumentException("ID Inválido!");
        }
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    // Validação de nome: deve conter mais de dois caracteres
    public void setNome(String nome) {
        if (nome == null || nome.length() <= 2) {
            throw new IllegalArgumentException("Nome Inválido");
        }
        this.nome = nome;
    }

    public String getNumero() {
        return numero;
    }

    // Validação de número de telefone: aceita formatos com DDD, opcional 9 e hífen
    public void setNumero(String numero) {
        if (numero == null || !numero.matches("^\\(?\\d{2}\\)?\\s?9?\\d{4}-?\\d{4}$")) {
            throw new IllegalArgumentException("Número inválido! Use o formato (51) 99999-9999");
        }
        this.numero = numero;
    }

    public String getEmail() {
        return email;
    }

    // Validação de e-mail: formato básico com parte local, arroba e domínio
    public void setEmail(String email) {
        if (email == null || !email.matches("^[a-zA-Z0-9_+&*-]+(?:\\."
                + "[a-zA-Z0-9_+&*-]+)*@"
                + "(?:[a-zA-Z0-9-]+\\.)+[a-z"
                + "A-Z]{2,7}$")) {
            throw new IllegalArgumentException("E-mail inválido! Use um formato como exemplo@dominio.com");
        }
        this.email = email;
    }

    public String getCpf() {
        return cpf;
    }

    // Validação de CPF: verifica formato com pontos e hífen ou apenas dígitos
    // Em seguida, checa dígitos verificadores por algoritmo padrão
    public void setCpf(String cpf) {
        if (cpf == null || !cpf.matches("^\\d{3}\\.?\\d{3}\\.?\\d{3}-?\\d{2}$")) {
            throw new IllegalArgumentException("CPF inválido! Use formato 000.000.000-00 ou 00000000000");
        }
        if (!validarCpfDigitos(cpf)) {
            throw new IllegalArgumentException("CPF inválido: dígitos verificadores incorretos");
        }
        this.cpf = cpf;
    }

    public String getEndereco() {
        return endereco;
    }

    // Validação de endereço: exige texto seguido de número (ex: Rua Exemplo 123)
    public void setEndereco(String endereco) {
        if (endereco == null || !endereco.matches("([\\w\\W]+)\\s(\\d+)")) {
            throw new IllegalArgumentException("Digite um endereço válido!");
        }
        this.endereco = endereco;
    }

    // Método auxiliar para cálculo de dígitos verificadores do CPF
    private boolean validarCpfDigitos(String cpf) {
        cpf = cpf.replaceAll("[^\\d]", "");
        if (cpf.length() != 11) {
            return false;
        }
        if (cpf.chars().distinct().count() == 1) {
            return false;
        }
        try {
            int soma = 0;
            for (int i = 0; i < 9; i++) {
                soma += (cpf.charAt(i) - '0') * (10 - i);
            }
            int digito1 = 11 - (soma % 11);
            if (digito1 >= 10) {
                digito1 = 0;
            }
            soma = 0;
            for (int i = 0; i < 10; i++) {
                soma += (cpf.charAt(i) - '0') * (11 - i);
            }
            int digito2 = 11 - (soma % 11);
            if (digito2 >= 10) {
                digito2 = 0;
            }
            return digito1 == (cpf.charAt(9) - '0') && digito2 == (cpf.charAt(10) - '0');
        } catch (Exception e) {
            return false;
        }
    }
}
