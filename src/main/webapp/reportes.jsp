<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reportes - UNIEXT</title>
    <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>
    <div class="container">
        <header class="header">
            <h1>📈 Reportes</h1>
            <p>Consulta los reportes del sistema</p>
        </header>

        <nav class="navbar">
            <ul>
                <li><a href="index.jsp" class="nav-link">Inicio</a></li>
                <li><a href="dashboard.jsp" class="nav-link">Dashboard</a></li>
                <li><a href="usuarios.jsp" class="nav-link">Usuarios</a></li>
                <li><a href="#" class="nav-link active">Reportes</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <section class="section">
                <h2>Reportes Disponibles</h2>
                <div class="reports-grid">
                    <div class="report-card" onclick="abrirReporte('usuarios')">
                        <h3>👥 Reporte de Usuarios</h3>
                        <p>Análisis de usuarios activos y registros</p>
                        <span class="btn btn-sm">Ver Reporte</span>
                    </div>
                    <div class="report-card" onclick="abrirReporte('transacciones')">
                        <h3>💳 Reporte de Transacciones</h3>
                        <p>Historial de transacciones y movimientos</p>
                        <span class="btn btn-sm">Ver Reporte</span>
                    </div>
                    <div class="report-card" onclick="abrirReporte('rendimiento')">
                        <h3>⚡ Reporte de Rendimiento</h3>
                        <p>Métricas de performance y disponibilidad</p>
                        <span class="btn btn-sm">Ver Reporte</span>
                    </div>
                    <div class="report-card" onclick="abrirReporte('seguridad')">
                        <h3>🔒 Reporte de Seguridad</h3>
                        <p>Logs de seguridad y accesos</p>
                        <span class="btn btn-sm">Ver Reporte</span>
                    </div>
                </div>
            </section>

            <section class="section">
                <h2>Generar Nuevo Reporte</h2>
                <form id="formReporte" onsubmit="generarReporte(event)">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="tipoReporte">Tipo de Reporte:</label>
                            <select id="tipoReporte" name="tipo" required>
                                <option value="">-- Seleccionar --</option>
                                <option value="usuarios">Usuarios</option>
                                <option value="transacciones">Transacciones</option>
                                <option value="rendimiento">Rendimiento</option>
                                <option value="seguridad">Seguridad</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="fechaInicio">Fecha Inicio:</label>
                            <input type="date" id="fechaInicio" name="fechaInicio" required>
                        </div>
                        <div class="form-group">
                            <label for="fechaFin">Fecha Fin:</label>
                            <input type="date" id="fechaFin" name="fechaFin" required>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Generar Reporte</button>
                </form>
                <div id="reporteResponse" class="response-container"></div>
            </section>
        </main>

        <footer class="footer">
            <p>&copy; 2026 UNIEXT - Sistema de Gestión Web | Powered by Tomcat</p>
        </footer>
    </div>

    <!-- Scripts -->
    <script src="js/app.js"></script>
    <script src="js/reportes.js"></script>
</body>
</html>
