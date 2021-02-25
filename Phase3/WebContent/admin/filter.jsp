<%@ page import="project.ConnectionProvider" %>
 <%@ page import="java.sql.*"%>
<jsp:include page="adminHeader.jsp" ></jsp:include>
<jsp:include page="AdminTopBar.jsp" ></jsp:include> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<title>Home</title>
<style>
table {
 
  width: 100%;
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

tr:nth-child(even) {background-color: #f2f333;}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Orders Received <i class="fas fa-archive"></i></div>



  <h1>
<form action="filter.jsp">  Enter delivery Date: <input type="text" name="dd" placeholder="yyyy-mm-dd"> 
<input type="submit" value="search"> </form>
</h1>

<% 
String dd= request.getParameter("dd");
String msg= request.getParameter("msg");
if("cancel".equals(msg))
{
	%>
	<h3 class="alert">Order Cancel Successfully!</h3>
	<% 
}
if("delivered".equals(msg))
{
%>
<h3 class="alert">Successfully Updated!</h3>
	<%
}
if("invalid".equals(msg))
{
	%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<% 
}
%>

<table  cellpadding="15" cellspacing="5" border="5" id="customers">
         <thead>
          <tr>
          <th>Mobile Number</th>
          	<th> product ID </th>
            <th scope="col">Product Name</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">Status</th>
              <th scope="col">Cancel order <i class='fas fa-window-close'></i></th>
              <th scope="col">Order Delivered <i class='fas fa-dolly'></i></i></th>
          </tr>
          </thead>
        <%
        int sno=0;
        try{
        	Connection con=ConnectionProvider.getCon();
        	Statement st =con.createStatement();
        	ResultSet rs= st.executeQuery(" select * from cart inner join eproduct where cart.deliveryDate like '"+dd+"%' and cart.orderDate is not null and cart.status='processing'");
        	while(rs.next())
        	{
        		sno=sno+1;
        %>
       
          <tr>
         	 <td> <%=rs.getString(10) %></td>
         	 <td> <%=rs.getString(16) %> </td>
            <td> <%=rs.getString(17) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"><%=rs.getString(5) %></i>  </td>
                <td><%=rs.getString(6) %></td>
               <td><%=rs.getString(7) %></td>
                <td><%=rs.getString(8) %></td>
                 <td><%=rs.getString(11) %></td>
             <td><%=rs.getString(12) %></td>
              <td> ONLINE</td>
               
               <td><%=rs.getString(15) %></td>
               <td><a href="cancelOrderAction.jsp?product_id=<%=rs.getString(2)%>&email=<%=rs.getString(1) %>">Cancel <i class='fas fa-window-close'></i></a> </td>
                <td><a href="deliveryOrderAction.jsp?product_id=<%=rs.getString(2)%>&email=<%=rs.getString(1) %>">Delivered <i class='fas fa-dolly'></i></a></td>
            </tr>
             		<%
        	 }
        }
        catch(Exception e)
        {
        	System.out.println(e);
        }
%>
         
        </table>
      <br>
      <br>
      <br>
 <jsp:include page="../footer.jsp" ></jsp:include>
</body>
</html>