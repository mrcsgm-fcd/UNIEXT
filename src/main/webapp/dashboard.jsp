<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - UNIEXT</title>
    <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>
    <div class="container">
        <header class="header">
            <h1>📊 Dashboard UNIEXT</h1>
            <p>Bienvenido al panel de control</p>
        </header>

        <nav class="navbar">
            <ul>
                <li><a href="index.jsp" class="nav-link">Inicio</a></li>
                <li><a href="#" class="nav-link active">Dashboard</a></li>
                <li><a href="usuarios.jsp" class="nav-link">Usuarios</a></li>
                <li><a href="reportes.jsp" class="nav-link">Reportes</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <!-- Sección de información -->
            <section class="section info-section">
                <h2>Información del Sistema</h2>
                <div id="dashboardInfo" class="info-cards">
                    <div class="loading">Cargando información...</div>
                </div>
            </section>

            <!-- Sección de estadísticas -->
            <section class="section stats-section">
                <h2>Estadísticas</h2>
                <div id="statsContainer" class="stats-grid">
                    <div class="loading">Cargando estadísticas...</div>
                </div>
            </section>

            <!-- Sección de hora actual -->
            <section class="section time-section">
                <h2>Hora del Servidor</h2>
                <div id="currentTime" class="time-display">00:00:00</div>
                <button onclick="actualizarHora()" class="btn btn-primary">Actualizar</button>
            </section>

            <!-- Formulario de ejemplo -->
            <section class="section form-section">
                <h2>Formulario de Prueba</h2>
                <form id="testForm" onsubmit="enviarFormulario(event)">
                    <div class="form-group">
                        <label for="nombre">Nombre:</label>
                        <input type="text" id="nombre" name="nombre" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <button type="submit" class="btn btn-success">Enviar</button>
                    <button type="reset" class="btn btn-secondary">Limpiar</button>
                </form>
                <div id="formResponse" class="response-container"></div>
            </section>
        </main>

        <footer class="footer">
            <p>&copy; 2026 UNIEXT - Sistema de Gestión Web | Powered by Tomcat</p>
        </footer>
    </div>

    <!-- Scripts -->
    <script src="js/app.js"></script>
    <script src="js/dashboard.js"></script>
    <script>
        // Cargar datos al iniciar
        document.addEventListener('DOMContentLoaded', function() {
            cargarInfoDashboard();
            cargarEstadisticas();
            actualizarHora();
            // Actualizar hora cada segundo
            setInterval(actualizarHora, 1000);
        });
    </script>
</body>
</html>
