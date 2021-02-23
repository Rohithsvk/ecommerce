<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
</head>
<body>
<%
String msg= request.getParameter("msg");
if("notexist".equals(msg))
{
%>
<h2>You are not registed  </h2>
<%}
if("wrong".equals(msg))
{
%>
<h2> password or Email is wrong </h2>
<%} %>

<form action="userLoginAction.jsp" method="post">
<table border=1 cellspacing=2 cellpadding=4>
 	<tr>
 		<td width=25%>Email id*</td>
 		<td><input name=email maxlength=50></td>
 	</tr>
 	<tr>
 		<td width=25%>Password*</td>
 		<td><input name=pwd maxlength=10 type="password"></td>
 	</tr>
 	<tr>
 		<td colspan=2>
 			<button>Login</button><br>
 			<a href="signup">Not a member? Signup</a>
 		</td>
 	</tr>
 </table>
</form>
</body>
</html>