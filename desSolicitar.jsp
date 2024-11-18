<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<%
    String idCliente = request.getParameter("id");
    String idInmueble = request.getParameter("nombre");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/inmobiliaria", "root", "");

        // Eliminar la relación entre el cliente y el inmueble
        String sql = "UPDATE inmueble SET clienteFk = NULL WHERE nombre = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, idInmueble);
        int rowsAffected = pstmt.executeUpdate();

        // Redirigir a inmuebleSolicitado.jsp después de eliminar la relación
        if (rowsAffected > 0) {
            response.sendRedirect("inmuebleSolicitado.jsp?id=" + idCliente);
        } else {
            out.println("<h2>No se pudo desvincular el inmueble del cliente.</h2>");
        }
    } catch (Exception e) {
        out.println("<h2>Error: " + e.getMessage() + "</h2>");
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
%>
