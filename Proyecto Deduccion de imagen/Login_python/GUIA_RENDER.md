# 🚀 Guía Paso a Paso: Despliegue en Render.com

## ✅ Paso 1: Ya Completado - Preparación del Código
- ✓ Código actualizado con variables de entorno
- ✓ requirements.txt con todas las dependencias
- ✓ Cambios subidos a GitHub
- ✓ .gitignore configurado

---

## 📊 Paso 2: Crear Base de Datos MySQL en Render

### 2.1 Acceder a Render Dashboard
1. Ve a: https://dashboard.render.com/
2. Inicia sesión con tu cuenta

### 2.2 Crear nueva base de datos MySQL
1. Haz clic en el botón **"New +"** (esquina superior derecha)
2. Selecciona **"MySQL"**
3. Configura los siguientes campos:

   ```
   Name: flask-login-db
   Database: flask_login
   User: (se genera automáticamente, déjalo como está)
   Region: Oregon (US West) o la más cercana a ti
   MySQL Version: 8.0
   Plan: Free
   ```

4. Haz clic en **"Create Database"**
5. ⏳ Espera 2-3 minutos mientras se crea la base de datos

### 2.3 Guardar las credenciales
Una vez creada la base de datos, verás una pantalla con las credenciales:

```
MYSQL_HOST: dpg-xxxxx-a.oregon-postgres.render.com
MYSQL_USER: flask_login_xxxxx
MYSQL_PASSWORD: xxxxxxxxxxxxxxxxxxxx
MYSQL_DB: flask_login
MYSQL_PORT: 3306
Internal Database URL: mysql://flask_login_xxxxx:password@dpg-.../flask_login
```

**⚠️ IMPORTANTE**: Copia estas credenciales en un archivo temporal. Las necesitarás en el Paso 4.

### 2.4 Crear la tabla de usuarios
1. En la página de tu base de datos, ve a la pestaña **"Connect"**
2. Copia el comando de conexión externa
3. Abre una terminal/PowerShell y ejecuta:

   ```bash
   mysql -h dpg-xxxxx-a.oregon-postgres.render.com -u flask_login_xxxxx -p
   ```
   
4. Cuando pida la contraseña, pega la que copiaste
5. Una vez conectado, ejecuta estos comandos SQL:

   ```sql
   USE flask_login;

   CREATE TABLE IF NOT EXISTS users (
       id INT AUTO_INCREMENT PRIMARY KEY,
       username VARCHAR(100) NOT NULL UNIQUE,
       password VARCHAR(255) NOT NULL,
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
   );

   SHOW TABLES;
   ```

6. Deberías ver la tabla `users` listada
7. Escribe `exit` para salir

---

## 🌐 Paso 3: Crear Web Service en Render

### 3.1 Crear nuevo Web Service
1. En el Dashboard de Render, haz clic en **"New +"**
2. Selecciona **"Web Service"**

### 3.2 Conectar repositorio de GitHub
1. Si es la primera vez, autoriza a Render para acceder a tu GitHub
2. Busca y selecciona tu repositorio: **"Diego-Alexander-udec/Proyecto-ML"**
3. Haz clic en **"Connect"**

### 3.3 Configurar el Web Service
Llena el formulario con estos valores:

```
Name: flask-login-app
Region: Oregon (US West) - ¡Mismo que tu base de datos!
Branch: main
Root Directory: Proyecto Deduccion de imagen/Login_python

Runtime: Python 3

Build Command: pip install -r requirements.txt

Start Command: gunicorn app:app

Plan: Free
```

⚠️ **MUY IMPORTANTE**: El **Root Directory** debe ser exactamente:
```
Proyecto Deduccion de imagen/Login_python
```

---

## 🔐 Paso 4: Configurar Variables de Entorno

### 4.1 En la misma página de configuración, desplázate hasta la sección **"Environment"**

### 4.2 Añade las siguientes variables (haz clic en "Add Environment Variable" para cada una):

**Variable 1:**
```
Key: SECRET_KEY
Value: P4r4_Pr0du3c10n_FL4SK_2025_S3cur3_K3y
```

**Variable 2:**
```
Key: MYSQL_HOST
Value: [pega el valor de tu base de datos]
```

**Variable 3:**
```
Key: MYSQL_USER
Value: [pega el valor de tu base de datos]
```

**Variable 4:**
```
Key: MYSQL_PASSWORD
Value: [pega el valor de tu base de datos]
```

