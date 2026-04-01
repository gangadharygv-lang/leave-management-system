<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

if(session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
    return;
}

String role = (String) session.getAttribute("role");

if(role == null || !role.equals("admin")) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<%

if(role == null || !role.equals("admin")) {
    response.sendRedirect("login.jsp");
}
%>
<link rel="stylesheet" href="css/style.css">

<div class="container">
<h2>Admin Dashboard</h2><br>
<a href="LogoutServlet">
    <button style="background:red; color:white;">Logout</button>
</a>

<a href="manageLeaves.jsp">Manage Leaves</a><br><br>
<a href="viewLeaves.jsp">View All Leaves</a><br><br>
<a href="manageUsers.jsp">Manage Users</a><br><br>
</div>