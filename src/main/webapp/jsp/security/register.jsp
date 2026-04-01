<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

<div class="container">

<h2 style="text-align:center;">Register</h2>

<%
String msg = request.getParameter("msg");
if(msg != null) {
%>
    <p style="color:green; text-align:center;">
        Registered successfully! Wait for admin approval.
    </p>
<%
}
%>

<form action="<%= request.getContextPath() %>/RegisterServlet" method="post">
    
    Name:
    <input type="text" name="name" required><br><br>
    
    Email:
    <input type="email" name="email" required><br><br>
    
    Password:
    <input type="password" name="password" required><br><br>

    <button type="submit">Register</button>
</form>

<br>

<p style="text-align:center;">
    Already have an account? 
    <a href="<%= request.getContextPath() %>/jsp/security/login.jsp">Login</a>
</p>

</div>