<%@ include file="../includes/auth.jsp" %>

<%
if(!"user".equals(session.getAttribute("role"))) {
    response.sendRedirect(request.getContextPath() + "/jsp/security/login.jsp");
    return;
}
%>

<%@ include file="../includes/header.jsp" %>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

<div class="container">

<h2>Apply Leave</h2>

<form action="<%= request.getContextPath() %>/ApplyLeaveServlet" method="post">
    
    Leave Type:
    <input type="text" name="type" required><br><br>
    
    From Date:
    <input type="date" name="from" required><br><br>
    
    To Date:
    <input type="date" name="to" required><br><br>
    
    Reason:
    <textarea name="reason" required></textarea><br><br>

    <button type="submit">Apply</button>

</form>

</div>

<%@ include file="../includes/footer.jsp" %>