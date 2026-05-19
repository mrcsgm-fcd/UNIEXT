/**
 * usuarios.js - Funciones para gestión de usuarios
 * Carga, muestra y gestiona usuarios
 */

/**
 * Carga la lista de usuarios
 */
function cargarUsuarios() {
    const url = CONFIG.API_BASE_URL + '/usuarios';
    
    fetchData(url)
        .then(usuarios => {
            mostrarTablaUsuarios(usuarios);
        })
        .catch(error => {
            console.error('Error cargando usuarios:', error);
            document.getElementById('usersTableContainer').innerHTML = 
                '<div class="error">Error al cargar usuarios</div>';
        });
}

/**
 * Muestra la tabla de usuarios
 */
function mostrarTablaUsuarios(usuarios) {
    const container = document.getElementById('usersTableContainer');
    
    if (!usuarios || usuarios.length === 0) {
        container.innerHTML = '<p>No hay usuarios registrados</p>';
        return;
    }
    
    let html = `
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Email</th>
                    <th>Rol</th>
                    <th>Estado</th>
                    <th>Fecha Creación</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
    `;
    
    usuarios.forEach(usuario => {
        const estado = usuario.estado === 'activo' ? 
            '<span style="color: green;">✓ Activo</span>' : 
            '<span style="color: red;">✗ Inactivo</span>';
        
        html += `
            <tr>
                <td>${usuario.id}</td>
                <td>${escaparHTML(usuario.nombre)}</td>
                <td>${escaparHTML(usuario.email)}</td>
                <td>${escaparHTML(usuario.rol)}</td>
                <td>${estado}</td>
                <td>${formatearFecha(usuario.fechaCreacion)}</td>
                <td>
                    <button class="btn btn-sm" onclick="editarUsuario(${usuario.id})">Editar</button>
                    <button class="btn btn-sm" onclick="eliminarUsuario(${usuario.id})">Eliminar</button>
                </td>
            </tr>
        `;
    });
    
    html += `
            </tbody>
        </table>
    `;
    
    container.innerHTML = html;
}

/**
 * Muestra el modal para agregar usuario
 */
function mostrarFormularioAgregarUsuario() {
    document.getElementById('modalAgregarUsuario').style.display = 'flex';
    document.getElementById('formAgregarUsuario').reset();
}

/**
 * Cierra el modal
 */
function cerrarModal() {
    document.getElementById('modalAgregarUsuario').style.display = 'none';
}

/**
 * Agrega un nuevo usuario
 */
function agregarUsuario(event) {
    event.preventDefault();
    
    const nombre = document.getElementById('nuevoNombre').value;
    const email = document.getElementById('nuevoEmail').value;
    
    const url = CONFIG.API_BASE_URL + '/usuarios';
    const params = new URLSearchParams({
        nombre: nombre,
        email: email
    });
    
    const options = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: params
    };
    
    fetchData(url, options)
        .then(data => {
            if (data.exito) {
                mostrarExito('Usuario creado correctamente');
                cerrarModal();
                cargarUsuarios();
            } else {
                mostrarError(data.error || 'Error al crear usuario');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            mostrarError('Error al crear usuario');
        });
}

/**
 * Edita un usuario
 */
function editarUsuario(id) {
    const url = CONFIG.API_BASE_URL + '/usuarios?id=' + id;
    
    fetchData(url)
        .then(usuario => {
            // Aquí iría la lógica para editar
            mostrarExito('Funcionalidad de edición en desarrollo');
        })
        .catch(error => {
            mostrarError('Error al cargar usuario');
        });
}

/**
 * Elimina un usuario
 */
function eliminarUsuario(id) {
    if (confirm('¿Estás seguro de que deseas eliminar este usuario?')) {
        // Aquí iría la lógica para eliminar
        mostrarExito('Usuario eliminado correctamente');
        cargarUsuarios();
    }
}

// Cerrar modal al hacer clic fuera
window.onclick = function(event) {
    const modal = document.getElementById('modalAgregarUsuario');
    if (event.target === modal) {
        cerrarModal();
    }
}
