<%@ page import="java.sql.*, javax.servlet.*,java.sql.SQLException, javax.servlet.http.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Inmobiliaria | casaSegura</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- gLightbox gallery-->
    <link rel="stylesheet" href="vendor/glightbox/css/glightbox.min.css">
    <!-- Range slider-->
    <link rel="stylesheet" href="vendor/nouislider/nouislider.min.css">
    <!-- Choices CSS-->
    <link rel="stylesheet" href="vendor/choices.js/public/assets/styles/choices.min.css">
    <!-- Swiper slider-->
    <link rel="stylesheet" href="vendor/swiper/swiper-bundle.min.css">
    <!-- Google fonts-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Libre+Franklin:wght@300;400;700&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Martel+Sans:wght@300;400;800&amp;display=swap">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.png">
  </head>
  <body>
    <div class="page-holder">
    <header class="header bg-white">
        <div class="container px-lg-3">
          <nav class="navbar navbar-expand-lg navbar-light py-3 px-lg-0"><a class="navbar-brand" href="admin.jsp?id=<%= request.getParameter("id") %>"><span class="fw-bold text-uppercase text-dark">casaSegura</span></a>
            <button class="navbar-toggler navbar-toggler-end" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav me-auto">
                <li class="nav-item">
                  <!-- Link--><a class="nav-link active" href="admin.jsp?id=<%= request.getParameter("id") %>">Home</a>
                </li>
               
                <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="pagesDropdown" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">crear</a>
                  <div class="dropdown-menu mt-3 shadow-sm" aria-labelledby="pagesDropdown"><a class="dropdown-item border-0 transition-link" href="crearInmueble.jsp?id=<%= request.getParameter("id") %>">inmuebles</a><a class="dropdown-item border-0 transition-link" href="crearCliente.jsp?id=<%= request.getParameter("id") %>">clientes</a></div>
                </li>
                <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="pagesDropdown" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">gestionar</a>
                    <div class="dropdown-menu mt-3 shadow-sm" aria-labelledby="pagesDropdown"><a class="dropdown-item border-0 transition-link" href="gestorInmueble.jsp?id=<%= request.getParameter("id") %>">inmuebles</a><a class="dropdown-item border-0 transition-link" href="gestorCliente.jsp?id=<%= request.getParameter("id") %>">clientes</a></div>
                  </li>
              </ul>
              <ul class="navbar-nav ms-auto">               
 
                <li class="nav-item"><a class="nav-link" href="index.html"> <i class="fas fa-user me-1 text-gray fw-normal"></i>cerrar sesion</a></li>
              </ul>
            </div>
          </nav>
        </div>
      </header>
      <!-- Aquí iría el código del encabezado si es necesario -->
      <div class="container">
        <section class="pt-5">
          <header class="text-center">
            <h2 class="h5 text-uppercase mb-4">Crear Cliente</h2>
          </header>
          <div class="row">
            <div class="col-md-6 mx-auto">
              <form action="" method="POST">
                <div class="mb-3">
                 <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
                  <label for="nombre" class="form-label">Nombre</label>
                  <input type="text" class="form-control" id="nombre" name="nombre" required>
                </div>
                <div class="mb-3">
                  <label for="apellido" class="form-label">Apellido</label>
                  <input type="text" class="form-control" id="apellido" name="apellido" required>
                </div>
                <div class="mb-3">
                  <label for="contrasena" class="form-label">Contraseña</label>
                  <input type="password" class="form-control" id="contrasena" name="contrasena" required>
                </div>
                <div class="mb-3">
                  <label for="estado_civil" class="form-label">Estado Civil</label>
                  <select class="form-select" id="estado_civil" name="estado_civil" required>
                    <option value="soltero">Soltero</option>
                    <option value="casado">Casado</option>
                    <option value="divorciado">Divorciado</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="correo" class="form-label">Correo</label>
                  <input type="email" class="form-control" id="correo" name="correo" required>
                </div>
                <div class="mb-3">
                  <label for="direccion" class="form-label">Direccion</label>
                  <input type="text" class="form-control" id="direccion" name="direccion" required>
                </div>
                <div class="mb-3">
                  <label for="telefono" class="form-label">Telefono</label>
                  <input type="tel" class="form-control" id="telefono" name="telefono" required>
                </div>
                <button type="submit" class="btn btn-primary m-1">Guardar</button>
              </form>
            </div>
          </div>
        </section>
      </div>

 
    
    
    <%
        if (request.getMethod().equals("POST")) {
            // Recuperar los datos del formulario
            String fk=request.getParameter("id") ;
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String correo = request.getParameter("correo");
            String contrasena= request.getParameter("contrasena");
            String estadoCivil=request.getParameter("estado_civil");
             String direccion = request.getParameter("direccion");
             int telefono =  Integer.parseInt( request.getParameter("telefono"));
            // Lógica para guardar el cliente en la base de datos
            Connection conn = null;
            PreparedStatement stmt = null;
            
            try {
                // Establecer la conexión con la base de datos
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost/inmobiliaria", "root", "");
                
                // Preparar la consulta SQL para insertar el cliente
                String sql = "INSERT INTO cliente (nombre, contrasena, estadoCivil, direccion,correo,apellido,telefono,administradorFk) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, nombre);
                stmt.setString(2, contrasena);
                stmt.setString(3, estadoCivil);
                stmt.setString(4, direccion);
                 stmt.setString(5, correo);
                  stmt.setString(6, apellido);
                   stmt.setInt(7, telefono);
                   stmt.setString(8, fk);
                
                // Ejecutar la consulta
                int filasInsertadas = stmt.executeUpdate();
                
                // Verificar si se insertaron correctamente los datos
                if (filasInsertadas > 0) {
                    response.sendRedirect("admin.jsp?id="+fk);
                } else {
                    out.println("<h2>Error al guardar el cliente.</h2>");
                }
            } catch (Exception e) {
                out.println("<h2>Error: " + e.getMessage() + "</h2>");
            } finally {
                // Cerrar la conexión y liberar recursos
                try {
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException ex) {
                    out.println("<h2>Error al cerrar la conexión: " + ex.getMessage() + "</h2>");
                }
            }
        }
    %>
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
    </div>
  </body>
</html>