package com.empresa.libreria.service;

import com.empresa.libreria.dao.LibroDAO;
import com.empresa.libreria.model.Libro;
import java.util.List;

public class LibroService {
    private LibroDAO libroDAO;

    public LibroService() {
        this.libroDAO = new LibroDAO();
    }

    public List<Libro> listarLibros() {
        // Aquí irían reglas de negocio (ej. aplicar descuentos, filtrar por stock, etc.)
        return libroDAO.obtenerCatalogo();
    }
}