<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
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
<body>
    <div class="page-holder">
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
        <div class="container">
            <section class="py-5">
                <div class="container p-0">
                    <div class="row">
                        <!-- SHOP LISTING-->
                        <div class="col-lg-9 order-1 order-lg-2 mb-5 mb-lg-0">
                            <div class="row">
                                <%  
                                    Connection conn = null;
                                    PreparedStatement pstmt = null;
                                    ResultSet rs = null;
                                    String fk = request.getParameter("id"); // ID del cliente
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        conn = DriverManager.getConnection("jdbc:mysql://localhost/inmobiliaria", "root", "");
                                        // Consulta SQL para recuperar los inmuebles solicitados por el cliente identificado por "id"
                                        String sql = "SELECT * FROM inmueble WHERE clienteFk = ?";
                                        pstmt = conn.prepareStatement(sql);
                                        pstmt.setString(1, fk); // Establecer el ID del cliente como parámetro
                                      
                                        rs = pstmt.executeQuery();

                                        // Iterar sobre los resultados y mostrar la información de los inmuebles
                                        while(rs.next()) {
                                            String nombre = rs.getString("nombre");
                                            String tipo = rs.getString("tipo");
                                            String direccion = rs.getString("direccion");
                                            String precio = rs.getString("precio");
                                            String area = rs.getString("area");
                                            String estado = rs.getString("estado");
                                            String imagen = rs.getString("imagen");
                                %>
                                <div class="col-lg-4 col-sm-6 mt-3">
                                    <div class="product text-center">
                                        <div class="mb-3 position-relative">
                                            <div class="badge text-white bg-"></div>
                                            <img class="img-fluid w-100" src="img/<%= imagen %>" alt="<%= nombre %>">
                                        </div>
                                        <h6><%= nombre %></h6>
                                        <p class="small text-muted">$<%= precio %></p>
                                        <p class="small"><strong>Tipo:</strong> <%= tipo %></p>
                                        <p class="small"><strong>Dirección:</strong> <%= direccion %></p>
                                        <p class="small"><strong>Área:</strong> <%= area %> m²</p>
                                                                    <p class="small"><strong>Estado:</strong> <%= estado.equals("1") ? "Disponible" : "No disponible" %></p>

                            <div class="mt-3">
                                       
                                        <a href="desSolicitar.jsp?id=<%= fk %>&nombre=<%= nombre %>" class="btn btn-danger btn-sm">Eliminar</a>

                                    </div>
                                      
                                    </div>
                                </div>
                                <%      
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    } finally {
                                        // Cerrar la conexión y liberar recursos
                                        try {
                                            if(rs != null) rs.close();
                                            if(pstmt != null) pstmt.close();
                                            if(conn != null) conn.close();
                                        } catch (SQLException e) {
                                            e.printStackTrace();
                                        }
                                    }
                                %>
                            </div>
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
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>
    <!-- JavaScript files-->
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/glightbox/js/glightbox.min.js"></script>
    <script src="vendor/nouislider/nouislider.min.js"></script>
    <script src="vendor/swiper/swiper-bundle.min.js"></script>
    <script src="vendor/choices.js/public/assets/scripts/choices.min.js"></script>
    <script src="js/front.js"></script>
    <script>
        // ------------------------------------------------------- //
        //   Inject SVG Sprite
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
        injectSvgSprite('https://bootstraptemple.com/files/icons/orion-svg-sprite.svg'); 
    </script>
    <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</body>
</html>
