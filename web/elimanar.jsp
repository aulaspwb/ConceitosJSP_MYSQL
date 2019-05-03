<%-- 
    Document   : elimanar
    Created on : 2 de mai de 2019, 01:32:26
    Author     : ademar
--%>

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
       
<!-- bajas-->


<%
if(request.getParameter("baja") != null)
{

Statement instruccion=null;
instruccion = con.getConnection().createStatement();

String id = request.getParameter("Id_usuario");

try {
instruccion.executeUpdate("delete from usuarios where id_usuarios="+id+";");
out.println("<br></br> <table width='345' border='1' align='center' bgcolor='#FFFFFF'  cellpadding='0' cellspacing='0' bordercolor='#000099'>  <tr>        <td align='center'><FONT color='#000000' SIZE=4>FUE ELIMINADO EL REGISTRO: "+id+" </FONT></td>      </tr>  </table>");
instruccion.close();

} catch(SQLException e) {out.println(e);};

}
%>

<form name="form2" method="post" action="elimanar.jsp" >
<br></br>
    <table width="345" border="1" align="center" bgcolor="#FFFFFF"  cellpadding="0" cellspacing="0" bordercolor="#000099">
      <tr>
        <td align="center" bgcolor="#0000FF"><FONT color="#FFFFFF" SIZE=4 >EXCLUSÃO DE USUARIO</FONT></td>
      </tr>
  </table>
    <table width="345" border="1" align="center" cellpadding="0" bgcolor="#FFFFFF" cellspacing="0" bordercolor="#000099">
      <tr>
        <th width="144" height="52">CÓDIGO DO USUÁRIO</th>
        <td width="185">
       
        <%

ResultSet tabla= null;
Statement instruccion=null;
instruccion = con.getConnection().createStatement();

try {
tabla = instruccion.executeQuery("select * from usuarios order by id_usuarios  ASC");

out.println("<select name='Id_usuario' id='Id del empleado'>");
out.println("<option value='0'>ESCOLHA UM DOS USUÁRIOS</option>");
while(tabla.next()) {
out.println("<option value='"+tabla.getString(1)+"'>"+tabla.getString(2)+"</option>");
}

out.println("</select>");
tabla.close();
instruccion.close();
} catch(SQLException e) {out.println(e);};

%></td>
      </tr>
    </table>
   
    <table width="345" border="0" align="center">
      <tr>
        <td width="%50" align="center"><input name="baja" type="submit" id="bajas" value="EXCLUIR" /></td></form>   

    </body>
</html>
