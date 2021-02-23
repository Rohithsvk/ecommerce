<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
String product_id = request.getParameter("product_id");
String product = request.getParameter("product");
String product_details = request.getParameter("product_details");
String category = request.getParameter("category");
String price = request.getParameter("price");
String active = request.getParameter("active");

try{
	
	Connection con= ConnectionProvider.getCon();
	PreparedStatement ps= con.prepareStatement("insert into eproduct values(?,?,?,?,?,?)");
	ps.setString(1,product_id);
	ps.setString(2,product);
	ps.setString(3,product_details);
	ps.setString(4,category);
	ps.setString(5,price);
	ps.setString(6,active);
	ps.executeUpdate();
	response.sendRedirect("addProduct.jsp?msg=done");
	
}

catch(Exception e)
{
	response.sendRedirect("addProduct.jsp?msg=wrong");
}
 
%>
