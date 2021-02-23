<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page isELIgnored="false" %>


<a href="Home.jsp">Home</a> | 
<% if (session.getAttribute("email") == null ) { %>
	<a href="userLogin.jsp">Login/Signup</a> | 
<% }  else { %>
	<a href="dashboard">Dashboard</a> | 
	<a href="myCart.jsp">Cart</a> | 
	<a href="logout.jsp">Logout</a>
	<br>
	<a href="editprofile.jsp">Edit Profile</a> | 
	<a href="memberpurchases.jsp">Your Orders</a> 

<% }  %>
