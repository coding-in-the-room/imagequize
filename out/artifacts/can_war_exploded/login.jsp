<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>$Title$</title>
</head>
<body>
<%
    if(session!=null) session.invalidate(); //뒤로가기로 로그인페이지 가는것 방지.
%>
<form action="logincheck.jsp" method="GET">
    <input type="text" name = "id"> <br>
    <input type="password" name = "pw"> <br>
    <input type="submit">
</form>
<a href="register.jsp">회원가입</a>


</body>
</html>