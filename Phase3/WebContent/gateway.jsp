<%@ page import="project.ConnectionProvider" %>
 <%@ page import="java.sql.*"%>
 
 <%@ include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
								if(window.history.forward(1) !=null)
									window.history.forward(1);

</script>
</head>
<body>
<%
String email= session.getAttribute("email").toString();
 String mobile= request.getParameter("mobile").toString();
String address= request.getParameter("address").toString();
String city= request.getParameter("city").toString();
String state= request.getParameter("state").toString();
String status= "bill";

try
{
	Connection con= ConnectionProvider.getCon();
	// PreparedStatement ps1=con.prepareStatement("update cart set address=?,city=?,state=?,county=?,mobileNumber=?,orderDate=now(),deliveryDate=DATE_ADD(orderDate,INTERVAL 5 DAY),paymentMethod=?,transctionId=?, status=? where email=? and address is NULL");
	
	 PreparedStatement ps1=con.prepareStatement("update cart set address=?,city=?,state=?,mobileNumber=?,orderDate=now(),deliveryDate=DATE_ADD(orderDate,INTERVAL 5 DAY), status=? where email=? and address is NULL");
	
	ps1.setString(1,address);
	 ps1.setString(2,city);
	 ps1.setString(3,state);
	 ps1.setString(4,mobile);
	 ps1.setString(5,status);
	 ps1.setString(6, email);
	 ps1.executeUpdate();
	 response.sendRedirect("bill.jsp");
	 
	 
}

catch(Exception e)
{
	System.out.println(e);
}

%>


</body>
</html>