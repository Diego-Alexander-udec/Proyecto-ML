# Sistema de Login con Python y Flask

Este proyecto implementa un sistema de autenticación de usuarios utilizando Flask, MySQL y Bootstrap.

## 🚀 Características

- Sistema de autenticación completo (login/registro)
- Encriptación de contraseñas con Bcrypt
- Sesiones de usuario
- Protección de rutas
- Interfaz responsive con Bootstrap
- Listo para producción en Render.com

## 📋 Requisitos

- Python 3.8 o superior
- MySQL Server en funcionamiento
- pip instalado

## 🔧 Instalación Local

### 1. Clonar el repositorio
```bash
git clone <tu-repositorio>
cd Login_python
```

### 2. Instalar dependencias
```bash
pip install -r requirements.txt
```

### 3. Configurar variables de entorno
Copia el archivo `.env.example` a `.env` y actualiza los valores:
```bash
cp .env.example .env
```

Edita el archivo `.env` con tus credenciales de MySQL local:
```
SECRET_KEY=tu_clave_secreta_muy_segura
MYSQL_HOST=localhost
MYSQL_USER=root
MYSQL_PASSWORD=
MYSQL_DB=flask_login
MYSQL_PORT=3306
```

### 4. Crear la base de datos
Ejecuta el script SQL en tu servidor MySQL:
```bash
mysql -u root -p < database.sql
```

O manualmente en phpMyAdmin/MySQL:
```sql
CREATE DATABASE IF NOT EXISTS flask_login;
USE flask_login;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### 5. Ejecutar la aplicación
```bash
python app.py
```

La aplicación estará disponible en: `http://localhost:5000`

## 🌐 Despliegue en Render.com

### Paso 1: Preparar el repositorio
Asegúrate de que todos los archivos estén en tu repositorio de GitHub:
- ✅ `requirements.txt` actualizado
- ✅ `.gitignore` configurado
- ✅ `app.py` con variables de entorno

### Paso 2: Crear una base de datos MySQL en Render
1. Ve a [Render Dashboard](https://dashboard.render.com/)
2. Click en "New +" → "MySQL"
3. Configura:
   - **Name**: `flask-login-db` (o el nombre que prefieras)
   - **Database**: `flask_login`
   - **User**: (se genera automáticamente)
   - **Region**: Elige la más cercana
4. Click en "Create Database"
5. **Guarda las credenciales** que aparecen (las necesitarás)

### Paso 3: Ejecutar el script SQL en la base de datos
1. En Render, ve a tu base de datos MySQL
2. Click en "Connect" → "External Connection"
3. Usa un cliente MySQL o la terminal para conectarte y ejecutar:
```sql
USE flask_login;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Paso 4: Crear el Web Service
1. En Render Dashboard, click en "New +" → "Web Service"
2. Conecta tu repositorio de GitHub
3. Configura el servicio:
   - **Name**: `flask-login-app` (o tu preferencia)
   - **Region**: Misma que la base de datos
   - **Branch**: `main`
   - **Root Directory**: `Login_python` (si está en subdirectorio)
   - **Runtime**: `Python 3`
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `gunicorn app:app`

### Paso 5: Configurar Variables de Entorno
En la sección "Environment" del Web Service, añade:

```
SECRET_KEY=genera_una_clave_secreta_muy_segura_aqui
MYSQL_HOST=<tu-mysql-host-de-render>
MYSQL_USER=<tu-mysql-user-de-render>
MYSQL_PASSWORD=<tu-mysql-password-de-render>
MYSQL_DB=flask_login
MYSQL_PORT=3306
```

**Importante**: Copia estos valores desde la página de tu base de datos MySQL en Render.

### Paso 6: Deploy
1. Click en "Create Web Service"
2. Espera a que se complete el despliegue (puede tardar 2-5 minutos)
3. Tu aplicación estará disponible en: `https://tu-app.onrender.com`

## 🔒 Seguridad

- Las contraseñas se almacenan encriptadas con Bcrypt
- Se usan variables de entorno para credenciales sensibles
- Sesiones seguras con Flask
- El archivo `.env` está en `.gitignore` para no exponer credenciales

## 📁 Estructura del Proyecto

```
Login_python/
├── app.py                 # Aplicación principal
├── requirements.txt       # Dependencias
├── database.sql          # Script de base de datos
├── .env                  # Variables de entorno (no subir a Git)
├── .env.example          # Ejemplo de variables de entorno
├── .gitignore            # Archivos ignorados por Git
├── static/
│   ├── css/             # Estilos CSS
│   └── js/              # JavaScript
└── templates/
    ├── login.html       # Página de login
    ├── register.html    # Página de registro
    ├── home.html        # Página principal
    └── ...              # Otras páginas
```

## 🛠️ Tecnologías Utilizadas

- **Flask** 3.0.0 - Framework web
- **Flask-MySQLdb** - Conector MySQL
- **Flask-Bcrypt** - Encriptación de contraseñas
- **Gunicorn** - Servidor WSGI para producción
- **MySQL** - Base de datos
- **Bootstrap** - Framework CSS

## 📝 Comandos Útiles

```bash
# Instalar dependencias
pip install -r requirements.txt

# Ejecutar en modo desarrollo
python app.py

# Ejecutar con Gunicorn (producción)
gunicorn app:app

# Verificar conexión a base de datos
python -c "from app import mysql; print('Conexión exitosa')"
```

## 🐛 Solución de Problemas

### Error: "No module named 'flask'"
```bash
pip install -r requirements.txt
```

### Error de conexión a MySQL
- Verifica que MySQL esté ejecutándose
- Comprueba las credenciales en el archivo `.env`
- Asegúrate de que la base de datos `flask_login` exista

### Error en Render: "Application failed to respond"
- Verifica las variables de entorno en Render
- Revisa los logs en el dashboard de Render
- Asegúrate de que el Start Command sea: `gunicorn app:app`

## 👥 Contribuir

Las contribuciones son bienvenidas. Por favor, abre un issue primero para discutir los cambios que te gustaría hacer.

## 📄 Licencia

Este proyecto es de código abierto y está disponible bajo la licencia MIT.

