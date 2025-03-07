package control;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JTextField;
import model.Calculate;

public class CalculateController {

    private JTextField jTextFieldNumberA;
    private JTextField jTextFieldNumberB;
    private JButton jButtonSum;
    private JButton jButtonSub;
    private JLabel jLabelResponse;

    public CalculateController(JTextField jTextFieldNumberA, JTextField jTextFieldNumberB, JButton jButtonSum, JButton jButtonSub, JLabel jLabelResponse) {
        this.jTextFieldNumberA = jTextFieldNumberA;
        this.jTextFieldNumberB = jTextFieldNumberB;
        this.jButtonSum = jButtonSum;
        this.jButtonSub = jButtonSub;
        this.jLabelResponse = jLabelResponse;

        // Adicionar eventos de ação para os botões
        this.jButtonSum.addActionListener(e -> sum()); // Ação para soma
        this.jButtonSub.addActionListener(e -> sub()); // Ação para subtração
    }

    // Método para obter os números dos campos de texto
    private Calculate createCalculate() {
        int numberA = 0;
        int numberB = 0;
        try {
            numberA = Integer.parseInt(jTextFieldNumberA.getText());
            numberB = Integer.parseInt(jTextFieldNumberB.getText());
        } catch (NumberFormatException ex) {
            jLabelResponse.setText("Erro: Digite apenas números válidos.");
            return null;
        }
        return new Calculate(numberA, numberB);
    }

    // Método para realizar a soma
    public void sum() {
        Calculate calc = createCalculate();
        if (calc != null) {
            String result = String.valueOf(calc.sum());
            jLabelResponse.setText(result);
        }
    }

    // Método para realizar a subtração
    public void sub() {
        Calculate calc = createCalculate();
        if (calc != null) {
            String result = String.valueOf(calc.sub());
            jLabelResponse.setText(result);
        }
    }

    public CalculateController() {
    }
}
