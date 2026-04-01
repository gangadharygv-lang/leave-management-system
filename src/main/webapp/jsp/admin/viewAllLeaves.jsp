<%@ include file="../includes/adminAuth.jsp" %>
<%@ include file="../includes/header.jsp" %>

<%@ page import="java.sql.*,com.project.util.DBConnection"%>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

<div class="container">

<h2>All Leave Requests</h2>

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
    Statement st = con.createStatement();

    ResultSet rs = st.executeQuery(
        "SELECT l.*, u.name FROM leaves l JOIN users u ON l.user_id = u.id"
    );

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
<a href="<%= request.getContextPath() %>/jsp/admin/adminDashboard.jsp">⬅ Back to Dashboard</a>

</div>

<%@ include file="../includes/footer.jsp" %>