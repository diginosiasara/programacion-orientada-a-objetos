package com.empresa.libreria.web;

import com.empresa.libreria.model.Libro;
import com.empresa.libreria.service.LibroService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/catalogo")
public class LibroServlet extends HttpServlet {
    
    private LibroService libroService;

    @Override
    public void init() throws ServletException {
        libroService = new LibroService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        List<Libro> libros = libroService.listarLibros();

        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html><head><title>Catálogo de Libros</title>");
        out.println("<link rel='stylesheet' href='css/estilos.css'>");
        out.println("</head><body>");
        out.println("<div class='container'>");
        out.println("<h2>📚 Catálogo de la Librería</h2>");
        out.println("<table class='tabla-libros'>");
        out.println("<thead><tr><th>ID</th><th>Título</th><th>Autor</th><th>Precio</th></tr></thead>");
        out.println("<tbody>");
        
        for (Libro l : libros) {
            out.println("<tr>");
            out.println("<td>" + l.getId() + "</td>");
            out.println("<td><strong>" + l.getTitulo() + "</strong></td>");
            out.println("<td>" + l.getAutor() + "</td>");
            out.println("<td>" + String.format("%.2f €", l.getPrecio()) + "</td>");
            out.println("</tr>");
        }
        
        out.println("</tbody></table>");
        out.println("<a href='index.html' class='btn'>Volver al inicio</a>");
        out.println("</div></body></html>");
    }
}