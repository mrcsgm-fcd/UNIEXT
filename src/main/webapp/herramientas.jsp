<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculadora - UNIEXT</title>
    <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>
    <div class="container">
        <header class="header">
            <h1>🧮 Calculadora Avanzada</h1>
            <p>Herramientas de cálculo del sistema</p>
        </header>

        <nav class="navbar">
            <ul>
                <li><a href="index.jsp" class="nav-link">Inicio</a></li>
                <li><a href="dashboard.jsp" class="nav-link">Dashboard</a></li>
                <li><a href="usuarios.jsp" class="nav-link">Usuarios</a></li>
                <li><a href="#" class="nav-link active">Herramientas</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <section class="section">
                <h2>🔍 Verificador de Números Primos</h2>
                <div class="form-row">
                    <div class="form-group">
                        <label for="numeroPrimo">Ingresa un número:</label>
                        <input type="number" id="numeroPrimo" placeholder="Ej: 17">
                    </div>
                    <button onclick="verificarPrimo()" class="btn btn-primary">Verificar</button>
                </div>
                <div id="resultadoPrimo" class="response-container"></div>
            </section>

            <section class="section">
                <h2>🗂 Factorial</h2>
                <div class="form-row">
                    <div class="form-group">
                        <label for="numeroFactorial">Número (0-20):</label>
                        <input type="number" id="numeroFactorial" min="0" max="20" placeholder="Ej: 5">
                    </div>
                    <button onclick="calcularFactorial()" class="btn btn-primary">Calcular</button>
                </div>
                <div id="resultadoFactorial" class="response-container"></div>
            </section>

            <section class="section">
                <h2>📊 Estadísticas</h2>
                <div class="form-group">
                    <label for="numeros">Ingresa números separados por comas:</label>
                    <textarea id="numeros" placeholder="Ej: 10, 20, 30, 40, 50" rows="3"></textarea>
                </div>
                <button onclick="calcularEstadisticas()" class="btn btn-primary">Calcular</button>
                <div id="resultadoStats" class="response-container"></div>
            </section>
        </main>

        <footer class="footer">
            <p>&copy; 2026 UNIEXT - Sistema de Gestión Web | Powered by Tomcat</p>
        </footer>
    </div>

    <script src="js/app.js"></script>
    <script src="js/herramientas.js"></script>
</body>
</html>
