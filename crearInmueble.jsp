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
            <h2 class="h5 text-uppercase mb-4">Crear Inmueble</h2>
          </header>
          <div class="row">
            <div class="col-md-6 mx-auto">
              <form action="crearInmueble.jsp" method="POST">
                <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
               <div class="mb-3">
                  <label for="nombre" class="form-label">nombre</label>
                  <input type="text" class="form-control" id="nombre" name="nombre" required>
                </div>
                <div class="mb-3">
                  <label for="tipo" class="form-label">Tipo</label>
                  <select class="form-select" id="tipo" name="tipo" required>
                    <option value="">Seleccionar tipo</option>
                    <option value="Atico">Atico</option>
                    <option value="Estudio">Estudio</option>
                    <option value="Chalet">Chalet</option>
                    <option value="Duplex">Duplex</option>
                    <!-- Agregar más opciones según sea necesario -->
                  </select>
                </div>
                <div class="mb-3">
                  <label for="direccion" class="form-label">Dirección</label>
                  <input type="text" class="form-control" id="direccion" name="direccion" required>
                </div>
                 
                <div class="mb-3">
                  <label for="precio" class="form-label">Precio</label>
                  <input type="number" class="form-control" id="precio" name="precio" required>
                </div>
                <div class="mb-3">
                  <label for="area" class="form-label">Área (m²)</label>
                  <input type="text" class="form-control" id="area" name="area" required>
                </div>
                <div class="mb-3">
                  <label for="estado" class="form-label">Estado</label>
                  <select class="form-select" id="estado" name="estado" required>
                    <option value="">Seleccionar estado</option>
                    <option value="disponible">Disponible</option>
                    <option value="No disponible">No disponible</option>
                    
                    <!-- Agregar más opciones según sea necesario -->
                  </select>
                </div>
                <button type="submit" class="btn btn-primary m-1">Guardar</button>
              </form>


                <% 
                        if (request.getMethod().equals("POST")) {
                            
                            String tipo = request.getParameter("tipo");
                              String nombre = request.getParameter("nombre");
                            String direccion = request.getParameter("direccion");
                            int precio = Integer.parseInt(request.getParameter("precio"));
                            String area = request.getParameter("area");
                            String estado = request.getParameter("estado");
                            String img=null;
                            String adminNombre=request.getParameter("id");


boolean estadoFinal=true;



switch(tipo) {
        case "Atico":
          img="atico-estilo-loft7-1582040033.jpg";
            break;
        case "Estudio":
             img="eyJidWNrZXQiOiJzdGF0aWN3Iiwia2V5IjoiaW5tdWVibGVzXC9nX3ZlbnRhX2FwYXJ0YW1lbnRvXzNfYWxjb2Jhc19lXzE3MDYxMjIzMDEtMzg4NV8xNTIxLmpwZWciLCJlZGl0cyI6eyJub3JtYWxpc2UiOnRydWUsInJvdGF0ZSI6MCwicmVzaXplIjp7IndpZH.jpg";
            break;
        case "Chalet":
          img="casas-prefabricadas-tipo-chalet-madera.jpg";
            break;
        case "Duplex":
           img="duplex_5499038_20211118164832.jpg";
            break;
      
    }
                          
                            if(estado.equals("disponible")){

                              estadoFinal=true;
                            }else if(estado.equals("No disponible")){



                              estadoFinal=false;
                            }

                            try {
                                // Establece la conexión con la base de datos
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/inmobiliaria", "root", "");

                                // Prepara la consulta SQL para insertar el inmueble
                                String sql = "INSERT INTO inmueble (nombre, tipo, direccion, precio, area, estado,imagen,administradorFk) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                                PreparedStatement statement = conn.prepareStatement(sql);
                                statement.setString(1, nombre);
                                statement.setString(2, tipo);
                                statement.setString(3, direccion);
                                statement.setInt(4, precio);
                                statement.setString(5, area);
                                statement.setBoolean(6, estadoFinal);
                                statement.setString(7, img);
                                statement.setString(8, adminNombre);

out.println(adminNombre);
                                // Ejecuta la consulta
                                int rowsInserted = statement.executeUpdate();
                                if (rowsInserted > 0) {
                                     response.sendRedirect("admin.jsp?id="+adminNombre);
                                } else {
                                    out.println("<p class='text-danger'>No se pudo crear el inmueble.</p>");
                                }

                                // Cierra la conexión
                                conn.close();
                            } catch (SQLException ex) {
                                out.println("<p class='text-danger'>Error al conectar con la base de datos: " + ex.getMessage() + "</p>");
                            }
                        }
                    %>
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