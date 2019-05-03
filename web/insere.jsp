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
            if (request.getParameter("alta") != null) {

                Statement instruccion = null;

                instruccion = con.getConnection().createStatement();
              //   String codigo = request.getParameter("codigo");
                String descricao = request.getParameter("descricao");
                String distribuidor = request.getParameter("distribuidor");
                String quantidade = request.getParameter("quantidade");

                try {
                    instruccion.executeUpdate("insert into produtos values('" 
                                                        + descricao + "','"
                            + distribuidor + "','" 
                            + quantidade + "');");
                    out.println("<br></br> <table width='345' border='1' align='center' bgcolor='#FFFFFF'  cellpadding='0' cellspacing='0' bordercolor='#000099'>  <tr><td align='center'><FONT color='#000000' SIZE=4>FUE DADO DE ALTA : " + descricao + " </FONT></td>      </tr>  </table> ");

                    instruccion.close();

                } catch (SQLException e) {
                    out.println(e);
                };

            }
        %>
        <form name="form" method="post"  action="insere.jsp" >
            <br></br>
            <table width="352" border="1" bgcolor="#FFFFFF" align="center" cellpadding="0" cellspacing="0" bordercolor="#000099">
                <tr>
                    <td align="center" bgcolor="#0000CC"><FONT color="#FFFFFF" SIZE=4 >CADASTRO DE PRODUTOS</FONT></td>
                </tr>
            </table>
            <table width="352" height="81" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#000099" bgcolor="#FFFFFF">
               
               
                 <tr>
                    <th width="144">DESCRIÇÃO </th>
                    <td width="185"><input type="text" name="descricao" id="Id_usuario"/></td>
                </tr>
                <tr>
                    <th>DESTRIBUIDOR </th>
                    <td><input type="text" name="distribuidor" id="Nombre"/></td>
                </tr>
                
                <tr>
                    <th>QUANTIDADE </th>
                    <td><input type="text" name="quantidade" id="Nombre"/></td>
                </tr>
            </table>
            <center>
                <table width="345" border="0" align="center">
                    <tr>
                        <td width="%50" align="center"><input name="Alta" type="submit"  value="CADASTRAR" /></td></form>   
                        <td width="%50" align="center"><input name="LIMPAR" type="reset"  value="Limpar" /></td></form>   
                        </form>



                        </body>
                        </html>

