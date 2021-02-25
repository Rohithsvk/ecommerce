 <%@ page import="project.ConnectionProvider" %>
 <%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {

  float: right;
}

li a, .dropbtn {
  display: inline-block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
  background-color: green;
}

li.dropdown {
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {background-color: #f1f1f1;}

.dropdown:hover .dropdown-content {
  display: block;
}
.user{
float:left
color:red;
}
</style>
</head>
<body>
<ul>


<% if (session.getAttribute("email") == null ) { %>
	  
 <li> <a href="Home.jsp"> Home</a>
<li>	<a href="userLogin.jsp">Login/Signup</a> </li>
<li style="float:left"> <a> Welcome Guest </a> </li>

<% }  else { %>

 	<li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn"> My Account</a>
    <div class="dropdown-content">
    	<a href="myOrders.jsp"> My Orders</a>
      <a href="editProfile.jsp"> Edit Profile</a>
      <a href="changePassword.jsp"> Change Password</a>
      <a href="logout.jsp"> Logout</a>
    </div>
  </li>
 
  	<li><a href="myCart.jsp"> My Cart</a></li>
  	<li><a href="Home.jsp">Home</a></li>
  	<li style="float:left"> <a> welcome ${email}  </a>  </li>
  	
  	
  	
  	<% }  %>
</ul>
 

</body>
</html>
    