<%@ page import="project.ConnectionProvider" %>
 <%@ page import="java.sql.*"%>
 
 <%@ include file="header.jsp" %> 
  <%@ include file="topbar.jsp" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Orders</title>
<style type="text/css">
.search-container {
  float: right;
}
table {
 
  width: 100%;
}
h3{
color:Black;
text-align:center;
}
thead{
background-color: red;
}
th, td {
  text-align: left;
  padding: 15px;
}

tr:nth-child(even) {background-color: #f2f333;}
</style>



</head>
<body>
<h3> My Orders</h3>
<div style="color: white; text-align: center; font-size: 30px;">My Orders <i class='fab fa-elementor'></i></div> 

<table cellpadding="15" cellspacing="5" border="5">
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">category</th>
            <th scope="col"><i class="fa fa-inr"></i>  Price</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th scope="col">Order Date</th>
            <th scope="col">Expected Delivery Date</th>
            <th scope="col">Status</th>  
          </tr>
        </thead>
        <%
        String email = session.getAttribute("email").toString();
        int total=0;
        int sno=0;

        try{
        	Connection con= ConnectionProvider.getCon();
        	 Statement st = con.createStatement();
        	 ResultSet rs1 = st.executeQuery("select * from cart inner join eproduct where cart.product_id=eproduct.product_id and cart.email='"+email+"' and cart.orderDate is not null");
        	 while(rs1.next())
        	 {
        	 sno=sno+1;
        %>
     		<tbody> 
          <tr>
            		<td> <%out.println(sno); %></td>
            		<td> <%=rs1.getString(17) %></td>
            		<td> <%=rs1.getString(19) %></td>
            		<td> <i class="fa fa-inr"> <%=rs1.getString(4) %></i>  </td>
           			<td><%=rs1.getString(3)%>  </td>
           		 	<td><i class="fa fa-inr"> <%=rs1.getString(5) %> </i> </td>
            		<td> <%=rs1.getString(11) %></td>
              		<td><%=rs1.getString(12) %></td>
               		<td><%=rs1.getString(15) %></td>
               		<%
        	 }
        }
        catch(Exception e)
        {
        	System.out.println(e);
        }
%>
            </tr>
           </tbody>
      </table>
      <br>
      <br>
      <br>


</body>
</html>