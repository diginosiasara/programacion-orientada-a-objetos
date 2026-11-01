function validarFormulario() {
    var usuario = document.getElementById("username").value.trim();
    var password = document.getElementById("password").value.trim();
    var msgError = document.getElementById("msg-error");

    msgError.style.display = "none";
    msgError.innerText = "";

    if (usuario === "" || password === "") {
        msgError.innerText = "⚠️ Por favor, completa todos los campos.";
        msgError.style.display = "block";
        return false;
    }

    if (password.length < 4) {
        msgError.innerText = "⚠️ La contraseña debe tener al menos 4 caracteres.";
        msgError.style.display = "block";
        return false;
    }

    return true;
}