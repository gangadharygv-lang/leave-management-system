<%@ page import="java.sql.*,com.project.util.DBConnection" %>

<h2>Your Leave Requests</h2>

<table border="1">
<tr>
    <th>ID</th>
    <th>Type</th>
    <th>From</th>
    <th>To</th>
    <th>Status</th>
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
    <td><%= rs.getString("leave_type") %></td>
    <td><%= rs.getString("from_date") %></td>
    <td><%= rs.getString("to_date") %></td>
    <td><%= rs.getString("status") %></td>
</tr>
<%
    }
} catch(Exception e) {
    e.printStackTrace();
}
%>

</table>