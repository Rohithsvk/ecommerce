 <%@ include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change PassWord</title>

<style>
h2{
text-align:center;
}
h4{
text-align:center;
color:red;
}

input[type=text], input[type=password],select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}
p{
text-size:25px;
font-weight: bold;
}
.container {
	 margin-left: 20%;
    margin-right: 20%;
  margin-top:10px;
  border: 1px solid blue;
  box-sizing: border-box;
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

/* width */
::-webkit-scrollbar {
  width: 10px;
}

/* Track */
::-webkit-scrollbar-track {
  background: #f1f1f1; 
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: #888; 
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #555; 
}
</style>
</head>

<%  if(session.getAttribute("email")== null)
{
	response.sendRedirect("Home.jsp");
}
 %>
 
<body>
<jsp:include page="topbar.jsp" ></jsp:include>
<div class="container">
<h2> Change Password:</h2>
<%
String msg= request.getParameter("msg");
if("notMatch".equals(msg))
{
%>
<h4> New Password and confirm Password doesnt match</h4>
<%   
}
if("wrong".equals(msg))
{
	%>
	<h4>your old password is wrong </h4>
	<%  } %>
	<% 
	if("done".equals(msg))
{
	%>
	<h4> sucessfully changed </h4>
	<%  } %>
	<%
	if("invalid".equals(msg))
{
	%>
	<h4> Something Went Wrong</h4>
	<%  } %>
<form action="changePasswordAction.jsp" method="post">
<p>
Enter Old Password:: <input type="password" name="oldpassword"  required> <br> <br>
Enter New Password::<input type="password" name="newpassword"  required>	<br> <br>
Confirm Password::<input type="text" name="conpassword"  required>	<br> <br>
<input type="submit"  value="save">

</p>
</form>	
</div>
 <jsp:include page="footer.jsp" ></jsp:include>
</body>
</html>