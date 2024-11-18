
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

// Establecer la conexión a la base de datos

Connection con = null;
Statement stmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/inmobiliaria","root","");
    stmt = con.createStatement();

    // Consulta para verificar las credenciales del usuario en la tabla administrador
    String queryAdmin = "SELECT * FROM administrador WHERE nombre = '" + username + "' AND contrasena = '" + password + "'";
    rs = stmt.executeQuery(queryAdmin);

    if (rs.next()) {
        // Si las credenciales son de un administrador, redirigir a administrador.html
        response.sendRedirect("admin.jsp?id="+username);
    } else {
        // Consulta para verificar las credenciales del usuario en la tabla cliente
        String queryCliente = "SELECT * FROM cliente WHERE nombre = '" + username + "' AND contrasena = '" + password + "'";
        rs = stmt.executeQuery(queryCliente);

        if (rs.next()) {
            // Si las credenciales son de un cliente, redirigir a cliente.html
            response.sendRedirect("cliente.jsp?id="+username);
        } else {
            out.println("Credenciales incorrectas. Por favor, inténtalo de nuevo.");
        }
    }
} catch (Exception e) {
    out.println("Error: " + e.getMessage());


} finally {
    try {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (con != null) con.close();
    } catch (SQLException ex) {
        out.println("Error al cerrar la conexión: " + ex.getMessage());
    }
}
%>
