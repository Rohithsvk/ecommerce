<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ include file="header.jsp" %>    
  <%@ include file="topbar.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sporty Shoes Home Page</title>
<style type="text/css">
.search-container {
  float: right;
}
table {
 
  width: 100%;
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
  <hr>
  <hr>
  

   <form action="searchHome.jsp">
<input type="search" name="search" placeHolder="search Items" >
<input type="submit" value="search">
</form>
<hr>
  
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
 <%
 int z=0;
 String search= request.getParameter("search");
 %>
 <h3> These are the list of items found on your search "<% out.print(search); %>"</h3> 
 <%
 try {
 Connection con = ConnectionProvider.getCon();
 Statement st = con.createStatement();
 ResultSet rs = st.executeQuery("select * from eproduct where product_name like '%"+ search+"%' or  Category like '%"+ search+"%' and status='yes'");
 while(rs.next())
 {
	 z=1;
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
		<%}

 }
 catch(Exception e)
 {
 System.out.print(e);
 }
 
 if(z==0)
 {
	 %>
	 <h3> No Matching Results found </h3>
	 <%
 }
 %>
		
 
 </tbody>
 </table>

  
</body>
</html>