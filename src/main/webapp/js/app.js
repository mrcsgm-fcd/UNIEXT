/**
 * app.js - Funciones generales de la aplicación
 * Proporciona utilidades y funciones comunes para todos los módulos
 */

// Configuración general
const CONFIG = {
    API_BASE_URL: '/uniext/api',
    TIMEOUT: 5000
};

/**
 * Realiza una petición AJAX (Fetch API)
 * @param {string} url - URL del endpoint
 * @param {object} options - Opciones adicionales
 * @returns {Promise} Promesa con la respuesta
 */
async function fetchData(url, options = {}) {
    const defaultOptions = {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
    };

    const finalOptions = { ...defaultOptions, ...options };

    try {
        const response = await fetch(url, finalOptions);
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        return await response.json();
    } catch (error) {
        console.error('Error en fetchData:', error);
        mostrarError('Error en la solicitud: ' + error.message);
        throw error;
    }
}

/**
 * Realiza una petición POST con parámetros del formulario
 * @param {string} url - URL del endpoint
 * @param {FormData} formData - Datos del formulario
 * @returns {Promise} Promesa con la respuesta
 */
async function enviarFormulario(event) {
    event.preventDefault();
    const form = event.target;
    const formData = new FormData(form);

    const url = form.action || CONFIG.API_BASE_URL + '/dashboard';
    const method = form.method || 'POST';

    const params = new URLSearchParams(formData);
    const fullUrl = method === 'GET' ? `${url}?${params}` : url;

    const options = {
        method: method,
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        }
    };

    if (method === 'POST') {
        options.body = params;
    }

    try {
        const response = await fetch(fullUrl, options);
        const data = await response.json();

        const responseContainer = document.getElementById('formResponse');
        if (data.exito) {
            mostrarExito(data.mensaje, responseContainer);
            form.reset();
        } else {
            mostrarError(data.error || 'Error desconocido', responseContainer);
        }
    } catch (error) {
        console.error('Error:', error);
        mostrarError('Error al enviar el formulario', document.getElementById('formResponse'));
    }
}

/**
 * Muestra un mensaje de éxito
 * @param {string} mensaje - Texto del mensaje
 * @param {HTMLElement} container - Elemento donde mostrar el mensaje
 */
function mostrarExito(mensaje, container = null) {
    const html = `<div class="alert alert-success">✓ ${mensaje}</div>`;
    if (container) {
        container.innerHTML = html;
        container.classList.add('success');
        container.classList.remove('error');
    } else {
        alert(mensaje);
    }
}

/**
 * Muestra un mensaje de error
 * @param {string} mensaje - Texto del error
 * @param {HTMLElement} container - Elemento donde mostrar el error
 */
function mostrarError(mensaje, container = null) {
    const html = `<div class="alert alert-error">✗ ${mensaje}</div>`;
    if (container) {
        container.innerHTML = html;
        container.classList.add('error');
        container.classList.remove('success');
    } else {
        console.error(mensaje);
    }
}

/**
 * Formatea una fecha al formato locale
 * @param {string|Date} fecha - Fecha a formatear
 * @returns {string} Fecha formateada
 */
function formatearFecha(fecha) {
    if (typeof fecha === 'string') {
        fecha = new Date(fecha);
    }
    return fecha.toLocaleDateString('es-ES', {
        year: 'numeric',
        month: 'long',
        day: 'numeric',
        hour: '2-digit',
        minute: '2-digit'
    });
}

/**
 * Formatea un número a moneda
 * @param {number} numero - Número a formatear
 * @returns {string} Número formateado
 */
function formatearMoneda(numero) {
    return new Intl.NumberFormat('es-ES', {
        style: 'currency',
        currency: 'EUR'
    }).format(numero);
}

/**
 * Escape HTML para evitar XSS
 * @param {string} texto - Texto a escapar
 * @returns {string} Texto escapado
 */
function escaparHTML(texto) {
    const div = document.createElement('div');
    div.textContent = texto;
    return div.innerHTML;
}

/**
 * Oculta/Muestra un elemento
 * @param {string} elementId - ID del elemento
 * @param {boolean} mostrar - true para mostrar, false para ocultar
 */
function alternarVisibilidad(elementId, mostrar) {
    const elemento = document.getElementById(elementId);
    if (elemento) {
        elemento.style.display = mostrar ? 'block' : 'none';
    }
}

/**
 * Debounce - evita múltiples ejecuciones rápidas
 * @param {Function} func - Función a ejecutar
 * @param {number} espera - Milisegundos a esperar
 * @returns {Function} Función con debounce
 */
function debounce(func, espera) {
    let timeoutId;
    return function(...args) {
        clearTimeout(timeoutId);
        timeoutId = setTimeout(() => func.apply(this, args), espera);
    };
}

/**
 * Throttle - ejecuta función con intervalo mínimo
 * @param {Function} func - Función a ejecutar
 * @param {number} intervalo - Milisegundos mínimo entre ejecuciones
 * @returns {Function} Función con throttle
 */
function throttle(func, intervalo) {
    let ultimaEjecucion = 0;
    return function(...args) {
        const ahora = Date.now();
        if (ahora - ultimaEjecucion >= intervalo) {
            func.apply(this, args);
            ultimaEjecucion = ahora;
        }
    };
}

/**
 * Copia texto al portapapeles
 * @param {string} texto - Texto a copiar
 */
function copiarAlPortapapeles(texto) {
    navigator.clipboard.writeText(texto).then(() => {
        mostrarExito('Copiado al portapapeles');
    }).catch(() => {
        mostrarError('No se pudo copiar');
    });
}

/**
 * Genera un ID único
 * @returns {string} ID único
 */
function generarID() {
    return 'id_' + Date.now() + '_' + Math.random().toString(36).substr(2, 9);
}

// Log en consola con timestamp
console.log('%c UNIEXT - Sistema Iniciado', 'font-size: 14px; font-weight: bold; color: #667eea;');
