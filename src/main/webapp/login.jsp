<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - UNIEXT</title>
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="stylesheet" href="css/login.css">
</head>
<body class="login-body">
    <div class="login-container">
        <div class="login-card">
            <h1>🚀 UNIEXT</h1>
            <p class="subtitle">Sistema de Gestión Web</p>
            
            <form id="loginForm" onsubmit="realizarLogin(event)">
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" placeholder="admin@uniext.com" required>
                </div>
                <div class="form-group">
                    <label for="password">Contraseña:</label>
                    <input type="password" id="password" name="password" placeholder="admin123" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Iniciar Sesión</button>
            </form>
            
            <div id="loginResponse" class="response-container"></div>
            
            <hr>
            
            <p class="login-info">
                <strong>Credenciales de prueba:</strong><br>
                Email: admin@uniext.com<br>
                Contraseña: admin123
            </p>
            
            <p class="register-link">
                ¿No tienes cuenta? <a href="register.jsp">Regístrate aquí</a>
            </p>
        </div>
    </div>
    
    <script src="js/app.js"></script>
    <script src="js/login.js"></script>
</body>
</html>
