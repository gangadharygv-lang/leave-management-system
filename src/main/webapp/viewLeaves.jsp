<%@ page import="java.sql.*,com.project.util.DBConnection"%>

<link rel="stylesheet" href="css/style.css">

<%
String user = (String) session.getAttribute("user");
Integer userId = (Integer) session.getAttribute("userId");

// 🔐 Session check
if(user == null || userId == null) {
    response.sendRedirect("login.jsp");
}
%>

<div class="container">

	<h2>Your Leave Requests</h2>

	<table>
		<tr>
			<th>ID</th>
			<th>Type</th>
			<th>From</th>
			<th>To</th>
			<th>Reason</th>
			<th>Status</th>
		</tr>

		<%
try {
    Connection con = DBConnection.getConnection();

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM leaves WHERE user_id=?"
    );

    ps.setInt(1, userId);

    ResultSet rs = ps.executeQuery();

    while(rs.next()) {
%>
		<tr>
			<td><%= rs.getInt("id") %></td>
			<td><%= rs.getString("leave_type") %></td>
			<td><%= rs.getString("from_date") %></td>
			<td><%= rs.getString("to_date") %></td>
			<td><%= rs.getString("reason") %></td>
			<td>
				<%
					String status = rs.getString("status");
					
					if(status.equals("Approved")) {
					%> <span style="color: green;"><%= status %></span> <%
					} else if(status.equals("Rejected")) {
					%> <span style="color: red;"><%= status %></span> <%
					} else {
					%> <span style="color: orange;"><%= status %></span> <%
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

	<br> <a href="dashboard.jsp">Back to Dashboard</a>

</div>