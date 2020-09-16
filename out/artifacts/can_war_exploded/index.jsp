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
}



 String src = "";
    String num = "";
    String id = "";
    String answer = "";
    String score = "";
    String dbid = "alpacao";
    String dbpw = "alpaca16";
    String dbname = "alpacao";
    String tablename = "apiuser";

    Connection conn = null;
    ResultSet rs = null;
    PreparedStatement pstmt = null;

    




    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/alpacao?useUnicode=true&characterEncoding=utf-8", "alpacao", "alpaca16");
        String sql = "select * from imagedata order by rand() limit 1";   //문제들을 랜덤순서로 표시하고 그중 1개만 가져와서 출력.
      
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        rs.next();

        id = rs.getString("id");
        
        
        
        sql = "select * from userinfo where id = '"+id+"'";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        rs.next();
        score = rs.getString("score");

    }
    catch(Exception e){
        out.print(e);
    }
        





%>
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
        onclick="ranking()"
      >
        랭킹 <br><br>
        현재 내 스코어: <%out.print("  " + score);%>
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
