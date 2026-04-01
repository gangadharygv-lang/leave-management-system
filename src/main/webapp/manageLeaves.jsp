<%@ page import="java.sql.*,com.project.util.DBConnection" %>

<%
/* 🔐 Session check */
if(session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
    return;
}

/* 🔐 Role check (admin only) */
String role = (String) session.getAttribute("role");

if(role == null || !role.equals("admin")) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<link rel="stylesheet" href="css/style.css">

<div class="container">

<h2>Manage Leave Requests</h2>

<table>
<tr>
    <th>ID</th>
    <th>User</th>
    <th>Type</th>
    <th>From</th>
    <th>To</th>
    <th>Status</th>
    <th>Action</th>
</tr>

<%
try {
    Connection con = DBConnection.getConnection();
    Statement st = con.createStatement();

    ResultSet rs = st.executeQuery(
        "SELECT l.*, u.name FROM leaves l JOIN users u ON l.user_id = u.id"
    );

    while(rs.next()) {
        String status = rs.getString("status");
%>
<tr>
    <!-- Leave ID -->
    <td><%= rs.getInt("id") %></td>

    <!-- Username + ID -->
    <td>
        <%= rs.getString("name") %> 
        (ID: <%= rs.getInt("user_id") %>)
    </td>

    <!-- Leave Details -->
    <td><%= rs.getString("leave_type") %></td>
    <td><%= rs.getString("from_date") %></td>
    <td><%= rs.getString("to_date") %></td>

    <!-- 🎨 Colored Status -->
    <td>
    <%
    if("Approved".equals(status)) {
    %>
        <span style="color:green;"><%= status %></span>
    <%
    } else if("Rejected".equals(status)) {
    %>
        <span style="color:red;"><%= status %></span>
    <%
    } else {
    %>
        <span style="color:orange;"><%= status %></span>
    <%
    }
    %>
    </td>

    <!-- Actions -->
    <td>
        <% if("Pending".equals(status)) { %>
            <a href="ApproveServlet?id=<%=rs.getInt("id")%>&action=approve">Approve</a> |
            <a href="ApproveServlet?id=<%=rs.getInt("id")%>&action=reject">Reject</a>
        <% } else { %>
            <b>Action Done</b>
        <% } %>
    </td>
</tr>
<%
    }
} catch(Exception e) {
    e.printStackTrace();
}
%>

</table>

<br>
<a href="adminDashboard.jsp">⬅ Back to Dashboard</a>

</div>