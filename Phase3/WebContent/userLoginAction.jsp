
 <%@ page import="project.ConnectionProvider" %>
  	  <%@ page import="java.sql.*"%>
 <%  
	String email=request.getParameter("email");
 String password=request.getParameter("pwd");
 int z=0;
	 try
	 {
		 	Connection con = ConnectionProvider.getCon();
	  		Statement st = 	con.createStatement();
	  		ResultSet rs= st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
	  		while(rs.next())
	  		{
	  				 z=1;
	  			 session.setAttribute("email",email);
	  			 response.sendRedirect("Home.jsp");
	  			
	  		}
	  		
	  		{
	  			 response.sendRedirect("userLogin.jsp?msg=notexist");
	 		}
	 }
	 catch(Exception e)
	 {
		 
		 System.out.println(e);
		// response.sendRedirect("userLogin.jsp?msg=invalid");
		
	 }
 
 %> 	  