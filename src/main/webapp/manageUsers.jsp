<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", 0); // Proxies
%>

<%
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
<%@ page import="java.sql.*,com.project.util.DBConnection" %>

<link rel="stylesheet" href="css/style.css">

<div class="container">

<h2>Approve Users</h2>

<table>
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Status</th>
    <th>Action</th>
</tr>

<%
try {
    Connection con = DBConnection.getConnection();
    Statement st = con.createStatement();

    ResultSet rs = st.executeQuery("SELECT * FROM users");

    while(rs.next()) {
        String status = rs.getString("status");
%>
<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("email") %></td>

    <td>
    <%
    if("Approved".equals(status)) {
    %>
        <span style="color:green;">Approved</span>
    <%
    } else {
    %>
        <span style="color:orange;">Pending</span>
    <%
    }
    %>
    </td>

    <td>
        <% if("Pending".equals(status)) { %>
            <a href="ApproveUserServlet?id=<%=rs.getInt("id")%>">Approve</a>
        <% } else { %>
            <b>Done</b>
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