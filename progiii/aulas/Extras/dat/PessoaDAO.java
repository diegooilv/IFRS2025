
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class PessoaDAO {

    private static final String ARQUIVO = "pessoas.dat";

    // Carregar lista do arquivo
    public static List<Pessoa> carregar() {
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(ARQUIVO))) {
            return (List<Pessoa>) ois.readObject();
        } catch (FileNotFoundException e) {
            return new ArrayList<>(); // Se não existir, retorna lista vazia
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    // Salvar lista no arquivo
    public static void salvar(List<Pessoa> pessoas) {
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(ARQUIVO))) {
            oos.writeObject(pessoas);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
