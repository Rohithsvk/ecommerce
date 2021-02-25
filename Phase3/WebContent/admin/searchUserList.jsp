<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="adminHeader.jsp" ></jsp:include>
<jsp:include page="AdminTopBar.jsp" ></jsp:include>
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
 ResultSet rs = st.executeQuery("select * from users where name like '%"+ search+"%' or  email like '%"+ search+"%'");
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
 			<td><%=rs.getString(6)%></td>
 			<td><%=rs.getString(7)%></td>
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
 <jsp:include page="../footer.jsp" ></jsp:include>
</body>
</html>