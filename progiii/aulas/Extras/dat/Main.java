
import java.util.List;

public class Main {

    public static void main(String[] args) {
        List<Pessoa> pessoas = PessoaDAO.carregar();

        pessoas.add(new Pessoa("Diego", 20));
        pessoas.add(new Pessoa("Maria", 22));

        PessoaDAO.salvar(pessoas);

        System.out.println("Pessoas salvas:");
        pessoas.forEach(System.out::println);
    }
}
