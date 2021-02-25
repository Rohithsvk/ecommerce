<%@ page import="project.ConnectionProvider" %>
 <%@ page import="java.sql.*"%>
 
 <%@ include file="header.jsp" %> 
  <%@ include file="topbar.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>My Cart</title>
<style>
h1{
text-align:center;
}
h3
{
	color: blue;
	text-align: center;
}

table {
 
  width: 100%;
}
h2{
color:green;
text-align:center;
}
h3{
text-align:center;
}
thead{
background-color: red;
}
th, td {
  text-align: left;
  padding: 15px;
}

tr:nth-child(even) {background-color:#86b300;}


</style>
</head>
<body>
<br>
<div style="color:Blue; text-align: center; font-size: 30px; font-weight: Bold"> My Cart </div>
<br>
<%String msg= request.getParameter("msg");
if ("notPossible".equals(msg))
{
%>
<h3 >There is only one Quantity! So click on remove!</h3>
<%
} 
if("inc".equals(msg))
{
%>
<h3>Quantity  Increased Successfully!</h3>
<%
}
if("dec".equals(msg))
{
%>
<h3>Quantity  Decreased Successfully!</h3>
<%
}
if("removed".equals(msg))
{
%>
<h3 class="alert">Product Successfully Removed!</h3>
<%} %>

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
            <th scope="col">Remove <i class="fa fa-trash"></i></th>
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
            <td> <a href="incAction.jsp?product_id=<%=rs.getString(1)%>&quantity=dec"><i class="fa fa-minus-circle" style="font-size:18px"> </i></a> <%=rs.getString(9)%> <a href="incAction.jsp?product_id=<%=rs.getString(1)%>&quantity=inc"><i class="fa fa-plus-circle" style="font-size:18px"></i></a></td>
            <td><i class="fa fa-inr  aria-hidden="true""></i> <%=rs.getString(11) %></td>
            <td><a href="removeFromCart.jsp?product_id=<%=rs.getString(1)%>"> <i class="fa fa-trash"  aria-hidden="true""></i></a></td>
          </tr>
          
           
		<%
       }
       %>
       <tr>
       <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"> <%out.println(total); %></i> </th>
      <%if (total>0) {%>
       <th scope="col"><a href="payment.jsp">Proceed to order</a></th>
       <%} %>
     </tr>
    <% 
     }
catch(Exception e)
{
	System.out.println(e);
}
		%>
        </tbody>
      </table>
      <br>
      <br>
      <br>
<%@ include file="footer.jsp" %> 
</body>
</html>