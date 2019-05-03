
package br.com.fapan.conexao;
import java.sql.*;
/**
 *
 * @author ademar
 */
public class conexao {
    
    private String bd = "aplicacaoJSP";
    private String login = "root";
    private String password = "";
    private String url = "jdbc:mysql://localhost/"+bd;
    
     Connection canal = null;

//contructor   
public conexao(){
     
   try {
        Class.forName("com.mysql.jdbc.Driver");
        canal=DriverManager.getConnection(url,login,password);       
        }
    catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};
     
  }
//metodos 
  
   public Connection getConnection(){
      return canal;
   }
 
   public void desconectar(){
      canal = null;
   }
}
