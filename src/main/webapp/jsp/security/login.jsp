<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

<div class="container">

<h2 style="text-align:center;">Login</h2>

<%
String error = request.getParameter("error");
if(error != null) {
%>
    <p style="color:red; text-align:center;">Invalid email or password</p>
<%
}
%>

<form action="<%= request.getContextPath() %>/LoginServlet" method="post">
    
    Email:
    <input type="text" name="email" required><br><br>
    
    Password:
    <input type="password" name="password" required><br><br>
    
    <button type="submit">Login</button>
</form>

<br>

<p style="text-align:center;">
    Don't have an account? 
    <a href="<%= request.getContextPath() %>/jsp/security/register.jsp">Register</a>
</p>

</div>