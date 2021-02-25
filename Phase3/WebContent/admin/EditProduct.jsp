<%@ page import="project.ConnectionProvider" %>
 <%@ page import="java.sql.*"%>
 
 <jsp:include page="adminHeader.jsp" ></jsp:include>
<jsp:include page="AdminTopBar.jsp" ></jsp:include>
 <center>  <h1>  Edit the product </h1> </center>

 
 <%
 String product_id= request.getParameter("product_id");
 try{
	 Connection con = ConnectionProvider.getCon();
	 Statement st = con.createStatement();
	 ResultSet rs = st.executeQuery("select * from eproduct where product_id='"+product_id+"'");
	 while(rs.next())
	 {
	%>	
<form action="editProductAction.jsp" method="post">
<h3>	
<input type="hidden" name="product_id" value="<%=rs.getString(1) %>" required>
Product Name::<input 
						type="text" 
						name="product_name" 
						value="<%=rs.getString(2) %>" 
						required>  <br> <br>
						
Product Details::<input 
						type="text"  
						name="product_details" 
						value="<%=rs.getString(3) %>" 
						required>  
Product Category::<input 
						type="text"  
						name="category" 
						value="<%=rs.getString(4) %>"
						 required> 
Product Price:<input 
						type="text" 
						name="price" 
						value="<%=rs.getString(5) %>" 
						required> <br> <br>
						 
Status:<select 
						type="text" 
						 name="active"
						  value="<%=rs.getString(6) %>" 
						  required>
				<option value="yes"> yes</option>
				<option value="no"> No</option>
</select>
<br> <br>

<input type="submit" Value="Save the Changest"> 
</h3>
</form>		
<% 	 
	 }
 }
 
 catch(Exception e)
 {
	 System.out.println(e);
 }
 %>
  <jsp:include page="../footer.jsp" ></jsp:include>