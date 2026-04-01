<%
if(session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
}
%>
<%
String role = (String) session.getAttribute("role");

if(role == null || !role.equals("admin")) {
    response.sendRedirect("login.jsp");
}
%>
<link rel="stylesheet" href="css/style.css">

<div class="container">
<h2>Admin Dashboard</h2>

<a href="manageLeaves.jsp">Manage Leaves</a><br><br>
<a href="viewLeaves.jsp">View All Leaves</a>
</div>