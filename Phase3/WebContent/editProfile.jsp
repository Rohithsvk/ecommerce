 <%@ page import="project.ConnectionProvider" %>
  	  <%@ page import="java.sql.*"%>
  	  <%@ include file="header.jsp" %>
  	  <%@ include file="topbar.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Edit Profile </title>
<style>

h2{
text-align:center;
color:Blue;
}
h3{
text-align:center;
color:red;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
 
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  width:100%;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
	margin-left:20%;
	margin-right:20%;
	margin-bottom:5%;
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  font-weight: bold;
}

</style>


</head>
<body>

<%  if(session.getAttribute("email")== null)
{
	response.sendRedirect("Home.jsp");
} 
else
{
 %>


<h4><a class="back" href="Home.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h4>
<% String email= session.getAttribute("email").toString();
 String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert"> Successfully Updated!</h3>
<%} %>
<% if("wrong".equals(msg))
{ %>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%} %>
<%
try{
		Connection con = ConnectionProvider.getCon();
  		Statement st = 	con.createStatement();
  		ResultSet rs= st.executeQuery("select * from users where email='"+ email+"'");
  		while(rs.next())
  		{
%>
<h2> Edit Your Profile</h2>
<div class="container">
<form action="editProfileAction.jsp" method="post">

					<input type="hidden" name="id" value="<%out.println(email); %>">

First Name:: 		<input type="text" name="fname" value="<%=rs.getString(1) %>" > 
Gender::			<input type="text" name="gender" value="<%=rs.getString(2) %>" >
Age::				<input type="text" name="age" value="<%=rs.getString(3) %>" > 
Mobile ::			<input type="text" name="mobile" value="<%=rs.getString(4) %>"maxlength="10" pattern="[123456789][0-9]{9}">
Country::			<input type="text" name="country" value="<%=rs.getString(5) %>">
					<input type="submit" value="update">

 </form>
 </div>
 <%
		}
	}
  		
 
 catch(Exception e)
 {
 System.out.println(e);
 }
}
 %>
</body>
</html>