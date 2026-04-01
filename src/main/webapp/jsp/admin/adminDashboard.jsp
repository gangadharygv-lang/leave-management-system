<%@ include file="../includes/adminAuth.jsp" %>
<%@ include file="../includes/header.jsp" %>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

<div class="container">

<h2>Admin Dashboard</h2>
<br>

<a href="<%= request.getContextPath() %>/jsp/admin/manageLeaves.jsp">Manage Leaves</a><br><br>

<a href="<%= request.getContextPath() %>/jsp/user/viewLeaves.jsp">View All Leaves</a><br><br>

<a href="<%= request.getContextPath() %>/jsp/admin/manageUsers.jsp">Manage Users</a><br><br>

</div>

<%@ include file="../includes/footer.jsp" %>