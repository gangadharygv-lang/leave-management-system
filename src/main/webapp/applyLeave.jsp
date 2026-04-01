<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

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
<link rel="stylesheet" href="css/style.css">

<div class="container">
<h2>Apply Leave</h2>

<form action="ApplyLeaveServlet" method="post">
    Leave Type: <input type="text" name="type"><br><br>
    From Date: <input type="date" name="from"><br><br>
    To Date: <input type="date" name="to"><br><br>
    Reason: <textarea name="reason"></textarea><br><br>

    <button type="submit">Apply</button>
</form>
</div>