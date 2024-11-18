<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<%
// Obtiene los parámetros enviados desde la página anterior
String clienteId = request.getParameter("id");
String inmuebleId = request.getParameter("nombre");

// Variables para la conexión y la consulta SQL
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    // Establece la conexión con la base de datos
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost/inmobiliaria", "root", "");

    // Consulta SQL para insertar la llave foránea del cliente en el inmueble seleccionado
    String sql = "UPDATE inmueble SET clienteFk = ? WHERE nombre = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, clienteId);
    pstmt.setString(2, inmuebleId);

    // Ejecuta la consulta
    int rowsAffected = pstmt.executeUpdate();

    // Si la inserción es exitosa, redirecciona a la página de verInmueble con los parámetros necesarios
    if (rowsAffected > 0) {
        response.sendRedirect("verInmueble.jsp?id=" + clienteId);
    } else {
        // Si ocurre algún error, muestra un mensaje de error
        out.println("Error al solicitar el inmueble.");
    }
} catch (Exception e) {
    e.printStackTrace();
     out.println("Error:" + e.getMessage() );
} finally {
    // Cierra la conexión y libera los recursos
    try {
        if(rs != null) rs.close();
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();

    }
}
%>
