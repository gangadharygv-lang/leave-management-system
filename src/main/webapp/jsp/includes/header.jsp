<div style="background:#007bff; color:white; padding:12px; display:flex; justify-content:space-between; align-items:center;">

    <!-- Left -->
    <div>
        <b>Leave Management System</b>
    </div>

    <!-- Center Navigation -->
    <div>
        <% if("user".equals(session.getAttribute("role"))) { %>
            <a href="<%= request.getContextPath() %>/jsp/user/dashboard.jsp" style="color:white; margin-right:15px;">Home</a>
            <a href="<%= request.getContextPath() %>/jsp/user/applyLeave.jsp" style="color:white; margin-right:15px;">Apply Leave</a>
            <a href="<%= request.getContextPath() %>/jsp/user/viewLeaves.jsp" style="color:white; margin-right:15px;">My Leaves</a>
        <% } %>

        <% if("admin".equals(session.getAttribute("role"))) { %>
            <a href="<%= request.getContextPath() %>/jsp/admin/adminDashboard.jsp" style="color:white; margin-right:15px;">Dashboard</a>
            <a href="<%= request.getContextPath() %>/jsp/admin/manageLeaves.jsp" style="color:white; margin-right:15px;">Manage Leaves</a>
            <a href="<%= request.getContextPath() %>/jsp/admin/viewAllLeaves.jsp" style="color:white; margin-right:15px;">All Leaves</a>
            <a href="<%= request.getContextPath() %>/jsp/admin/manageUsers.jsp" style="color:white; margin-right:15px;">Manage Users</a>
        <% } %>
    </div>

    <!-- Right -->
    <div>
        👤 <%= session.getAttribute("user") %> &nbsp;&nbsp;
        <a href="<%= request.getContextPath() %>/LogoutServlet" style="color:white;">Logout</a>
    </div>

</div>