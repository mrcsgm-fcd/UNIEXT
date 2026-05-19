package com.uniext.controller;

import java.io.*;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;

/**
 * Controlador de autenticación
 */
@WebServlet("/api/auth")
public class AuthController extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private Gson gson = new Gson();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        String action = request.getParameter("action");
        
        if (action == null) {
            action = "login";
        }
        
        switch (action) {
            case "login":
                handleLogin(request, response);
                break;
            case "logout":
                handleLogout(request, response);
                break;
            case "register":
                handleRegister(request, response);
                break;
            default:
                sendError(response, "Acción desconocida");
        }
    }
    
    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            sendError(response, "Email y contraseña son requeridos");
            return;
        }
        
        if (email.equals("admin@uniext.com") && password.equals("admin123")) {
            PrintWriter out = response.getWriter();
            out.println("{");
            out.println("  \"exito\": true,");
            out.println("  \"mensaje\": \"Bienvenido\",");
            out.println("  \"usuario\": {");
            out.println("    \"id\": 1,");
            out.println("    \"nombre\": \"Administrador\",");
            out.println("    \"email\": \"" + email + "\",");
            out.println("    \"rol\": \"ADMIN\"");
            out.println("  },");
            out.println("  \"token\": \"" + generarToken() + "\"");
            out.println("}");
            out.close();
        } else {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            sendError(response, "Email o contraseña incorrectos");
        }
    }
    
    private void handleLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        out.println("{");
        out.println("  \"exito\": true,");
        out.println("  \"mensaje\": \"Sesión cerrada correctamente\"");
        out.println("}");
        out.close();
    }
    
    private void handleRegister(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        if (nombre == null || email == null || password == null || 
            nombre.isEmpty() || email.isEmpty() || password.isEmpty()) {
            sendError(response, "Todos los campos son requeridos");
            return;
        }
        
        PrintWriter out = response.getWriter();
        out.println("{");
        out.println("  \"exito\": true,");
        out.println("  \"mensaje\": \"Usuario registrado correctamente\",");
        out.println("  \"usuario\": {");
        out.println("    \"id\": 999,");
        out.println("    \"nombre\": \"" + nombre + "\",");
        out.println("    \"email\": \"" + email + "\",");
        out.println("    \"estado\": \"activo\"");
        out.println("  }");
        out.println("}");
        out.close();
    }
    
    private void sendError(HttpServletResponse response, String message) throws IOException {
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        PrintWriter out = response.getWriter();
        out.println("{ \"exito\": false, \"error\": \"" + message + "\" }");
        out.close();
    }
    
    private String generarToken() {
        return "token_" + System.currentTimeMillis() + "_" + 
               Integer.toHexString((int)(Math.random() * 0xFFFFFF));
    }
}
