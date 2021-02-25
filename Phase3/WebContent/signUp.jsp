<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ include file="header.jsp" %>    
  <%@ include file="topbar.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>

<style>
body {
  font-family: Arial;
}

input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: block;
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

div.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>

</head>
<body>

<div class="container">
<h3> Sign up Form</h3>
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
 			<a href="userLogin.jsp">Already a member? Login</a>
 		</td>
 	</tr>
 </table>
</form>
</div>
</body>
</html>