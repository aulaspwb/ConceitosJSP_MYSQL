<%-- 
    Document   : insert
    Created on : 2 de mai de 2019, 01:29:11
    Author     : ademar
--%>
<%-- 
    Document   : consultaBanco
    Created on : 2 de mai de 2019, 00:22:47
    Author     : ademar
--%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@page import="br.com.fapan.conexao.conexao" %>
<%! conexao con = new conexao();%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
if(request.getParameter("alta") != null)
{

Statement instruccion=null;

instruccion = con.getConnection().createStatement();

String id_usu = request.getParameter("Id_usuario");
String nom_usu = request.getParameter("Nombre_usuario");

try {
instruccion.executeUpdate("insert into usuarios values('"+id_usu+"','"+nom_usu+"');");
out.println("<br></br> <table width='345' border='1' align='center' bgcolor='#FFFFFF'  cellpadding='0' cellspacing='0' bordercolor='#000099'>  <tr><td align='center'><FONT color='#000000' SIZE=4>Usuário Inserido: "+nom_usu+" </FONT></td>      </tr>  </table> ");

instruccion.close();


} catch(SQLException e) {out.println(e);};

}
%>
<form name="form" method="post"  action="insert.jsp" >
<br></br>
    <table width="352" border="1" bgcolor="#FFFFFF" align="center" cellpadding="0" cellspacing="0" bordercolor="#000099">
      <tr>
        <td align="center" bgcolor="#0000CC"><FONT color="#FFFFFF" SIZE=4 >DADOS DO USUÁRIO</FONT></td>
      </tr>
  </table>
    <table width="352" height="81" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#000099" bgcolor="#FFFFFF">
      <tr>
        <th width="144">CÓDIGO DO USUÁRIO</th>
        <td width="185"><input type="text" name="Id_usuario" id="Id_usuario"/></td>
      </tr>
      <tr>
        <th>NOME DO USUÁRIO </th>
        <td><input type="text" name="Nombre_usuario" id="Nombre"/></td>
      </tr>
  </table>
    <center>
    <table width="345" border="0" align="center">
      <tr>
        <td width="%50" align="center"><input name="alta" type="submit"  value="INSERIR" /></td></form>   
</form>

    </body>
</html>
