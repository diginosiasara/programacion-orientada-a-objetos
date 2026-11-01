package com.empresa.login.dao;

import com.empresa.login.model.Usuario;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {
    private List<Usuario> baseDeDatos;

    public UsuarioDAO() {
        baseDeDatos = new ArrayList<>();
        // IMPORTANTE: Aquí pasamos los 4 argumentos (user, pass, nombreCompleto, rol)
        baseDeDatos.add(new Usuario("admin", "1234", "Administrador del Sistema", "ADMIN"));
        baseDeDatos.add(new Usuario("usuario", "pass", "Usuario Normal", "USER"));
    }

    public boolean validarCredenciales(String username, String password) {
        for (Usuario u : baseDeDatos) {
            if (u.getUsername().equals(username) && u.getPassword().equals(password)) {
                return true;
            }
        }
        return false;
    }

    public Usuario buscarPorUsername(String username) {
        for (Usuario u : baseDeDatos) {
            if (u.getUsername().equals(username)) {
                return u;
            }
        }
        return null;
    }
}