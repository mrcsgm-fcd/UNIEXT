package com.uniext.service;

import java.util.HashMap;
import java.util.Map;

/**
 * Servicio de operaciones matemáticas
 */
public class CalculoService {
    
    /**
     * Calcula estadísticas básicas
     */
    public static Map<String, Object> calcularEstadisticas(int[] numeros) {
        Map<String, Object> stats = new HashMap<>();
        
        if (numeros == null || numeros.length == 0) {
            stats.put("error", "Array vacío");
            return stats;
        }
        
        double suma = 0;
        int minimo = numeros[0];
        int maximo = numeros[0];
        
        for (int num : numeros) {
            suma += num;
            if (num < minimo) minimo = num;
            if (num > maximo) maximo = num;
        }
        
        double promedio = suma / numeros.length;
        
        stats.put("suma", suma);
        stats.put("promedio", promedio);
        stats.put("minimo", minimo);
        stats.put("maximo", maximo);
        stats.put("cantidad", numeros.length);
        
        return stats;
    }
    
    /**
     * Calcula factorial
     */
    public static long factorial(int n) {
        if (n < 0) return -1;
        if (n == 0 || n == 1) return 1;
        
        long resultado = 1;
        for (int i = 2; i <= n; i++) {
            resultado *= i;
        }
        return resultado;
    }
    
    /**
     * Verifica si un número es primo
     */
    public static boolean esPrimo(int n) {
        if (n <= 1) return false;
        if (n <= 3) return true;
        if (n % 2 == 0 || n % 3 == 0) return false;
        
        for (int i = 5; i * i <= n; i += 6) {
            if (n % i == 0 || n % (i + 2) == 0) return false;
        }
        return true;
    }
}
