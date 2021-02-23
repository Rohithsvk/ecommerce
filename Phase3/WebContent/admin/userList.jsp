<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UserList</title>
</head>
<body>
<h2> List of users Who are registered with Sporty Shoes </h2> 
 <h3 >
 <form action="searchUserList.jsp" method="post">
<input type="search" name="search" placeHolder="search Items" >
<input type="submit" value="search">
 </h3>
<table cellpadding="15" cellspacing="5" border="5">
 <thead>
 <tr>
 <th> Name</th>
 <th> gender</th>
 <th> age</th>
 <th> mobile</th>
 <th> country </th> 
 <th> email </th>
 <th> password </th>
 </tr>
 </thead>
 
 <tbody>
 
 <%@ page import="project.ConnectionProvider" %>s
 <%@ page import="java.sql.*"%>
 <% try {
 Connection con = ConnectionProvider.getCon();
 Statement st = con.createStatement();
 ResultSet rs = st.executeQuery("select * from users");
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
 			<td><%=rs.getString(7)%></td>
 			
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