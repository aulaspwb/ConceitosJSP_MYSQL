<%-- 
    Document   : consultaBanco
    Created on : 2 de mai de 2019, 00:22:47
    Author     : ademar
--%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@page import="br.com.fapan.conexao.conexao" %>
<%! conexao con = new conexao(); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>




<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Consulta -->
<%

ResultSet tabla= null;
Statement instruccion=null;
instruccion = con.getConnection().createStatement();

try {
tabla = instruccion.executeQuery("select * from produtos order by descricao  ASC");
%>
<br><br/>
<table width="402" height="35" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#000099" background="../IMAGENES/barramorada.jpg" bgcolor="#FFFFFF">
      <tr bgcolor="#0000CC">
        <td align="center"><FONT color="#FFFFFF" SIZE=4 >CONSULTAS DE PRODUTOS</FONT></td>
      </tr>
</table>
<table width="400" border="1" align="center" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0" bordercolor="#000099">
  <tr >
    <td width="140" align="center"      bgcolor="#999999"><FONT color="#FFFFFF" ><strong>ID</strong></FONT></td>
    <td width="254" align="center" bgcolor="#999999"><FONT color="#FFFFFF" ><strong>NOMES</strong></FONT></td>
  </tr>
<%

while(tabla.next()) {
out.println("<TR><TD><center>"+tabla.getString(1)+"</cebter></TD><TD><center>"+tabla.getString(2)+"</center></TD></TR>");
}
%>
</table>
<%
tabla.close();
instruccion.close();
con.desconectar();
} catch(SQLException e) {out.println(e);};
%>

    </body>
</html>
