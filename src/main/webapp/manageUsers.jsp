<%
if(session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
}
%>
<%@ page import="java.sql.*,com.project.util.DBConnection" %>
<%
String role = (String) session.getAttribute("role");

if(role == null || !role.equals("admin")) {
    response.sendRedirect("login.jsp");
}
%>

<h2>Approve Users</h2>

<table border="1">
<tr>
<th>Name</th>
<th>Email</th>
<th>Status</th>
<th>Action</th>
</tr>

<%
Connection con = DBConnection.getConnection();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM users");

while(rs.next()) {
%>
<tr>
<td><%= rs.getString("name") %></td>
<td><%= rs.getString("email") %></td>
<td><%= rs.getString("status") %></td>
<td>
<a href="ApproveUserServlet?id=<%=rs.getInt("id")%>">Approve</a>
</td>
</tr>
<% } %>
</table>