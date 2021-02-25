 <%@ page import="project.ConnectionProvider" %>
  	  <%@ page import="java.sql.*"%>
  	   
  <%  if(session.getAttribute("email")== null)
{
	response.sendRedirect("1.jsp");
}
 %>	  
 <% 
 String email= session.getAttribute("email").toString();
  	String fname =request.getParameter("fname");
  	String gender=request.getParameter("gender");
 	String mobile=request.getParameter("mobile");
 	String country=request.getParameter("country");
 	
  	
  	
  	try{
  		Connection con = ConnectionProvider.getCon();
  	  		Statement st = 	con.createStatement();
  	  		st.executeUpdate("update users set name='"+fname+"',gender='"+gender+"',mobile='"+mobile+"',country='"+country+"' where email='"+email+"'");
  	  		
  	  		response.sendRedirect("editProfile.jsp?msg=done");
  	}
  	catch (Exception e)
  	{
  	System.out.println(e);
	response.sendRedirect("editProfile.jsp?msg=wrong");
  	}
  	
  	
  	  %>