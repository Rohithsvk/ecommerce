<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*"%> 
<%@ include file="header.jsp" %> 


<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<title>Bill</title>

<script type = "text/javascript" >
function preventBack(){window.history.forward();}
 setTimeout("preventBack()", 0);
 window.onunload=function(){null};
</script>
</head>
<body>

<%
String email = session.getAttribute("email").toString();
int total=0;
int sno=0;

try{
	Connection con= ConnectionProvider.getCon();
	 Statement st = con.createStatement();
	 ResultSet rs1 = st.executeQuery("select sum(total) from cart where email='"+email+"' and status='bill'");
	 while(rs1.next())
	 {
		 total=rs1.getInt(1); 
	 }
	 ResultSet rs2 = st.executeQuery("select * from users inner join cart where cart.email='"+email+"' and cart.status='bill'");
	 while(rs2.next())
	 {
%>
<h3> Sporty Shoes InVoice</h3>
<hr>
<div class="left-div"><h3>Name: <%=rs2.getString(1) %>  </h3></div>
<div class="right-div-right"><h3>Email: <%=rs2.getString(6) %>  </h3></div>
<div class="right-div"><h3>Mobile Number: <%=rs2.getString(17) %>  </h3></div>  

<div class="left-div"><h3>Order Date: <%=rs2.getString(18) %>  </h3></div>

<div class="right-div"><h3>Expected Delivery: <%=rs2.getString(19) %>  </h3></div> 

<div class="left-div"><h3>Transaction Id:  </h3></div>
<div class="right-div-right"><h3>City: <%=rs2.getString(14) %>  </h3></div> 
<div class="right-div"><h3>Address: <%=rs2.getString(13) %>  </h3></div> 
<div class="left-div"><h3>State: <%=rs2.getString(15) %>  </h3></div>
<hr>	
	<br>	
<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>category</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
  <%
  ResultSet rs = st.executeQuery("select * from cart inner join eproduct where cart.product_id=eproduct.product_id and cart.email='"+email+"' and cart.status='bill'");
	 while(rs.next())
	 {
		 sno=sno+1;
		 %>
		 <tr>
		 	<td> <%out.println(sno); %></td>
		 	<td> <%=rs.getString(17) %></td>
		 	<td> <%=rs.getString(18) %> </td>
		 	<td> <%=rs.getString(20) %></td>
		 	<td> <%=rs.getString(3) %></td>
		 	<td> <%=rs.getString(5) %></td>
		 </tr>
		 
	<%
	 }
  %>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
     <td></td>
  </tr>
  <tr>
  
</table>
<h3>Total:<%out.println(total); %> </h3>
<a href="confirm.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>
<% 
	 }
	 
}
catch(Exception e)
{
	System.out.println(e);
}


%>

<%@ include file="footer.jsp" %> 
</body>
</html>