**Variable 5:**
```
Key: MYSQL_DB
Value: flask_login
```

**Variable 6:**
```
Key: MYSQL_PORT
Value: 3306
```

📝 **Nota**: Los valores de MYSQL_HOST, MYSQL_USER y MYSQL_PASSWORD los copiaste en el Paso 2.3

---

## 🎯 Paso 5: Deploy (¡El momento final!)

1. Revisa que todo esté correcto
2. Haz clic en **"Create Web Service"**
3. ⏳ Espera 3-5 minutos mientras se construye y despliega tu aplicación

### 5.1 Monitorear el despliegue
Verás logs en tiempo real mostrando:
```
==> Installing dependencies...
==> Building your code...
==> Starting your service...
==> Your service is live 🎉
```

### 5.2 Acceder a tu aplicación
Una vez completado, verás una URL como:
```
https://flask-login-app.onrender.com
```

¡Haz clic en ella para ver tu aplicación en vivo! 🎊

---

## 🧪 Paso 6: Probar tu Aplicación

### 6.1 Probar el registro
1. Ve a tu URL: `https://tu-app.onrender.com`
2. Haz clic en "Registrarse"
3. Crea un usuario de prueba:
   - Username: `testuser`
   - Password: `Test123!`
4. Deberías ser redirigido al login

### 6.2 Probar el login
1. Ingresa con las credenciales que acabas de crear
2. Deberías entrar a la página principal (Home)

---

## 🐛 Solución de Problemas

### ❌ Error: "Application failed to respond"

**Solución 1**: Verificar el Start Command
- Debe ser exactamente: `gunicorn app:app`
- Ve a Settings → Start Command y verifica

**Solución 2**: Verificar Root Directory
- Debe ser: `Proyecto Deduccion de imagen/Login_python`
- Ve a Settings → Root Directory y corrige si es necesario

**Solución 3**: Revisar los logs
- En el Dashboard, ve a la pestaña "Logs"
- Busca mensajes de error específicos

### ❌ Error: "Can't connect to MySQL server"

**Solución**: Verificar variables de entorno
1. Ve a Settings → Environment
2. Asegúrate de que TODOS los valores estén correctos:
   - MYSQL_HOST
   - MYSQL_USER
   - MYSQL_PASSWORD
   - MYSQL_DB
   - MYSQL_PORT

### ❌ Error: "Table 'users' doesn't exist"

**Solución**: Crear la tabla manualmente
1. Conéctate a tu base de datos MySQL (ver Paso 2.4)
2. Ejecuta el script SQL para crear la tabla

### 🔄 Si necesitas hacer cambios

1. Realiza los cambios en tu código local
2. Haz commit y push a GitHub:
   ```bash
   git add .
   git commit -m "Descripción del cambio"
   git push origin main
   ```
3. Render detectará los cambios automáticamente y redesplegar tu aplicación

---

## 📊 Verificación Final

✅ **Checklist antes de finalizar:**

- [ ] Base de datos MySQL creada en Render
- [ ] Tabla `users` creada correctamente
- [ ] Web Service creado y conectado a GitHub
- [ ] Root Directory configurado correctamente
- [ ] Todas las variables de entorno agregadas
- [ ] Despliegue completado exitosamente (estado "Live")
- [ ] URL de la aplicación accesible
- [ ] Registro de usuario funciona
- [ ] Login funciona correctamente
- [ ] Navegación entre páginas funciona

---

## 🎉 ¡Felicidades!

Si completaste todos los pasos, tu aplicación Flask está ahora en producción y accesible desde cualquier parte del mundo. 🌍

### URLs importantes:
- **Tu aplicación**: https://tu-app.onrender.com
- **Dashboard Render**: https://dashboard.render.com/
- **Repositorio GitHub**: https://github.com/Diego-Alexander-udec/Proyecto-ML

### Próximos pasos sugeridos:
1. Configurar un dominio personalizado (opcional)
2. Implementar más funcionalidades
3. Agregar validación de formularios más robusta
4. Implementar recuperación de contraseña
5. Agregar roles de usuario

---

## 📞 Soporte

Si tienes problemas:
1. Revisa los logs en Render Dashboard
2. Verifica la sección de solución de problemas arriba
3. Consulta la documentación oficial: https://render.com/docs

**¡Éxito con tu proyecto!** 🚀
