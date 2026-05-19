package com.uniext.controller;

import java.io.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Controlador principal para el dashboard
 * Maneja las solicitudes del navegador y devuelve respuestas
 */
@WebServlet("/api/dashboard")
public class DashboardController extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        String action = request.getParameter("action");
        
        if (action == null) {
            action = "info";
        }
        
        switch (action) {
            case "info":
                sendDashboardInfo(response);
                break;
            case "stats":
                sendStatistics(response);
                break;
            case "time":
                sendCurrentTime(response);
                break;
            default:
                sendError(response, "Acción desconocida");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        
        if (name != null && email != null && !name.isEmpty() && !email.isEmpty()) {
            sendSuccess(response, "Usuario " + name + " registrado correctamente");
        } else {
            sendError(response, "Nombre y email son requeridos");
        }
    }
    
    private void sendDashboardInfo(HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        out.println("{");
        out.println("  \"titulo\": \"UNIEXT Dashboard\",");
        out.println("  \"descripcion\": \"Panel de control de la aplicación UNIEXT\",");
        out.println("  \"version\": \"1.0.0\",");
        out.println("  \"desarrollador\": \"Equipo UNIEXT\",");
        out.println("  \"estado\": \"activo\",");
        out.println("  \"modulos\": [");
        out.println("    {\"nombre\": \"Usuarios\", \"ruta\": \"/usuarios\"},");
        out.println("    {\"nombre\": \"Reportes\", \"ruta\": \"/reportes\"},");
        out.println("    {\"nombre\": \"Configuración\", \"ruta\": \"/configuracion\"}");
        out.println("  ]");
        out.println("}");
        out.close();
    }
    
    private void sendStatistics(HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        out.println("{");
        out.println("  \"usuariosActivos\": 152,");
        out.println("  \"transaccionesHoy\": 45,");
        out.println("  \"tasaExito\": 98.5,");
        out.println("  \"tiempoPromedio\": \"245ms\",");
        out.println("  \"ultimaActualizacion\": \"" + LocalDateTime.now().format(DateTimeFormatter.ISO_DATE_TIME) + "\"\n");
        out.println("}");
        out.close();
    }
    
    private void sendCurrentTime(HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        out.println("{");
        out.println("  \"timestamp\": " + System.currentTimeMillis() + ",");
        out.println("  \"fecha\": \"" + LocalDateTime.now().format(DateTimeFormatter.ISO_DATE_TIME) + "\"");
        out.println("}");
        out.close();
    }
    
    private void sendSuccess(HttpServletResponse response, String message) throws IOException {
        PrintWriter out = response.getWriter();
        out.println("{");
        out.println("  \"exito\": true,");
        out.println("  \"mensaje\": \"" + message + "\"");
        out.println("}");
        out.close();
    }
    
    private void sendError(HttpServletResponse response, String message) throws IOException {
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        PrintWriter out = response.getWriter();
        out.println("{");
        out.println("  \"exito\": false,");
        out.println("  \"error\": \"" + message + "\"");
        out.println("}");
        out.close();
    }
}
