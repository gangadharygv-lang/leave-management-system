<%@ include file="../includes/auth.jsp" %>
<%@ include file="../includes/header.jsp" %>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

<div class="container">

<h2>Welcome <%= session.getAttribute("user") %></h2>
<br>

<!-- User Actions -->

<a href="<%= request.getContextPath() %>/jsp/user/applyLeave.jsp">Apply Leave</a><br><br>

<a href="<%= request.getContextPath() %>/jsp/user/viewLeaves.jsp">View My Leaves</a><br><br>

</div>

<%@ include file="../includes/footer.jsp" %>