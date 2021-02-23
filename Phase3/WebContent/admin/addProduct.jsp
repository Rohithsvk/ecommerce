<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
</head>
<body>
<%  
 String email = session.getAttribute("email").toString();
 if(session.getAttribute("email")== null)
{
	response.sendRedirect("userLogin.jsp");
}
 %>
<center>
<h1> Add New Product in the Store</h1>
</center>
<form action="addProductAction.jsp" method="post">

<h3>
 Product ID:: <input type="text" name="product_id" required>
Product Name::<input type="text" name="product" required>  <br> <br>
Product Details::<input type="text" name="product_details" required>  
Product Category<input type="text" name="category" required> 
Product Price:<input type="text" name="price" required> <br> <br> 
Status:<select type="text" name="active" required>
<option value="yes"> yes</option>
<option value="no"> No</option>
</select>
<br> <br>

<input type="submit" Value="add new Product"> 
</h3>

<% 
String msg= request.getParameter("msg");
if("done".equals(msg))
{
%>
<h2> Product added Sucessfully  </h2>
<%}
if("wrong".equals(msg))
{
%>
<h2> Something went wrong</h2>
<%} %> 


</form>

</body>
</html>