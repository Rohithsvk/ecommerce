<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>

<form action="signUpAction.jsp" method="post">
 <table border=1 cellspacing=2 cellpadding=4>
 	
 	<tr>
 		<td width=25%> Name*</td>
 		<td><input name=name maxlength=25 ></td>
 	</tr>
 	<tr>
 		<td width=25%>Gender*</td>
 		<td><input name=gender maxlength=25 ></td>
 	</tr>
 	<tr>
 		<td width=25%>Age*</td>
 		<td><input name=age maxlength=3 type="number" ></td>
 	</tr>
 	<tr>
 		<td width=25%>Country</td>
 		<td><input name=country maxlength=100 ></td>
 	</tr>
 	
 	<tr>
 		<td width=25%>Mobile No.</td>
 		<td><input name=mobile  maxlength=10 ></td>
 	<tr>
 	<tr>
 		<td width=25%>Email id*</td>
 		<td><input name=email type="email" maxlength=50></td>
 	</tr>
 	<tr>
 		<td width=25%>Password*</td>
 		<td><input name=pwd maxlength=10 type="password"></td>
 	</tr>
 	
 		<td colspan=2>
 			<button>Signup</button><br>
 			<a href="login">Already a member? Login</a>
 		</td>
 	</tr>
 </table>
</form>
</body>
</html>