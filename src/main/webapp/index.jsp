<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UNIEXT - Inicio</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .container {
            background: white;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            padding: 40px;
            max-width: 600px;
            text-align: center;
        }
        
        h1 {
            color: #333;
            margin-bottom: 10px;
            font-size: 2.5em;
        }
        
        .subtitle {
            color: #666;
            margin-bottom: 30px;
            font-size: 1.1em;
        }
        
        .info-box {
            background: #f8f9fa;
            border-left: 4px solid #667eea;
            padding: 20px;
            margin: 20px 0;
            text-align: left;
            border-radius: 5px;
        }
        
        .info-box p {
            color: #555;
            margin: 8px 0;
        }
        
        .info-box code {
            background: #fff;
            padding: 2px 6px;
            border-radius: 3px;
            color: #d63384;
            font-family: 'Courier New', monospace;
        }
        
        .button-group {
            display: flex;
            gap: 10px;
            justify-content: center;
            margin-top: 30px;
            flex-wrap: wrap;
        }
        
        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
        
        .btn-secondary {
            background: #e9ecef;
            color: #333;
            border: 1px solid #ddd;
        }
        
        .btn-secondary:hover {
            background: #dee2e6;
        }
        
        .status {
            margin-top: 30px;
            padding: 15px;
            background: #d4edda;
            border: 1px solid #c3e6cb;
            border-radius: 5px;
            color: #155724;
        }
        
        .footer {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
            color: #999;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🚀 UNIEXT</h1>
        <p class="subtitle">Plataforma de Aplicaciones Web</p>
        
        <div class="status">
            ✓ Servidor Tomcat funcionando correctamente
        </div>
        
        <div class="info-box">
            <p><strong>Información del Servidor:</strong></p>
            <p>Servidor: <code><%= request.getServerName() %></code></p>
            <p>Puerto: <code><%= request.getServerPort() %></code></p>
            <p>Contexto: <code><%= request.getContextPath() %></code></p>
            <p>Hora del servidor: <code><%= new java.util.Date() %></code></p>
        </div>
        
        <div class="info-box">
            <p><strong>Java y Tomcat:</strong></p>
            <p>Versión Java: <code><%= System.getProperty("java.version") %></code></p>
            <p>SO: <code><%= System.getProperty("os.name") %></code></p>
            <p>Versión SO: <code><%= System.getProperty("os.version") %></code></p>
        </div>
        
        <div class="button-group">
            <button class="btn btn-primary" onclick="location.href='#'">Iniciar Sesión</button>
            <button class="btn btn-secondary" onclick="location.href='#'">Documentación</button>
        </div>
        
        <div class="footer">
            <p>UNIEXT © 2026 - Todos los derechos reservados</p>
        </div>
    </div>
</body>
</html>
