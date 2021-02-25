<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>     
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Admin Login</title>
<style>
h2{
text-align:center;
}
form {
  border: 3px solid #f1f1f1;

}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}
/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

/* Add a hover effect for buttons */
button:hover {
  opacity: 0.8;
}
.center {
  margin-left: auto;
  margin-right: auto;
}
</style>
</head>
<body>
<jsp:include page="adminHeader.jsp" ></jsp:include>


<h2 style="text-align:center">
 Admin Login</h2>
 
 <%
String msg= request.getParameter("msg");
if("notexist".equals(msg))
{
%>
<h3>You are not registered  </h3>
<%}
if("invalid".equals(msg))
{
%>
<h3> password or Email is wrong </h3>
<%} %>
<form name=frmLogin action="adminLoginAction.jsp" method="post">
 <table border=1 cellspacing=2 cellpadding=5 class="center">
 	<tr>
 		<td width=25%>Admin id*</td>
 		<td><input name=admin maxlength=20 type="text"></td>
 	</tr>
 	<tr>
 		<td width=25%>Admin Password*</td>
 		<td><input name="password" maxlength=10 type="password"></td>
 	</tr>
 	<tr>
 		<td colspan=2>
 			<button>Login</button>
 		</td>
 	</tr>
 </table>
</form>
 <jsp:include page="../footer.jsp" ></jsp:include>
</body>
</html>