<%
if(session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
}
%>
<%@ page import="java.sql.*,com.project.util.DBConnection" %>

<link rel="stylesheet" href="css/style.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<%
String user = (String) session.getAttribute("user");
String role = (String) session.getAttribute("role");

if(user == null) {
    response.sendRedirect("login.jsp");
}
%>

<div class="container">

<h2>Welcome <%= user %></h2>

<!-- Navigation -->
<%

if(role != null && role.equals("user")) {
%>
    <a href="applyLeave.jsp">Apply Leave</a><br><br>
<%
}
%><br><br>
<a href="viewLeaves.jsp">View Leaves</a><br><br>

<% if(role != null && role.equals("admin")) { %>
    <a href="manageLeaves.jsp">Manage Leaves</a><br><br>
<% } %>

<hr>

<h3>Leave Analytics</h3>

<%
int total=0, approved=0, rejected=0;

try {
    Connection con = DBConnection.getConnection();
    Statement st = con.createStatement();

    ResultSet rs1 = st.executeQuery("SELECT COUNT(*) FROM leaves");
    if(rs1.next()) total = rs1.getInt(1);

    ResultSet rs2 = st.executeQuery("SELECT COUNT(*) FROM leaves WHERE status='Approved'");
    if(rs2.next()) approved = rs2.getInt(1);

    ResultSet rs3 = st.executeQuery("SELECT COUNT(*) FROM leaves WHERE status='Rejected'");
    if(rs3.next()) rejected = rs3.getInt(1);

} catch(Exception e) {
    e.printStackTrace();
}
%>

<p><b>Total Leaves:</b> <%= total %></p>
<p><b>Approved Leaves:</b> <%= approved %></p>
<p><b>Rejected Leaves:</b> <%= rejected %></p>

<!-- Chart -->
<canvas id="leaveChart" width="400" height="200"></canvas>

<script>
var ctx = document.getElementById('leaveChart').getContext('2d');

new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['Approved', 'Rejected'],
        datasets: [{
            label: 'Leave Status',
            data: [<%= approved %>, <%= rejected %>],
            borderWidth: 1
        }]
    }
});
</script>
<a href="LogoutServlet">Logout</a>

</div>