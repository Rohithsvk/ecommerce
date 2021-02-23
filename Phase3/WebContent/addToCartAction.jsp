<%@ page import="project.ConnectionProvider" %>
 <%@ page import="java.sql.*"%>
 <html>
<body>  
 <%  
 if(session.getAttribute("email")== null)
{
	 response.setContentType("text/html"); 
	 out.print("<h3> You have to login to access the cart </h3>"); 
     RequestDispatcher rd = request.getRequestDispatcher("userLogin.jsp"); 
  
 		rd.include(request, response);   
	 //response.sendRedirect("userLogin.jsp");
}
 else
 {
	 String email = session.getAttribute("email").toString();
	 String product_id= request.getParameter("product_id");
	 
	 if(session.getAttribute("email")== null)
	{
		response.sendRedirect("userLogin.jsp");
	}
	 %>
	 <%
	 int quantity=1;
	 int product_price=0;
	int product_total=0;
	int cart_total=0;
	int z=0;

	try{
		
		Connection con= ConnectionProvider.getCon();
		 Statement st = con.createStatement();
		 ResultSet rs = st.executeQuery("select * from eproduct where product_id='"+product_id+"'");
		 while(rs.next())
		 {
			 product_price=rs.getInt(5);
			 product_total=product_price;
			 
		 }
		 ResultSet rs1 = st.executeQuery("select * from cart where product_id='"+product_id+"' and email='"+email +"' and address is NULL");
		 while(rs1.next())
		 {
			 cart_total=rs1.getInt(5);
			 cart_total= cart_total+ product_total;
			 quantity=rs1.getInt(3);
			 quantity= quantity+1;
			 z=1;
		 }
		 if(z==1)
		 {
			 st.executeUpdate("update cart set total='"+cart_total+"',quantity='"+quantity+"'where product_id="+product_id+" and email='"+email+"' and address is NULL");
			 response.sendRedirect("Home.jsp?msg=exist");
			 
		 }
		 if(z==0)
		 {
			 PreparedStatement ps= con.prepareStatement("insert into cart(email,product_id,quantity,price,total) values(?,?,?,?,? )");
			 ps.setString(1,email);
			 ps.setString(2,product_id);
			 ps.setInt(3,quantity);
			 ps.setInt(4,product_price);
			 ps.setInt(5,product_total);
			 ps.executeUpdate();
			 response.sendRedirect("Home.jsp?msg=added");
			 
			 
		 }
		
	}
	catch (Exception e)
	{
		System.out.println(e);
			 response.sendRedirect("Home.jsp?msg=invalid");
	}
 }
%>

 </body> 
 </html>