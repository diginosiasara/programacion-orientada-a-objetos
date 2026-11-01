package com.empresa.login.service;

import com.empresa.login.dao.UsuarioDAO;
import com.empresa.login.model.Usuario;

public class LoginService {
    private UsuarioDAO usuarioDAO;

    public LoginService() {
        this.usuarioDAO = new UsuarioDAO();
    }

    public boolean autenticar(String username, String password) {
        return usuarioDAO.validarCredenciales(username, password);
    }

    public Usuario obtenerDatosUsuario(String username) {
        return usuarioDAO.buscarPorUsername(username);
    }
}