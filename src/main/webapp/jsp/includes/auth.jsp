<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

if(session.getAttribute("user") == null) {
    response.sendRedirect(request.getContextPath() + "/jsp/security/login.jsp");
    return;
}
%>