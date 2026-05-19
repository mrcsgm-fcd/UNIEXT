<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrarse - UNIEXT</title>
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="stylesheet" href="css/login.css">
</head>
<body class="login-body">
    <div class="login-container">
        <div class="login-card">
            <h1>🚀 UNIEXT</h1>
            <p class="subtitle">Crear Nueva Cuenta</p>
            
            <form id="registerForm" onsubmit="realizarRegistro(event)">
                <div class="form-group">
                    <label for="nombre">Nombre Completo:</label>
                    <input type="text" id="nombre" name="nombre" placeholder="Juan Pérez" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" placeholder="tu@email.com" required>
                </div>
                <div class="form-group">
                    <label for="password">Contraseña:</label>
                    <input type="password" id="password" name="password" placeholder="Mínimo 6 caracteres" required>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Confirmar Contraseña:</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Repite tu contraseña" required>
                </div>
                <button type="submit" class="btn btn-success btn-block">Crear Cuenta</button>
            </form>
            
            <div id="registerResponse" class="response-container"></div>
            
            <p class="register-link">
                ¿Ya tienes cuenta? <a href="login.jsp">Inicia sesión aquí</a>
            </p>
        </div>
    </div>
    
    <script src="js/app.js"></script>
    <script src="js/login.js"></script>
</body>
</html>
