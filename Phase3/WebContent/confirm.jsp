<%@ page import="project.ConnectionProvider" %>
 <%@ page import="java.sql.*"%>
 
 <%@ include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%
String email= session.getAttribute("email").toString();
String status= "processing";

try
{
	Connection con= ConnectionProvider.getCon();
	// PreparedStatement ps1=con.prepareStatement("update cart set address=?,city=?,state=?,county=?,mobileNumber=?,orderDate=now(),deliveryDate=DATE_ADD(orderDate,INTERVAL 5 DAY),paymentMethod=?,transctionId=?, status=? where email=? and address is NULL");
	
	 PreparedStatement ps1=con.prepareStatement("update cart set status=? where email=? and status='bill'");
	
	ps1.setString(1,status);
	 ps1.setString(2, email);
	 ps1.executeUpdate();
	 response.sendRedirect("Home.jsp?msg=sucess");
	 
	 
}

catch(Exception e)
{
	System.out.println(e);
}

%>
    