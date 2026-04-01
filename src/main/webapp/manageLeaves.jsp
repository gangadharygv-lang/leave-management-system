<%@ page import="java.sql.*,com.project.util.DBConnection" %>
<link rel="stylesheet" href="css/style.css">

<div class="container">

<h2>Manage Leave Requests</h2>

<table border="1">
<tr>
    <th>ID</th>
    <th>User ID</th>
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

    ResultSet rs = st.executeQuery("SELECT * FROM leaves");

    while(rs.next()) {
%>
<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getInt("user_id") %></td>
    <td><%= rs.getString("leave_type") %></td>
    <td><%= rs.getString("from_date") %></td>
    <td><%= rs.getString("to_date") %></td>
    <td><%= rs.getString("status") %></td>
    <td>
        <a href="ApproveServlet?id=<%=rs.getInt("id")%>&action=approve">Approve</a> |
        <a href="ApproveServlet?id=<%=rs.getInt("id")%>&action=reject">Reject</a>
    </td>
</tr>
<%
    }
} catch(Exception e) {
    e.printStackTrace();
}
%>

</table>
</div>