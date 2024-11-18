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
    <div class="container">
        <section class="pt-5">
            <%
                // Obtener el ID del cliente de los parámetros
             String nombreOld=request.getParameter("id");

                // Variables para almacenar los nuevos valores
                String nuevoNombre = "";
                String nuevoApellido = "";
                String nuevoEstadoCivil = "";
                String nuevaDireccion = "";
                String nuevoCorreo = "";
                int nuevoTelefono = 0;
                

                // Verificar si se ha enviado el formulario de edición
                if (request.getMethod().equals("POST")) {
                                    // Recuperar los nuevos valores del formulario
                nuevoNombre = request.getParameter("nombre");
                nuevoApellido = request.getParameter("apellido");
                nuevoEstadoCivil = request.getParameter("estadoCivil");
                nuevaDireccion = request.getParameter("direccion");
                nuevoCorreo = request.getParameter("correo");
                nuevoTelefono = Integer.parseInt(request.getParameter("telefono"));

                // Actualizar los detalles del cliente en la base de datos
                Connection conn = null;
                PreparedStatement pstmt = null;
                try {
                    // Establecer la conexión con la base de datos
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost/inmobiliaria", "root", "");

                    // Consulta SQL para actualizar los detalles del cliente
                    String sql = "UPDATE cliente SET  apellido = ?, estadoCivil = ?, direccion = ?, correo = ?, telefono = ? WHERE nombre = ?";
                    pstmt = conn.prepareStatement(sql);
                
                   
                    pstmt.setString(1, nuevoApellido);
                    pstmt.setString(2, nuevoEstadoCivil);
                    pstmt.setString(3, nuevaDireccion);
                    pstmt.setString(4, nuevoCorreo);
                    pstmt.setInt(5, nuevoTelefono);
                    pstmt.setString(6, nombreOld);
                    pstmt.executeUpdate();

                    // Redireccionar a Cliente.jsp después de guardar los cambios
                    response.sendRedirect("cliente.jsp?id=" + nombreOld);
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

            // Lógica para recuperar los detalles del cliente con el nombre especificado
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String fk= request.getParameter("id");
            try {
                // Establecer la conexión con la base de datos
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost/inmobiliaria", "root", "");

                // Consulta SQL para recuperar los detalles del cliente
                String sql = "SELECT * FROM cliente WHERE nombre = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, fk);
                rs = pstmt.executeQuery();

                // Verificar si se encontró el cliente
                if (rs.next()) {
                    // Recuperar los detalles del cliente
                    String nombre = rs.getString("nombre");
                    String apellido = rs.getString("apellido");
                    String estadoCivil = rs.getString("estadoCivil");
                    String direccion = rs.getString("direccion");
                    String correo = rs.getString("correo");
                    int telefono = rs.getInt("telefono");

                    // Formulario para editar los detalles del cliente
        %>
                    <h1>Editando cliente: <%= nombre %></h1>
                    <form action="actCliente.jsp" method="post">
           
                        <input type="hidden" name="id" value="<%= request.getParameter("id") %>">

                     
                        <div class="form-group">
                            <label for="apellido">Apellido:</label>
                            <input type="text" id="apellido" name="apellido" class="form-control" value="<%= nuevoApellido.isEmpty() ? apellido : nuevoApellido %>">
                        </div>
                        <div class="form-group">
                            <label for="estadoCivil">Estado Civil:</label>
                            <input type="text" id="estadoCivil" name="estadoCivil" class="form-control" value="<%= nuevoEstadoCivil.isEmpty() ? estadoCivil : nuevoEstadoCivil %>">
                        </div>
                        <div class="form-group">
                            <label for="direccion">Dirección:</label>
                            <input type="text" id="direccion" name="direccion" class="form-control" value="<%= nuevaDireccion.isEmpty() ? direccion : nuevaDireccion %>">
                        </div>
                        <div class="form-group">
                            <label for="correo">Correo:</label>
                            <input type="email" id="correo" name="correo" class="form-control" value="<%= nuevoCorreo.isEmpty() ? correo : nuevoCorreo %>">
                        </div>
                        <div class="form-group">
                            <label for="telefono">Teléfono:</label>
                            <input type="text" id="telefono" name="telefono" class="form-control" value="<%= nuevoTelefono == 0 ? telefono : nuevoTelefono %>">
                        </div>
                        <button type="submit" class="btn btn-primary m-1">Guardar cambios</button>
                    </form>
        <%
                } else {
                    // Si no se encontró el cliente, mostrar un mensaje de error
        %>
                    <h1>Error: Cliente no encontrado</h1>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("Error: " + e.getMessage());
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

</div>
</body>
</html>
