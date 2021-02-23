<%@ page import="project.ConnectionProvider" %>
 <%@ page import="java.sql.*"%>
 
 <%@ include file="header.jsp" %> 
  <%@ include file="topbar.jsp" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>My Cart</title>
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
	 
	 <h3> <a href="myCart.jsp"> <i class='fas fa-arrow-circle-left'>  Back </i> </a></h3>
	 <table cellpadding="15" cellspacing="5" border="5">
	 <h3> Items for checkOut</h3>
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
	             <td> <%=rs.getString(9) %> </td>
	             <td><i class="fa fa-inr  aria-hidden="true""></i> <%=rs.getString(11) %></td>         
	           </tr>        
	 		<%
	        }
	        %>
	         <tr>
	         <td> </td>
	         <td> </td>
	         <td> </td>
	         <td> </td>
	         <td> </td>
	        <th scope="col" style="background-color:yellow">Total: <i class="fa fa-inr"> <%out.println(total); %></i> </th>
	      </tr>
	      </tbody>
	      </table>
	      
	<!--  Form for Shipment -->
	
	      <form action="gateway.jsp" method="post"> 
	       <table cellpadding="15" cellspacing="5" border="5">
	       <tbody>
	         <h3 style="text-align:center;"> Add the details of Shipment</h3>
	        <tr>
 				<td width=50%>Mobile No.*</td>
 				<td><input name= mobile maxlength=10 type="number"size="47" required ></td>
 			</tr>
 			<tr>
 				<td width=50%>Address for Shipment*</td>
 				<td><input name=address maxlength=100  type="text" size="47" required></td>
 			</tr>
 			<tr>
 				<td width=50%>City*</td>
 				<td><input name="city" maxlength=100  type="text" size="47" required></td>
 			</tr>
 			<tr>
 				<td width=50%>State*</td>
 				<td><input name="state" maxlength=100  type="text" size="47" required></td>
 			</tr>
	         <tr>
	        <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"> <%out.println(total); %></i> </th>
	       <%if (total>0) {%>
	       <!-- <th scope="col"><a href="paymentAction.jsp">Proceed to Pay</a></th> --> 
	       <th> <input type="submit" style="width: 250px; height: 50px; background-color:#3CB371;"  value="Check Out" > </th>
	        <%} %>
	      </tr>
	        
	       
	       </tbody>
	       </table>
	       
	       </form>
 <%
 
}
catch(Exception e)
{

}

	 
%>
<%@ include file="footer.jsp" %> 
</body>
</html>