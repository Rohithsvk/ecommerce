<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ include file="header.jsp" %>    
  <%@ include file="topbar.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="stylesheet" href="/css/styles.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<title>Sporty Shoes Home Page</title>
<style type="text/css">
.search-container {
  float: right;
}
table {
 
  width: 100%;
}
h2{
color:green;
text-align:center;
}
h3{
text-align:center;
}
thead{
background-color: red;
}
th, td {
  text-align: left;
  padding: 15px;
}

tr:nth-child(even) {background-color: #f2f333;}


</style>
</head>
<body>
<br>
<div class="search-container">
    <form action="searchHome.jsp">
      <input type="text" placeholder="Search.." name="search">
      <button type="submit"><i class="fa fa-search"></i></button>
    </form>
  </div>
  <h3 style="text-align:center"> Items available in our Store</h3> 
  

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
	
	<%
	if ("sucess".equals(msg))
	{
	%>
		<h2> your Transcation is SucessFull.. You can check in My Order</h2>
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

  <jsp:include page="footer.jsp" ></jsp:include>
</body>
</html>