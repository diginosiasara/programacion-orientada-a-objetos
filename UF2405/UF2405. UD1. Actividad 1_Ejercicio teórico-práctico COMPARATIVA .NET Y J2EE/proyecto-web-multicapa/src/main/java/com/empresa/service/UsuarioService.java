package com.empresa.proyecto.service;

import com.empresa.proyecto.dao.UsuarioDAO;
import com.empresa.proyecto.model.Usuario;
import java.util.List;

public class UsuarioService {
    private UsuarioDAO usuarioDAO;

    public UsuarioService() {
        this.usuarioDAO = new UsuarioDAO();
    }

    public List<Usuario> listarUsuarios() {
        // Aquí podrías añadir validaciones de negocio antes de devolver los datos
        return usuarioDAO.obtenerTodosLosUsuarios();
    }
}