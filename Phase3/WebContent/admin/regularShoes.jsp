<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Regular Shoes</title>
<style>
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
<jsp:include page="adminHeader.jsp" ></jsp:include>
<jsp:include page="AdminTopBar.jsp" ></jsp:include>
<%@ page import="project.ConnectionProvider" %>
 <%@ page import="java.sql.*"%>
 
 <% String category= request.getParameter("Category").toString(); %>
 <table cellpadding="15" cellspacing="5" border="5">
 <thead>
 <tr>
 <th> Product ID</th>
 <th> Product Name</th>
 <th> Product Details</th>
 <th> Category </th> 
 <th> Price </th>
 <th> Active </th>
 <th> Action Performed </th>
 </tr>
 </thead>
 
 <tbody>
 <% try {
 Connection con = ConnectionProvider.getCon();
 Statement st = con.createStatement();
 ResultSet rs = st.executeQuery("select * from eproduct where Category='"+category+"'");
 while(rs.next())
 {
 %>

 		<tr>
 			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
 			<td><%=rs.getString(3)%></td>
 			<td><%=rs.getString(4)%></td>
 			<td><%=rs.getString(5)%></td>
 			<td><%=rs.getString(6)%></td>
 			
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
 <jsp:include page="/footer.jsp" ></jsp:include>

</body>
</html>