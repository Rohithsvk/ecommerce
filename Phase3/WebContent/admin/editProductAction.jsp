<%@ page import="project.ConnectionProvider" %>
 <%@ page import="java.sql.*"%>
 
 <%
String product_id = request.getParameter("product_id");
String product_name = request.getParameter("product_name");
String product_details = request.getParameter("product_details");
String category = request.getParameter("category");
String price = request.getParameter("price");
String active = request.getParameter("active");


try{
	
	Connection con= ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("Update eproduct set product_name='"+product_name+"', product_details='"+product_details+"', Category='"+category+"',price='"+price+"',status='"+active+"' where product_id='"+product_id+"'");
//	if(active.equals("no"))
//	{
//		st.executeUpdate("delete from cart where product_id='"+product_id+"' and address is NULL");
//	}
	response.sendRedirect("allProductList.jsp?msg=done");
	
}

catch(Exception e)
{
	response.sendRedirect("allProductList.jsp?msg=wrong");
}

%>
 