<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if(session!=null) session.invalidate(); //세션이 있을경우 세션을 삭제하고 로그인페이지로 보냄.
    response.sendRedirect("login.jsp");
%>

