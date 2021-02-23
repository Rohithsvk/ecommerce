<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> All Products List</title>
</head>

<body>

<% 
String msg= request.getParameter("msg");
if("done".equals(msg))
{
%>
<h2> Product added Sucessfully  </h2>
<%}
if("wrong".equals(msg))
{
%>
<h2> Something went wrong</h2>
<%} %> 

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
 <% try {
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
			<a href="EditProduct.jsp?product_id=<%=rs.getInt(1)%>">Edit</a>//
			 <a href="removeProductAction.jsp?product_id=<%=rs.getInt(1)%>">Remove </a>
			</td>
			</tr>
		<%}

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