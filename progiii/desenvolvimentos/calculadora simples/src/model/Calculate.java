/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Diego
 */
public class Calculate {

    private int a;
    private int b;

    public int getA() {
        return a;
    }

    public void setA(int a) {
        this.a = a;
    }

    public int getB() {
        return b;
    }

    public void setB(int b) {
        this.b = b;
    }

    public Calculate(int a, int b) {
        this.a = a;
        this.b = b;
    }

    public Calculate() {
    }

    public int sum() {
        return this.a + this.b;
    }

    public int sub() {
        return this.a - this.b;
    }
}
