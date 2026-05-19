-- Script de inicialización de base de datos para UNIEXT
-- Base de datos MySQL o PostgreSQL

-- Crear base de datos (comentar si ya existe)
-- CREATE DATABASE IF NOT EXISTS uniext;
-- USE uniext;

-- Tabla de usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    estado BOOLEAN DEFAULT TRUE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla de roles
CREATE TABLE IF NOT EXISTS roles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) UNIQUE NOT NULL,
    descripcion VARCHAR(255),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de permisos
CREATE TABLE IF NOT EXISTS permisos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    descripcion VARCHAR(255),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de relación usuario-rol
CREATE TABLE IF NOT EXISTS usuario_rol (
    usuario_id INT NOT NULL,
    rol_id INT NOT NULL,
    PRIMARY KEY (usuario_id, rol_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (rol_id) REFERENCES roles(id) ON DELETE CASCADE
);

-- Tabla de relación rol-permiso
CREATE TABLE IF NOT EXISTS rol_permiso (
    rol_id INT NOT NULL,
    permiso_id INT NOT NULL,
    PRIMARY KEY (rol_id, permiso_id),
    FOREIGN KEY (rol_id) REFERENCES roles(id) ON DELETE CASCADE,
    FOREIGN KEY (permiso_id) REFERENCES permisos(id) ON DELETE CASCADE
);

-- Inserts de datos iniciales

-- Roles
INSERT INTO roles (nombre, descripcion) VALUES 
('ADMIN', 'Administrador del sistema'),
('USER', 'Usuario estándar'),
('GUEST', 'Invitado');

-- Permisos
INSERT INTO permisos (nombre, descripcion) VALUES 
('VIEW_DASHBOARD', 'Ver panel de control'),
('MANAGE_USERS', 'Gestionar usuarios'),
('MANAGE_ROLES', 'Gestionar roles'),
('DELETE_DATA', 'Eliminar datos'),
('EXPORT_DATA', 'Exportar datos');

-- Usuario administrador (contraseña: admin123)
INSERT INTO usuarios (nombre, email, password, estado) VALUES 
('Administrador', 'admin@uniext.com', 'admin123', TRUE);

-- Asignar rol ADMIN al administrador
INSERT INTO usuario_rol (usuario_id, rol_id) VALUES (1, 1);

-- Asignar todos los permisos al rol ADMIN
INSERT INTO rol_permiso (rol_id, permiso_id) VALUES 
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5);

-- Asignar permisos básicos al rol USER
INSERT INTO rol_permiso (rol_id, permiso_id) VALUES 
(2, 1), (2, 5);

-- Crear índices para mejorar rendimiento
CREATE INDEX idx_usuarios_email ON usuarios(email);
CREATE INDEX idx_usuarios_estado ON usuarios(estado);
