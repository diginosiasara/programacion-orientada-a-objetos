package com.empresa.libreria.model;

import java.io.Serializable;

public class Libro implements Serializable {
    private int id;
    private String titulo;
    private String autor;
    private double precio;

    public Libro(int id, String titulo, String autor, double precio) {
        this.id = id;
        this.titulo = titulo;
        this.autor = autor;
        this.precio = precio;
    }

    public int getId() { return id; }
    public String getTitulo() { return titulo; }
    public String getAutor() { return autor; }
    public double getPrecio() { return precio; }
}