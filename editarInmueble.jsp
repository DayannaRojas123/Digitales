<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>

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
    <div class="container">
        <section class="pt-5">
            <%
                // Obtener el ID del inmueble de los parámetros
                String id = request.getParameter("id");

                // Variables para almacenar los nuevos valores
                String nuevoNombre = "";
                String nuevoTipo = "";
                String nuevaDireccion = "";
                String nuevoPrecio = "";
                String nuevaArea = "";
                String nuevoEstado = "";
                String nombreOld=request.getParameter("fk");

                // Verificar si se ha enviado el formulario de edición
                if (request.getMethod().equals("POST")) {
                    // Recuperar los nuevos valores del formulario
                    nuevoNombre = request.getParameter("nombre");
                    nuevoTipo = request.getParameter("tipo");
                    nuevaDireccion = request.getParameter("direccion");
                    nuevoPrecio = request.getParameter("precio");
                    nuevaArea = request.getParameter("area");
                    nuevoEstado = request.getParameter("estado");

                    // Actualizar los detalles del inmueble en la base de datos
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    try {
                        // Establecer la conexión con la base de datos
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost/inmobiliaria", "root", "");

                        // Consulta SQL para actualizar los detalles del inmueble
                        String sql = "UPDATE inmueble SET  tipo = ?, direccion = ?, precio = ?, area = ?, estado = ? WHERE nombre = ?";
                        pstmt = conn.prepareStatement(sql);
                    
                        pstmt.setString(1, nuevoTipo);
                        pstmt.setString(2, nuevaDireccion);
                        pstmt.setString(3, nuevoPrecio);
                        pstmt.setString(4, nuevaArea);
                        pstmt.setString(5, nuevoEstado);
                        pstmt.setString(6, nombreOld);
                        pstmt.executeUpdate();

                        // Redireccionar a gestorInmueble.jsp después de guardar los cambios
                        response.sendRedirect("gestorInmueble.jsp?id=" + id);
                    } catch (Exception e) {
                        e.printStackTrace();
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

                // Lógica para recuperar los detalles del inmueble con el ID especificado
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                String fk= request.getParameter("nombre");
                try {
                    // Establecer la conexión con la base de datos
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost/inmobiliaria", "root", "");

                    // Consulta SQL para recuperar los detalles del inmueble
                    String sql = "SELECT * FROM inmueble WHERE nombre = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, fk);
                    rs = pstmt.executeQuery();

                    // Verificar si se encontró el inmueble
                    if (rs.next()) {
                        // Recuperar los detalles del inmueble
                        String nombre = rs.getString("nombre");
                        String tipo = rs.getString("tipo");
                        String direccion = rs.getString("direccion");
                        String precio = rs.getString("precio");
                        String area = rs.getString("area");
                        String estado = rs.getString("estado");
                        String imagen = rs.getString("imagen");

                        // Formulario para editar los detalles del inmueble
            %>
                        <h1>Editando inmueble: <%= nombre %></h1>
                        <form action="editarInmueble.jsp" method="post">
                            <input type="hidden" name="fk" value="<%= nombre %>">
                            <input type="hidden" name="id" value="<%= request.getParameter("id") %>">

                       
                            <div class="form-group">
                                <label for="tipo">Tipo:</label>
                                <input type="text" id="tipo" name="tipo" class="form-control" value="<%= nuevoTipo.isEmpty() ? tipo : nuevoTipo %>">
                            </div>
                            <div class="form-group">
                                <label for="direccion">Dirección:</label>
                                <input type="text" id="direccion" name="direccion" class="form-control" value="<%= nuevaDireccion.isEmpty() ? direccion : nuevaDireccion %>">
                            </div>
                            <div class="form-group">
                                <label for="precio">Precio:</label>
                                <input type="text" id="precio" name="precio" class="form-control" value="<%= nuevoPrecio.isEmpty() ? precio : nuevoPrecio %>">
                            </div>
                            <div class="form-group">
                                <label for="area">Área:</label>
                                <input type="text" id="area" name="area" class="form-control" value="<%= nuevaArea.isEmpty() ? area : nuevaArea %>">
                            </div>
                            <div class="form-group">
                                <label for="estado">Estado:</label>
                                <input type="text" id="estado" name="estado" class="form-control" value="<%= nuevoEstado.isEmpty() ? estado : nuevoEstado %>">
                            </div>
                            <button type="submit" class="btn btn-primary">Guardar cambios</button>
                        </form>
            <%
                    } else {
                        // Si no se encontró el inmueble, mostrar un mensaje de error
            %>
                        <h1>Error: Inmueble no encontrado</h1>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    // Cerrar la conexión y liberar recursos
                    try {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
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
        // ------------------------------------------------------- //
        //   Inject SVG Sprite -
        //   see more here
        //   https://css-tricks.com/ajaxing-svg-sprite/
        // ------------------------------------------------------ //
     