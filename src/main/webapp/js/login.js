/**
 * login.js - Funciones de autenticación
 */

function realizarLogin(event) {
    event.preventDefault();
    
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;
    
    const url = CONFIG.API_BASE_URL + '/auth';
    const params = new URLSearchParams({
        action: 'login',
        email: email,
        password: password
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
                localStorage.setItem('token', data.token);
                localStorage.setItem('usuario', JSON.stringify(data.usuario));
                
                mostrarExito('Bienvenido ' + data.usuario.nombre);
                
                setTimeout(() => {
                    window.location.href = 'dashboard.jsp';
                }, 1500);
            } else {
                mostrarError(data.error, document.getElementById('loginResponse'));
            }
        })
        .catch(error => {
            mostrarError('Error al iniciar sesión', document.getElementById('loginResponse'));
        });
}

function realizarRegistro(event) {
    event.preventDefault();
    
    const nombre = document.getElementById('nombre').value;
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirmPassword').value;
    
    if (password !== confirmPassword) {
        mostrarError('Las contraseñas no coinciden', document.getElementById('registerResponse'));
        return;
    }
    
    if (password.length < 6) {
        mostrarError('La contraseña debe tener al menos 6 caracteres', document.getElementById('registerResponse'));
        return;
    }
    
    const url = CONFIG.API_BASE_URL + '/auth';
    const params = new URLSearchParams({
        action: 'register',
        nombre: nombre,
        email: email,
        password: password
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
                mostrarExito('Cuenta creada correctamente. Redirigiendo...');
                setTimeout(() => {
                    window.location.href = 'login.jsp';
                }, 2000);
            } else {
                mostrarError(data.error, document.getElementById('registerResponse'));
            }
        })
        .catch(error => {
            mostrarError('Error al registrar usuario', document.getElementById('registerResponse'));
        });
}

function cerrarSesion() {
    localStorage.removeItem('token');
    localStorage.removeItem('usuario');
    mostrarExito('Sesión cerrada');
    setTimeout(() => {
        window.location.href = 'login.jsp';
    }, 1000);
}
