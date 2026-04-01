<%@ include file="../includes/adminAuth.jsp" %>
<%@ include file="../includes/header.jsp" %>

<%@ page import="java.sql.*,com.project.util.DBConnection" %>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

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
            <a href="<%= request.getContextPath() %>/ApproveUserServlet?id=<%=rs.getInt("id")%>">Approve</a>
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
<a href="<%= request.getContextPath() %>/jsp/admin/adminDashboard.jsp">⬅ Back to Dashboard</a>

</div>

<%@ include file="../includes/footer.jsp" %>