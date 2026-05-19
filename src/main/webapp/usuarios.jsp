<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuarios - UNIEXT</title>
    <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>
    <div class="container">
        <header class="header">
            <h1>👥 Gestión de Usuarios</h1>
            <p>Administra los usuarios del sistema</p>
        </header>

        <nav class="navbar">
            <ul>
                <li><a href="index.jsp" class="nav-link">Inicio</a></li>
                <li><a href="dashboard.jsp" class="nav-link">Dashboard</a></li>
                <li><a href="#" class="nav-link active">Usuarios</a></li>
                <li><a href="reportes.jsp" class="nav-link">Reportes</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <!-- Botón para agregar usuario -->
            <div class="action-bar">
                <button onclick="mostrarFormularioAgregarUsuario()" class="btn btn-success">+ Agregar Usuario</button>
            </div>

            <!-- Tabla de usuarios -->
            <section class="section">
                <h2>Listado de Usuarios</h2>
                <div id="usersTableContainer" class="table-container">
                    <div class="loading">Cargando usuarios...</div>
                </div>
            </section>

            <!-- Modal para agregar usuario -->
            <div id="modalAgregarUsuario" class="modal" style="display: none;">
                <div class="modal-content">
                    <span class="close" onclick="cerrarModal()">&times;</span>
                    <h2>Agregar Nuevo Usuario</h2>
                    <form id="formAgregarUsuario" onsubmit="agregarUsuario(event)">
                        <div class="form-group">
                            <label for="nuevoNombre">Nombre:</label>
                            <input type="text" id="nuevoNombre" name="nombre" required>
                        </div>
                        <div class="form-group">
                            <label for="nuevoEmail">Email:</label>
                            <input type="email" id="nuevoEmail" name="email" required>
                        </div>
                        <button type="submit" class="btn btn-success">Crear Usuario</button>
                        <button type="button" class="btn btn-secondary" onclick="cerrarModal()">Cancelar</button>
                    </form>
                </div>
            </div>
        </main>

        <footer class="footer">
            <p>&copy; 2026 UNIEXT - Sistema de Gestión Web | Powered by Tomcat</p>
        </footer>
    </div>

    <!-- Scripts -->
    <script src="js/app.js"></script>
    <script src="js/usuarios.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            cargarUsuarios();
        });
    </script>
</body>
</html>
