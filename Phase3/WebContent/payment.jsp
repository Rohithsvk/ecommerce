<%@ page import="project.ConnectionProvider" %>
 <%@ page import="java.sql.*"%>
 
 <%@ include file="header.jsp" %> 
  <%@ include file="topbar.jsp" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Page</title>
</head>
<body>
<%
String email = session.getAttribute("email").toString();
int total=0;
int sno=0;

try{
	Connection con= ConnectionProvider.getCon();
	 Statement st = con.createStatement();
	 ResultSet rs1 = st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
	 while(rs1.next())
	 {
		 total=rs1.getInt(1);
		
		 
	 }
	 %>
	 <table cellpadding="15" cellspacing="5" border="5">
	 <thead>

	          
	         </thead>
	         <thead>
	           <tr>
	           	<th scope="col">S.No</th>
	             <th scope="col">Product Name</th>
	             <th scope="col">Category</th>
	             <th scope="col"><i class="fa fa-inr"></i> price</th>
	             <th scope="col">Quantity</th>
	             <th scope="col">Sub Total</th>
	            
	           </tr>
	         </thead>
	         <tbody>
	         <%  
	       ResultSet rs=st.executeQuery("select * from eproduct inner join cart on eproduct.product_id=cart.product_id and cart.email='"+email+"' and cart.address is Null");
	        while(rs.next())
	        { 
	         %>
	          <tr>
	            <td> <%sno=sno+1; out.print(sno);%></td>
	             <td><%=rs.getString(2) %></td>
	              <td><%=rs.getString(3) %></td>
	             <td><i class="fa fa-inr  aria-hidden="true""></i><%=rs.getString(10) %> </td>
	             <td><a href="incAction.jsp?product_id=<%=rs.getString(1)%>&quantity=inc"><i class="button"> Increase</i></a> <%=rs.getString(9) %> <a href="incAction.jsp?product_id=<%=rs.getString(1)%>&quantity=dec"><i class="button">decrese</i></a></td>
	             <td><i class="fa fa-inr  aria-hidden="true""></i> <%=rs.getString(11) %></td>         
	           </tr>
	           
	            
	 		<%
	        }
	        %>
	        <tr>
	        <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"> <%out.println(total); %></i> </th>
	       <%if (total>0) {%>
	        <th scope="col"><a href="paymentAction.jsp">Proceed to order</a></th>
	        <%} %>
	      </tr>
 <%
}
catch(Exception e)
{

}

	 
%>
</body>
</html>