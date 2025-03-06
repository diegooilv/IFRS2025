
public class Escola {

    private String nome;
    private String cnpj;
    private String endereco;
    private String telefone;
    private String email;

    public Escola(String nome, String cnpj, String endereco, String telefone, String email) {
        this.setNome(nome);
        this.setCnpj(cnpj);
        this.setEndereco(endereco);
        this.setTelefone(telefone);
        this.setEmail(email);
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setCnpj(String cnpj) {
        String cnpjDigits = cnpj.replaceAll("\\D", "");

        if (cnpjDigits.length() != 14 || cnpjDigits.matches("(\\d)\\1{13}")) {
            throw new IllegalArgumentException("CNPJ inválido!");
        }

        int soma = 0;
        int[] pesosPrimeiro = {5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2};
        for (int i = 0; i < 12; i++) {
            soma += Character.getNumericValue(cnpjDigits.charAt(i)) * pesosPrimeiro[i];
        }
        int resto = soma % 11;
        int primeiroDigito = (resto < 2) ? 0 : 11 - resto;
        if (primeiroDigito != Character.getNumericValue(cnpjDigits.charAt(12))) {
            throw new IllegalArgumentException("CNPJ inválido!");
        }

        soma = 0;
        int[] pesosSegundo = {6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2};
        for (int i = 0; i < 13; i++) {
            soma += Character.getNumericValue(cnpjDigits.charAt(i)) * pesosSegundo[i];
        }
        resto = soma % 11;
        int segundoDigito = (resto < 2) ? 0 : 11 - resto;
        if (segundoDigito != Character.getNumericValue(cnpjDigits.charAt(13))) {
            throw new IllegalArgumentException("CNPJ inválido!");
        }

        this.cnpj = cnpjDigits;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public void setTelefone(String telefone) {
        if (!telefone.matches("^\\(\\d{2}\\)\\d{4,5}-\\d{4}$")) {
            throw new IllegalArgumentException("Telefone inválido!");
        }
        this.telefone = telefone;
    }

    public void setEmail(String email) {
        if (!email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")) {
            throw new IllegalArgumentException("Email inválido!");
        }
        this.email = email;
    }

    public String getNome() {
        return this.nome;
    }

    public String getCnpj() {
        return this.cnpj;
    }

    public String getEndereco() {
        return this.endereco;
    }

    public String getTelefone() {
        return this.telefone;
    }

    public String getEmail() {
        return this.email;
    }

}
