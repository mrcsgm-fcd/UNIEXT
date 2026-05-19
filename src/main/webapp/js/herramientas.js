/**
 * herramientas.js - Funciones para herramientas de cálculo
 */

function verificarPrimo() {
    const numero = parseInt(document.getElementById('numeroPrimo').value);
    
    if (isNaN(numero) || numero < 0) {
        mostrarError('Ingresa un número válido');
        return;
    }
    
    const esPrimo = verificarNumeroPrimo(numero);
    const resultado = document.getElementById('resultadoPrimo');
    
    const html = `
        <strong>Resultado:</strong><br>
        El número ${numero} ${esPrimo ? '<span style="color: green;">SÍ ES</span>' : '<span style="color: red;">NO ES</span>'} primo.
    `;
    
    resultado.innerHTML = html;
    resultado.classList.add('success');
}

function verificarNumeroPrimo(n) {
    if (n <= 1) return false;
    if (n <= 3) return true;
    if (n % 2 === 0 || n % 3 === 0) return false;
    
    for (let i = 5; i * i <= n; i += 6) {
        if (n % i === 0 || n % (i + 2) === 0) return false;
    }
    return true;
}

function calcularFactorial() {
    const numero = parseInt(document.getElementById('numeroFactorial').value);
    
    if (isNaN(numero) || numero < 0 || numero > 20) {
        mostrarError('Ingresa un número entre 0 y 20');
        return;
    }
    
    const resultado = calcularFactorialRecursivo(numero);
    const resultadoDiv = document.getElementById('resultadoFactorial');
    
    const html = `
        <strong>Resultado:</strong><br>
        ${numero}! = ${resultado.toLocaleString('es-ES')}
    `;
    
    resultadoDiv.innerHTML = html;
    resultadoDiv.classList.add('success');
}

function calcularFactorialRecursivo(n) {
    if (n === 0 || n === 1) return 1;
    return n * calcularFactorialRecursivo(n - 1);
}

function calcularEstadisticas() {
    const input = document.getElementById('numeros').value;
    const numerosStr = input.split(',').map(n => n.trim());
    const numeros = numerosStr.map(n => parseFloat(n)).filter(n => !isNaN(n));
    
    if (numeros.length === 0) {
        mostrarError('Ingresa números válidos separados por comas');
        return;
    }
    
    const suma = numeros.reduce((a, b) => a + b, 0);
    const promedio = suma / numeros.length;
    const minimo = Math.min(...numeros);
    const maximo = Math.max(...numeros);
    
    const varianza = numeros.reduce((a, b) => a + Math.pow(b - promedio, 2), 0) / numeros.length;
    const desviacionEstandar = Math.sqrt(varianza);
    
    const resultadoDiv = document.getElementById('resultadoStats');
    
    const html = `
        <strong>Estadísticas:</strong><br>
        Cantidad: ${numeros.length}<br>
        Suma: ${suma.toFixed(2)}<br>
        Promedio: ${promedio.toFixed(2)}<br>
        Mínimo: ${minimo.toFixed(2)}<br>
        Máximo: ${maximo.toFixed(2)}<br>
        Desviación Estándar: ${desviacionEstandar.toFixed(2)}
    `;
    
    resultadoDiv.innerHTML = html;
    resultadoDiv.classList.add('success');
}
