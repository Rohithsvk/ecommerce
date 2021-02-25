
 <%@ page import="project.ConnectionProvider" %>
  	  <%@ page import="java.sql.*"%>
 <%   String admin=request.getParameter("admin");
 String password=request.getParameter("password");
 	int z=0;
	 try
	 {
		 	Connection con = ConnectionProvider.getCon();
	  		Statement st = 	con.createStatement();
	  		ResultSet rs= st.executeQuery("select * from admin where admin='"+admin+"' and password='"+password+"'");
	  		while(rs.next())
	  		{
	  			z=1;
	  			 session.setAttribute("admin",admin);
	  			 response.sendRedirect("adminHome.jsp");
	  			
	  		}
	  		if(z==0)
	  		{
	  			 response.sendRedirect("adminLogin.jsp?msg=notexist");
	 		}
	 }
	 catch(Exception e)
	 {
		 
		 System.out.println(e);
		 response.sendRedirect("adminLogin.jsp?msg=invalid");
		
	 }
 
 %> 	  