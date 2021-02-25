<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
<style>
h1{
text-align:center;
}

input[type=text], select {
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

div {
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
<body>
<jsp:include page="adminHeader.jsp" ></jsp:include>
<jsp:include page="AdminTopBar.jsp" ></jsp:include>
<%  

 if(session.getAttribute("admin")== null)
{
	response.sendRedirect("adminLogin.jsp");
}
 else
 {
	 String email = session.getAttribute("admin").toString();
 %>

<h1> Add New Product in the Store</h1>

<div>
<form class="center" action="addProductAction.jsp" method="post">

<h3>
 Product ID:: <input type="text" name="product_id" required> <br>
Product Name::<input type="text" name="product" required>  
Product Details::<input type="text" name="product_details" required>  
Product Category<input type="text" name="category" required> 
Product Price:<input type="text" name="price" required> 
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
<%} 

}%> 


</form>
 </div>
 <%@ include file="../footer.jsp" %>

</body>
</html>