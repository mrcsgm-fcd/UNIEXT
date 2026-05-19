package com.uniext.controller;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Controlador para gestionar usuarios
 */
@WebServlet("/api/usuarios")
public class UsuarioController extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        String id = request.getParameter("id");
        
        if (id != null) {
            getUsuarioById(response, Integer.parseInt(id));
        } else {
            getAllUsuarios(response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        
        if (nombre != null && email != null && !nombre.isEmpty() && !email.isEmpty()) {
            PrintWriter out = response.getWriter();
            out.println("{");
            out.println("  \"exito\": true,");
            out.println("  \"mensaje\": \"Usuario creado exitosamente\",");
            out.println("  \"usuario\": {");
            out.println("    \"id\": 999,");
            out.println("    \"nombre\": \"" + nombre + "\",");
            out.println("    \"email\": \"" + email + "\",");
            out.println("    \"estado\": \"activo\"");
            out.println("  }");
            out.println("}");
            out.close();
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            PrintWriter out = response.getWriter();
            out.println("{ \"error\": \"Campos requeridos: nombre, email\" }");
            out.close();
        }
    }
    
    private void getAllUsuarios(HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        out.println("[");
        out.println("  {");
        out.println("    \"id\": 1,");
        out.println("    \"nombre\": \"Administrador\",");
        out.println("    \"email\": \"admin@uniext.com\",");
        out.println("    \"rol\": \"ADMIN\",");
        out.println("    \"estado\": \"activo\",");
        out.println("    \"fechaCreacion\": \"2026-01-15T10:30:00\"");
        out.println("  },");
        out.println("  {");
        out.println("    \"id\": 2,");
        out.println("    \"nombre\": \"Juan Perez\",");
        out.println("    \"email\": \"juan@example.com\",");
        out.println("    \"rol\": \"USER\",");
        out.println("    \"estado\": \"activo\",");
        out.println("    \"fechaCreacion\": \"2026-02-20T14:45:00\"");
        out.println("  },");
        out.println("  {");
        out.println("    \"id\": 3,");
        out.println("    \"nombre\": \"Maria Garcia\",");
        out.println("    \"email\": \"maria@example.com\",");
        out.println("    \"rol\": \"USER\",");
        out.println("    \"estado\": \"activo\",");
        out.println("    \"fechaCreacion\": \"2026-03-10T09:15:00\"");
        out.println("  }");
        out.println("]");
        out.close();
    }
    
    private void getUsuarioById(HttpServletResponse response, int id) throws IOException {
        PrintWriter out = response.getWriter();
        
        if (id == 1) {
            out.println("{");
            out.println("  \"id\": 1,");
            out.println("  \"nombre\": \"Administrador\",");
            out.println("  \"email\": \"admin@uniext.com\",");
            out.println("  \"rol\": \"ADMIN\",");
            out.println("  \"estado\": \"activo\",");
            out.println("  \"fechaCreacion\": \"2026-01-15T10:30:00\",");
            out.println("  \"ultimoAcceso\": \"" + System.currentTimeMillis() + "\"");
            out.println("}");
        } else {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            out.println("{ \"error\": \"Usuario no encontrado\" }");
        }
        out.close();
    }
}
