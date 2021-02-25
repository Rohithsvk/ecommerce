<%@ page import="project.ConnectionProvider" %>
 <%@ page import="java.sql.*"%>
 <jsp:include page="adminHeader.jsp" ></jsp:include>
<jsp:include page="AdminTopBar.jsp" ></jsp:include>
 <% 
 
 String id =request.getParameter("product_id");
 String email= request.getParameter("email");
 String status="cancel";
 
 try{
	 Connection con=ConnectionProvider.getCon();
 	Statement st =con.createStatement();
 	 st.executeUpdate(" update cart set  status='"+status+"' where  product_id='"+id+"' and email='"+email+"' and address is not NULL");
 	response.sendRedirect( "ordersReceived.jsp?msg=cancel");
 }
 catch (Exception e)
 {
	 System.out.println(e);
	 response.sendRedirect( "ordersReceived.jsp?msg=wrong");
 }
 
 %>