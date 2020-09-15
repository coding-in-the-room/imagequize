<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>니가그린기린그림</title>
            <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css.css" type="text/css">
  </head>
  <body>
  <% if(session.getAttribute("id") == null) {
    response.sendRedirect("login.jsp");   //세션 확인.
}%>
    <center>
    <br><br><br><br>
      <button
        style="width: 500px; height: 150px;  "
        onclick="movecreate()"
      >
        문제 제작
      </button>
      <br><br><br><br>
      <button
        style="width: 500px; height: 150px;   "
        onclick="movequize()"
      >
        문제 맞추기
      </button>
      <br><br><br><br>
      <button
        style="width: 500px; height: 150px;   "
        onclick="logout()"
      >
        로그아웃
      </button>
    
    <br>
    <br>
    </center>
  </body>
</html>
<script>
  function movecreate() {
    location.href = "canvas.jsp";
  }

  function movequize() {
    location.href = "viewquize.jsp";
  }

  function logout() {
    location.href = "logout.jsp";
  }
</script>
