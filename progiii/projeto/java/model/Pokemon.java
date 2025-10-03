import java.io.Serializable;
import java.net.MalformedURLException;
import java.net.URL;
import javax.swing.ImageIcon;


public class Pokemon implements Serializable {

    private String name;
    private String linkImage;
    private String linkIcon;
    private int raridade;

    public Pokemon(String name, String linkImage, String linkIcon, int raridade) {
        this.name = name;
        this.linkImage = linkImage;
        this.linkIcon = linkIcon;
        this.raridade = raridade;
    }

    public String getName() {
        return name;
    }

    public int getRaridade() {
        return raridade;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setRaridade(int raridade) {
        this.raridade = raridade;
    }

    public ImageIcon getImage() throws MalformedURLException {
        URL url = new URL(this.linkImage);
        ImageIcon img = new ImageIcon(url);
        return img;
    }

    public ImageIcon getIcon() throws MalformedURLException {
        URL url = new URL(this.linkIcon);
        ImageIcon img = new ImageIcon(url);
        return img;
    }
}
