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
	width:11.11%;
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
  background-color: red;
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
</style>
</head>
<body>
<ul>
  
  	 <li><a href="../logout.jsp">LogOut</a></li>
 	 <li><a href="changePassword.jsp"> Change Password</a></li>
   	<li><a href="userList.jsp"> UserList</a></li>
  
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">Orders</a>
    <div class="dropdown-content">
      <a href="ordersReceived.jsp">Pending Orders</a>
      <a href="cancelOrders.jsp"> Cancelled Orders</a>
      <a href="deliveredOrders.jsp"> Delivered Orders</a>
    </div>
  </li>
  
  
   <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn"> Purchase History</a>
    <div class="dropdown-content">
      <a href="filterCategory.jsp"> Sort by Category</a>
      <a href="filter.jsp"> Sort by delivery date</a>
    </div>
  </li>
  
 	<li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn"> All Products List</a>
    <div class="dropdown-content">
      <a href="allProductList.jsp">  All products</a>
      <a href="regularShoes.jsp?Category=sports"> Sport Shoes</a>
      <a href="regularShoes.jsp?Category=Brogues"> Brogues Shoes</a>
      <a href="regularShoes.jsp?Category=Loafers"> Loafers Shoes</a>
      <a href="regularShoes.jsp?Category=Sneakers"> Sneakers Shoes</a>
      <a href="regularShoes.jsp?Category=Dress"> Dress Shoes</a> 
    </div>
  </li>
  
  
  
 
    <li><a href="allProductList.jsp"> All Products</a></li>
  	<li><a href="addProduct.jsp"> Add  New Product</a></li>
  	<li><a href="adminHome.jsp">Home</a></li>
</ul>


</body>
</html>
    