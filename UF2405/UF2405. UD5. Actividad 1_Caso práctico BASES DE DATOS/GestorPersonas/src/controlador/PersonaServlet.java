package controlador;

import dao.PersonaDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Persona;

/**
 * Servlet Controlador que implementa el patrón MVC.
 * Recibe las peticiones, invoca al DAO y redirige a la JSP adecuada.
 */
@WebServlet("/Personas")
public class PersonaServlet extends HttpServlet {
    
    private PersonaDAO dao = new PersonaDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion = request.getParameter("accion");
        if (accion == null) accion = "listar";
        
        try {
            switch (accion) {
                case "listar":
                    listar(request, response);
                    break;
                case "buscar":
                    buscar(request, response);
                    break;
                case "contar":
                    contar(request, response);
                    break;
                default:
                    listar(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Error: " + e.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("/resultado.jsp");
            rd.forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion = request.getParameter("accion");
        
        try {
            if ("agregar".equals(accion)) {
                String nombre = request.getParameter("nombre");
                String apellidos = request.getParameter("apellidos");
                dao.agregar(nombre, apellidos);
                response.sendRedirect(request.getContextPath() + "/Personas?accion=listar");
            }
        } catch (Exception e) {
            request.setAttribute("error", "Error al agregar: " + e.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("/resultado.jsp");
            rd.forward(request, response);
        }
    }
    
    private void listar(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List<Persona> personas = dao.listarTodas();
        request.setAttribute("personas", personas);
        request.setAttribute("titulo", "Listado de Personas");
        RequestDispatcher rd = request.getRequestDispatcher("/resultado.jsp");
        rd.forward(request, response);
    }
    
    private void buscar(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String inicial = request.getParameter("inicial");
        List<Persona> personas = dao.buscarPorInicial(inicial);
        request.setAttribute("personas", personas);
        request.setAttribute("titulo", "Personas que empiezan por '" + inicial + "'");
        RequestDispatcher rd = request.getRequestDispatcher("/resultado.jsp");
        rd.forward(request, response);
    }
    
    private void contar(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int total = dao.contarPersonas();
        request.setAttribute("mensaje", "Total de personas: " + total);
        RequestDispatcher rd = request.getRequestDispatcher("/resultado.jsp");
        rd.forward(request, response);
    }
}