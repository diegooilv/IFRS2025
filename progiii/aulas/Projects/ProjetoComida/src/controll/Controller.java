/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controll;

import javax.swing.JTextField;

/**
 *
 * @author Diego
 */
public class Controller {

    JTextField jTextFieldSabor;
    JTextField jTextFieldNome;

    public Controller(JTextField jTextFieldSabor, JTextField jTextFieldNome) {
        this.jTextFieldSabor = jTextFieldSabor;
        this.jTextFieldNome = jTextFieldNome;
    }

    public void teste() {
        String t1 = jTextFieldNome.getText();
        String t2 = jTextFieldSabor.getText();
    }

}
