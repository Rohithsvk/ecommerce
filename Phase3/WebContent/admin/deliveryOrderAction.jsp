<%@ page import="project.ConnectionProvider" %>
 <%@ page import="java.sql.*"%>
 
 <% 
 
 String product_id =request.getParameter("product_id");
 String email= request.getParameter("email");
 String status="delivered";
 
 try{
	 Connection con=ConnectionProvider.getCon();
 	Statement st =con.createStatement();
 	st.executeUpdate(" update cart set  status='"+status+"' where  product_id='"+product_id+"' and email='"+email+"' and address is not NULL");
 	response.sendRedirect( "ordersReceived.jsp?msg=delivered");
 }
 catch (Exception e)
 {
	 System.out.println(e);
	 response.sendRedirect( "ordersReceived.jsp?msg=wrong");
 }
 
 %>