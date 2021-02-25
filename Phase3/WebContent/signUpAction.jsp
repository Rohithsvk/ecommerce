<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String age = request.getParameter("age");
String country = request.getParameter("country");
String mobile = request.getParameter("mobile");
String email = request.getParameter("email");
String pwd = request.getParameter("pwd");

try{
	
	Connection con= ConnectionProvider.getCon();
	PreparedStatement ps= con.prepareStatement("insert into users values(?,?,?,?,?,?,?)");
	ps.setString(1,name);
	ps.setString(2,gender);
	ps.setString(3,age);
	ps.setString(4,mobile);
	ps.setString(5,country);
	ps.setString(6,email);
	ps.setString(7,pwd);
	ps.executeUpdate();
	session.setAttribute("email",email);
	response.sendRedirect("signUpConfirmation.jsp?msg=done");
	
}

catch(Exception e)
{
	response.sendRedirect("signUp.jsp?msg=wrong");
}
 
%>
