<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<title>Sporty Shoes Home Page</title>
</head>
<body>
<center>
 <h3> Welcome to the brand new Online E Store </h3>
 <h1> Sporty Shoes</h1>
  </center>
 <%@ include file="topbar.jsp" %> 
  <hr>
  Welcome ${email}
  <hr>
  
  <h3> Items available in our Store</h3> 
   <form action="searchHome.jsp">
<input type="search" name="search" placeHolder="search Items" >
<input type="submit" value="search">
</form>
<hr>
<% String msg= request.getParameter("msg");
if ("added".equals(msg))
{
	%>
	<h3 >Product added successfully!</h3>
	<%
}
	if ("exist".equals(msg))
{
	%>
		<h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
	
	<%
}
	if ("invalid".equals(msg))
	{
	%>
		<h3 class="alert">something went wrong</h3>
	<% 
	}
	%>
  
<table cellpadding="15" cellspacing="5" border="5">
 <thead>
 <tr>
 <th> Product ID</th>
 <th> Product Name</th>
 <th> Product Details</th>
 <th> Category </th> 
 <th> Price </th>
 <th> Action Performed </th>
 </tr>
 </thead>
 
 <tbody>
 
 <%@ page import="project.ConnectionProvider" %>
 <%@ page import="java.sql.*"%>
 <% try 
 {
 	Connection con = ConnectionProvider.getCon();
 	Statement st = con.createStatement();
 	ResultSet rs = st.executeQuery("select * from eproduct");
 	while(rs.next())
 	{
 %>

 		<tr>
 			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
 			<td><%=rs.getString(3)%></td>
 			<td><%=rs.getString(4)%></td>
 			<td><%=rs.getString(5)%></td>
 			<td>
			<a href="addToCartAction.jsp?product_id=<%=rs.getInt(1)%>">Add To Cart</a>
			</td>
		</tr>
		
		<%
		 }
 }
catch(Exception e)
 {
 System.out.print(e);
 }
 %>
 
 </tbody>
 </table>

  
</body>
</html>