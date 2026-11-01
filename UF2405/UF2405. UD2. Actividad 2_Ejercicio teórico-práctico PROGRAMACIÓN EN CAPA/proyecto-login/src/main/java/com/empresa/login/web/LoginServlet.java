package com.empresa.login.web;

import com.empresa.login.model.Usuario;
import com.empresa.login.service.LoginService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    
    private LoginService loginService;

    @Override
    public void init() {
        // Inicializamos el servicio de lógica de negocio
        loginService = new LoginService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Recoger los datos enviados desde el formulario HTML
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        // 2. Llamar a la capa de Lógica de Negocio para validar
        if (loginService.autenticar(user, pass)) {
            
            // 3. Si es correcto, obtenemos el objeto completo y lo guardamos en la sesión
            Usuario usuarioLogueado = loginService.obtenerDatosUsuario(user);
            
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuarioLogueado);
            
            // Redirigir a la página de éxito
            response.sendRedirect("bienvenida.jsp");
            
        } else {
            // 4. Si es incorrecto, redirigir a la página de error
            response.sendRedirect("error.jsp");
        }
    }
}