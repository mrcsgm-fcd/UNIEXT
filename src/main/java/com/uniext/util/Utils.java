package com.uniext.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Clase para utilidades generales
 */
public class Utils {
    
    /**
     * Genera un ID único
     */
    public static String generarID() {
        return "ID_" + System.currentTimeMillis() + "_" + 
               (int)(Math.random() * 10000);
    }
    
    /**
     * Formatea una fecha
     */
    public static String formatearFecha(Date fecha) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        return sdf.format(fecha);
    }
    
    /**
     * Valida email
     */
    public static boolean validarEmail(String email) {
        return email != null && email.matches("^[A-Za-z0-9+_.-]+@(.+)$");
    }
    
    /**
     * Valida contraseña
     */
    public static boolean validarPassword(String password) {
        return password != null && password.length() >= 6;
    }
    
    /**
     * Escapa caracteres HTML
     */
    public static String escaparHTML(String texto) {
        if (texto == null) return "";
        return texto.replace("&", "&amp;")
                   .replace("<", "&lt;")
                   .replace(">", "&gt;")
                   .replace("\"", "&quot;")
                   .replace("'", "&#39;");
    }
}
