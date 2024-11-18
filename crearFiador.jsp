<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
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
    <!-- navbar-->
       <!-- navbar-->  
  <header class="header bg-white">
          <div class="container px-lg-3">
            <nav class="navbar navbar-expand-lg navbar-light py-3 px-lg-0"><a class="navbar-brand" href="cliente.jsp?id=<%= request.getParameter("id") %>"><span class="fw-bold text-uppercase text-dark">casaSegura</span></a>
              <button class="navbar-toggler navbar-toggler-end" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto">
                  <li class="nav-item">
                    <!-- Link--><a class="nav-link active" href="cliente.jsp?id=<%= request.getParameter("id") %>">Home</a>
                  </li>
                  <li class="nav-item">
                    <!-- Link--><a class="nav-link" href="verInmueble.jsp?id=<%= request.getParameter("id") %>">Inmuebles</a>
                  </li>
            
                
                  <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="pagesDropdown" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Info</a>
                    <div class="dropdown-menu mt-3 shadow-sm" aria-labelledby="pagesDropdown"><a class="dropdown-item border-0 transition-link" href="actCliente.jsp?id=<%= request.getParameter("id") %>">Actualizar datos</a><a class="dropdown-item border-0 transition-link" href="crearFiador.jsp?id=<%= request.getParameter("id") %>">Agregar fiador</a></div>
                  </li>

                  <li class="nav-item">
                      <!-- Link--><a class="nav-link" href="inmuebleSolicitado.jsp?id=<%= request.getParameter("id") %>">Inmuebles solicitados</a>
                    </li>
              
                </ul>
                <ul class="navbar-nav ms-auto">               
  
                  <li class="nav-item"><a class="nav-link" href="index.html"> <i class="fas fa-user me-1 text-gray fw-normal"></i>Cerrar sesion</a></li>
                </ul>
              </div>
            </nav>
          </div>
        </header>
    <!-- Modal -->
    <!-- Modal content -->
    <div class="container">
        <!-- HERO SECTION-->
        <!-- Hero section content -->
        <!-- CATEGORIES SECTION-->
        <!-- Categories section content -->
        <!-- TRENDING PRODUCTS-->
        <!-- Trending products content -->
        <!-- SERVICES-->
        <!-- Services content -->
        <!-- FORM -->
        <section class="my-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <h2 class="text-center mb-4">Crear Fiador</h2>
                        <form action="crearFiador.jsp" method="post">
                            <div class="mb-3">
                                <label for="nombre" class="form-label">Nombre</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" required>
                            </div>
                            <div class="mb-3">
                                <label for="apellido" class="form-label">Apellido</label>
                                <input type="text" class="form-control" id="apellido" name="apellido" required>
                            </div>
                            <div class="mb-3">
                                <label for="correo" class="form-label">Correo</label>
                                <input type="email" class="form-control" id="correo" name="correo" required>
                            </div>
                            <div class="mb-3">
                                <label for="telefono" class="form-label">Teléfono</label>
                                <input type="number" class="form-control" id="telefono" name="telefono" required>
                            </div>
                            <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
                            <button type="submit" class="btn btn-primary">Crear Fiador</button>
                        </form>

                        <%
    if (request.getMethod().equals("POST")) {
        // Obtener los parámetros del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        int telefono = request.getParameter("telefono") != null ? Integer.parseInt(request.getParameter("telefono")) : 0;
        String clienteFk = request.getParameter("id"); // ID del cliente asociado al fiador

        // Conexión a la base de datos
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            // Establecer la conexión con la base de datos
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/inmobiliaria", "root", "");

            // Consulta SQL para insertar un nuevo fiador
            String sql = "INSERT INTO fiador (nombre, apellido, correo, telefono, clienteFk) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            // Establecer los valores para la consulta
            pstmt.setString(1, nombre);
            pstmt.setString(2, apellido);
            pstmt.setString(3, correo);
            pstmt.setInt(4, telefono);
            pstmt.setString(5, clienteFk);

            // Ejecutar la consulta
            pstmt.executeUpdate();

            // Mostrar un mensaje de fiador creado
            out.println("<p>¡Fiador creado correctamente!</p>");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error al crear el fiador: " + e.getMessage() + "</p>");
        } finally {
            // Cerrar la conexión y liberar recursos
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
                    </div>
                </div>
            </div>
        </section>
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
        // JavaScript code
    </script>
    <!-- FontAwesome CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
          integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
          crossorigin="anonymous">
</div>



</body>
</html>
