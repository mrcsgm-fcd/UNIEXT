/**
 * dashboard.js - Funciones del Dashboard
 * Carga y muestra información del sistema
 */

/**
 * Carga la información del dashboard
 */
function cargarInfoDashboard() {
    const url = CONFIG.API_BASE_URL + '/dashboard?action=info';
    
    fetchData(url)
        .then(data => {
            mostrarInfoDashboard(data);
        })
        .catch(error => {
            console.error('Error cargando dashboard:', error);
            document.getElementById('dashboardInfo').innerHTML = 
                '<div class="error">Error al cargar la información</div>';
        });
}

/**
 * Muestra la información del dashboard en el DOM
 */
function mostrarInfoDashboard(data) {
    const container = document.getElementById('dashboardInfo');
    
    let html = `
        <div class="info-card">
            <h3>Aplicación</h3>
            <div class="value">${escaparHTML(data.titulo)}</div>
            <p>${escaparHTML(data.descripcion)}</p>
        </div>
        <div class="info-card">
            <h3>Versión</h3>
            <div class="value">${escaparHTML(data.version)}</div>
            <p>Última actualización</p>
        </div>
        <div class="info-card">
            <h3>Estado</h3>
            <div class="value" style="color: #4CAF50;">${escaparHTML(data.estado)}</div>
            <p>Sistema operativo</p>
        </div>
    `;
    
    if (data.modulos && Array.isArray(data.modulos)) {
        html += '<div class="info-card" style="grid-column: span 1;"><h3>Módulos</h3>';
        data.modulos.forEach(modulo => {
            html += `<p>• <a href="${escaparHTML(modulo.ruta)}">${escaparHTML(modulo.nombre)}</a></p>`;
        });
        html += '</div>';
    }
    
    container.innerHTML = html;
}

/**
 * Carga las estadísticas del sistema
 */
function cargarEstadisticas() {
    const url = CONFIG.API_BASE_URL + '/dashboard?action=stats';
    
    fetchData(url)
        .then(data => {
            mostrarEstadisticas(data);
        })
        .catch(error => {
            console.error('Error cargando estadísticas:', error);
        });
}

/**
 * Muestra las estadísticas en el DOM
 */
function mostrarEstadisticas(data) {
    const container = document.getElementById('statsContainer');
    
    const html = `
        <div class="stat-item">
            <div class="label">Usuarios Activos</div>
            <div class="value">${data.usuariosActivos}</div>
        </div>
        <div class="stat-item">
            <div class="label">Transacciones Hoy</div>
            <div class="value">${data.transaccionesHoy}</div>
        </div>
        <div class="stat-item">
            <div class="label">Tasa de Éxito</div>
            <div class="value">${data.tasaExito}%</div>
        </div>
        <div class="stat-item">
            <div class="label">Tiempo Promedio</div>
            <div class="value">${escaparHTML(data.tiempoPromedio)}</div>
        </div>
    `;
    
    container.innerHTML = html;
}

/**
 * Actualiza la hora actual del servidor
 */
function actualizarHora() {
    const url = CONFIG.API_BASE_URL + '/dashboard?action=time';
    
    fetchData(url)
        .then(data => {
            const fecha = new Date(parseInt(data.timestamp));
            const horas = String(fecha.getHours()).padStart(2, '0');
            const minutos = String(fecha.getMinutes()).padStart(2, '0');
            const segundos = String(fecha.getSeconds()).padStart(2, '0');
            
            const timeDisplay = document.getElementById('currentTime');
            if (timeDisplay) {
                timeDisplay.textContent = `${horas}:${minutos}:${segundos}`;
            }
        })
        .catch(error => {
            console.error('Error actualizando hora:', error);
        });
}
