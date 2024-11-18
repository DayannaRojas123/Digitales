<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%
    // Obtener el ID del inmueble de los parámetros
    String id = request.getParameter("id");
    String fk= request.getParameter("nombre");
    // Verificar si el ID está presente y no es nulo
    if (fk != null && !fk.isEmpty()) {
        // Lógica para eliminar el inmueble con el ID especificado
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            // Establecer la conexión con la base de datos
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/inmobiliaria", "root", "");

            // Consulta SQL para eliminar el inmueble
            String sql = "DELETE FROM inmueble WHERE nombre = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, fk);
            pstmt.executeUpdate();

            // Redireccionar de vuelta a la página de gestorInmueble.jsp
            response.sendRedirect("gestorInmueble.jsp?id=" + request.getParameter("id"));

           
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
    } else {
        // Si el ID no está presente o es nulo, mostrar un mensaje de error
        out.println("Error: ID de inmueble no especificado");
    }
%>