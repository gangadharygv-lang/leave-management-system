<%@ include file="auth.jsp" %>

<%
if(!"admin".equals(session.getAttribute("role"))) {
    response.sendRedirect(request.getContextPath() + "/jsp/security/login.jsp");
    return;
}
%>