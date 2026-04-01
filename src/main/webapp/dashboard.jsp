<%@ page import="java.sql.*,com.project.util.DBConnection" %>

<h2>Welcome ${user}</h2>

<a href="applyLeave.jsp">Apply Leave</a><br><br>
<a href="viewLeaves.jsp">View Leaves</a><br><br>
<a href="manageLeaves.jsp">Manage Leaves</a><br><br>

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

<p>Total Leaves: <%= total %></p>
<p>Approved Leaves: <%= approved %></p>
<p>Rejected Leaves: <%= rejected %></p>