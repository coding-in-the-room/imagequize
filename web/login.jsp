<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>로그인</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css.css" type="text/css">
</head>
<body>
<%
    if(session!=null) session.invalidate(); //뒤로가기로 로그인페이지 가는것 방지.
%>
<center>

<form action="logincheck.jsp" method="GET" style="margin-top:20%;">
<h1>로그인</h1><br>
    <input type="text" class="form-control" name = "id" style="width: 300px;" placeholder="Insert ID"> <br>
    <input type="password" class="form-control" name = "pw" style="width: 300px;" placeholder="Insert PW"> <br>
    <input type="submit">
</form>
<a href="register.html">회원가입</a>
</center>

</body>
</html>

