<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inmobiliaria | CasaSegura - Registro</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.default.css" rel="stylesheet">
    <link rel="stylesheet" href="vendor/glightbox/css/glightbox.min.css">
    <link rel="stylesheet" href="vendor/nouislider/nouislider.min.css">
    <link rel="stylesheet" href="vendor/choices.js/public/assets/styles/choices.min.css">
    <link rel="stylesheet" href="vendor/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Libre+Franklin:wght@300;400;700&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Martel+Sans:wght@300;400;800&amp;display=swap">
    <link rel="shortcut icon" href="img/favicon.png">
</head>
<style>
    html, body {
      height: 100%;
      margin: 0;
      padding: 0;
    }
  
    .page-holder {
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }
  
    footer {
      margin-top: auto;
    }
</style>  
<body class="page-holder">

<%

String accion = request.getParameter("tipo");
    // Verificar si se han enviado datos del formulario
    if (request.getMethod().equals("POST")) {
        // Obtener los parámetros del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");

out.println("Nombre: " + nombre);
out.println("Apellido: " + apellido);
out.println("Correo: " + correo);
out.println("Contraseña: " + contrasena);

        
        // Establecer la conexión con la base de datos
        Connection conn = null;
        Statement stmt = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/inmobiliaria", "root", "");
            stmt = conn.createStatement();
            
            // Preparar la consulta SQL para insertar un nuevo usuario
            String sql = "";
            if (accion.equals("admin")) {
                // Si el tipo de usuario es administrador
               sql = "INSERT INTO administrador (nombre, apellido, correo, contrasena) VALUES ('" + nombre + "', '" + apellido + "', '" + correo + "', '" + contrasena + "')";
            } else if (accion.equals("cliente")) {
                // Si el tipo de usuario es cliente
                String direccion = request.getParameter("direccion");
                int telefono = Integer.parseInt(request.getParameter("telefono"));
                String estadoCivil = request.getParameter("estadoCivil");
                sql = "INSERT INTO cliente (nombre, contrasena, estadoCivil, direccion, correo, apellido, telefono) VALUES ('" + nombre + "', '" + contrasena + "', '" + estadoCivil + "', '" + direccion + "', '" + correo + "', '" + apellido + "', '" + telefono+ "')";
            }
            
            // Ejecutar la consulta
            stmt.executeUpdate(sql);
            
            // Redirigir al usuario a una página de éxito
            if ("admin".equals(request.getParameter("tipo"))) {
                response.sendRedirect("admin.jsp?id="+nombre);
            } else if ("cliente".equals(request.getParameter("tipo"))) {
                response.sendRedirect("cliente.jsp?id="+nombre);
            }
            
        } catch (Exception e) {
            // Imprimir el error
            e.printStackTrace();
            // Mostrar un mensaje de error al usuario
            out.println("Ha ocurrido un error al registrar el usuario. Por favor, inténtelo de nuevo.");
                out.println("Error: " + e.getMessage());

        } finally {
            // Cerrar la conexión y los recursos
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
%>

<header class="header bg-white">
    <div class="container px-lg-3">
        <nav class="navbar navbar-expand-lg navbar-light py-3 px-lg-0">
            <a class="navbar-brand" href="index.html"><span class="fw-bold text-uppercase text-dark">CasaSegura</span></a>
            <button class="navbar-toggler navbar-toggler-end" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <!-- Aquí podrías añadir más elementos del menú de navegación si lo necesitas -->
            </div>
        </nav>
    </div>
</header>

<div class="container mt-5">
    <h1 class="text-center">Formulario de Registro</h1>
    <form action="registro.jsp" method="post">
 
        <div class="row mb-3">
            <div class="col-md-6">
                <label for="nombre" class="form-label">Nombre:</label>
                <input type="text" name="nombre" id="nombre" class="form-control" required>
            </div>
            <div class="col-md-6">
                <label for="apellido" class="form-label">Apellido:</label>
                <input type="text" name="apellido" id="apellido" class="form-control" required>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label for="correo" class="form-label">Correo:</label>
                <input type="email" name="correo" id="correo" class="form-control" required>
            </div>
            <div class="col-md-6">
                <label for="contrasena" class="form-label">Contraseña:</label>
                <input type="password" name="contrasena" id="contrasena" class="form-control" required>
            </div>

            <input type="hidden" name="tipo" value="<%= request.getParameter("tipo") %>">

        </div>

        <%-- Campos específicos para Cliente --%>
        <% if ("cliente".equals(request.getParameter("tipo"))) { %>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="direccion" class="form-label"> Dirección:</label>
                    <input type="text" name="direccion" id="direccion" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label for="telefono" class="form-label">Teléfono:</label>
                    <input type="text" name="telefono" id="telefono" class="form-control" required>
                </div>
            </div>

            <label for="estadoCivil" class="form-label">Estado Civil:</label>
            <select name="estadoCivil" id="estadoCivil" class="form-select">
                <option value="soltero">Soltero</option>
                <option value="casado">Casado</option>
                <option value="divorciado">Divorciado</option>
            </select>

            <br>
        <% } %>

        <button type="submit" class="btn btn-primary mt-3">Registrarse</button>
    </form>
</div>

<footer class="bg-dark text-white">
    <div class="container py-4">
        <div class="border-top pt-4" style="border-color: #1d1d1d !important">
            <div class="row">
                <div class="col-md-6 text-center text-md-start">
                    <p class="small text-muted mb-0">&copy; 2024 Dayanna Valentina Rojas Rey All rights reserved.</p>
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <p class="small text-muted mb-0">Template designed by <a class="text-white reset-anchor" href="https://bootstrapious.com/p/boutique-bootstrap-e-commerce-template">Bootstrapious</a></p>
                    <!-- If you want to remove the backlink, please purchase the Attribution-Free License. See details in readme.txt or license.txt. Thanks!-->
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- JavaScript files-->
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="vendor/glightbox/js/glightbox.min.js"></script>
<script src="vendor/nouislider/nouislider.min.js"></script>
<script src="vendor/swiper/swiper-bundle.min.js"></script>
<script src="vendor/choices.js/public/assets/scripts/choices.min.js"></script>
<script src="js/front.js"></script>
<script>
    // ------------------------------------------------------- //
    //   Inject SVG Sprite - 
    //   see more here 
    //   https://css-tricks.com/ajaxing-svg-sprite/
    // ------------------------------------------------------ //
    function injectSvgSprite(path) {
        var ajax = new XMLHttpRequest();
        ajax.open("GET", path, true);
        ajax.send();
        ajax.onload = function(e) {
            var div = document.createElement("div");
            div.className = 'd-none';
            div.innerHTML = ajax.responseText;
            document.body.insertBefore(div, document.body.childNodes[0]);
        }
    }
    // this is set to BootstrapTemple website as you cannot 
    // inject local SVG sprite (using only 'icons/orion-svg-sprite.svg' path)
    // while using file:// protocol
    // pls don't forget to change to your domain :)
    injectSvgSprite('https://bootstraptemple.com/files/icons/orion-svg-sprite.svg'); 
</script>
<!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</body>
</html>
