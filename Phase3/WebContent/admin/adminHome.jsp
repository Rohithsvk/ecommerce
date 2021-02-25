<jsp:include page="adminHeader.jsp" ></jsp:include>
<jsp:include page="AdminTopBar.jsp" ></jsp:include>

<%  if(session.getAttribute("admin")== null)
{
	response.sendRedirect("adminLogin.jsp");
}
else
{
 %>
<h1 > Welcome Admin</h1>

<% } %>
 <jsp:include page="../footer.jsp" ></jsp:include>