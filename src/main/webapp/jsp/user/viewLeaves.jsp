<%@ include file="../includes/auth.jsp" %>
<%@ include file="../includes/header.jsp" %>

<%@ page import="java.sql.*,com.project.util.DBConnection"%>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

<%
Integer userId = (Integer) session.getAttribute("userId");
%>

<div class="container">

<h2>Leave Requests</h2>

<table>
<tr>
    <th>ID</th>
    <th>User</th>
    <th>Type</th>
    <th>From</th>
    <th>To</th>
    <th>Reason</th>
    <th>Status</th>
</tr>

<%
try {
    Connection con = DBConnection.getConnection();
    PreparedStatement ps;

    if("admin".equals(session.getAttribute("role"))) {
        // Admin sees all leaves
        ps = con.prepareStatement(
            "SELECT l.*, u.name FROM leaves l JOIN users u ON l.user_id = u.id"
        );
    } else {
        // User sees only their leaves
        ps = con.prepareStatement(
            "SELECT l.*, u.name FROM leaves l JOIN users u ON l.user_id = u.id WHERE l.user_id=?"
        );
        ps.setInt(1, userId);
    }

    ResultSet rs = ps.executeQuery();

    while(rs.next()) {
        String status = rs.getString("status");
%>
<tr>
    <td><%= rs.getInt("id") %></td>

    <td>
        <%= rs.getString("name") %>
        (ID: <%= rs.getInt("user_id") %>)
    </td>

    <td><%= rs.getString("leave_type") %></td>
    <td><%= rs.getString("from_date") %></td>
    <td><%= rs.getString("to_date") %></td>
    <td><%= rs.getString("reason") %></td>

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
</tr>
<%
    }

} catch(Exception e) {
    e.printStackTrace();
}
%>

</table>

<br>
<a href="<%= request.getContextPath() %>/jsp/user/dashboard.jsp">⬅ Back to Dashboard</a>

</div>

<%@ include file="../includes/footer.jsp" %>