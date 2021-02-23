package project;
import java.sql.*;
public class ConnectionProvider
{
public static Connection getCon() throws SQLException
 {
try {
 Class.forName("com.mysql.jdbc.Driver");
 Connection con
=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "root");
 return con;
 }
 catch (Exception e)
 {
 System.out.println(e);
 return null;
 }
 }
}