package model;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author Diego
 */
public class Comida {

    String sabor;
    String nome;

    public Comida(String sabor, String nome) {
        this.sabor = sabor;
        this.nome = nome;
    }

    public String getSabor() {
        return sabor;
    }

    public void setSabor(String sabor) {
        this.sabor = sabor;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void imprimir() {
        System.out.println("=====================");
        System.out.println("Sabor: " + sabor);
        System.out.println("Sabor: " + nome);
        System.out.println("=====================");
    }
}
