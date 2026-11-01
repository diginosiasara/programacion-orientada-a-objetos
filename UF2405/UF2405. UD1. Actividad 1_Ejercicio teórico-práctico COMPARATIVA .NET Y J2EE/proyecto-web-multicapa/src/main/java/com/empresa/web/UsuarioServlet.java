package com.empresa.proyecto.web;

import com.empresa.proyecto.model.Usuario;
import com.empresa.proyecto.service.UsuarioService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/usuarios")
public class UsuarioServlet extends HttpServlet {
    
    private UsuarioService usuarioService;

    @Override
    public void init() throws ServletException {
        usuarioService = new UsuarioService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Obtener datos de la capa de negocio
        List<Usuario> usuarios = usuarioService.listarUsuarios();

        // 2. Configurar la respuesta HTTP
        response.setContentType("text/html;charset=UTF-8");
        
        // 3. Generar la Vista (HTML dinámico)
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html><head><title>Lista de Usuarios</title>");
        out.println("<link rel='stylesheet' href='css/estilos.css'>");
        out.println("</head><body>");
        out.println("<div class='container'>");
        out.println("<h2>Usuarios registrados (Generado por Servlet J2EE)</h2>");
        out.println("<ul class='lista-usuarios'>");
        
        for (Usuario u : usuarios) {
            out.println("<li><strong>" + u.getNombre() + "</strong> - " + u.getEmail() + "</li>");
        }
        
        out.println("</ul>");
        out.println("<a href='index.html' class='btn'>Volver al inicio</a>");
        out.println("</div></body></html>");
    }
}