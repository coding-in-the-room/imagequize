<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>view</title>
        <link rel="stylesheet" href="css.css" type="text/css">
</head>

<body>

  <% if(session.getAttribute("id") == null) {  //세션확인.
    response.sendRedirect("login.jsp");
}%>

<%
    String src = "";
    String num = "";
    String answerid = "";
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

        num = rs.getString("num"); //문제 번호
        answerid = rs.getString("id"); //출제자 아이디
        src = rs.getString("src"); //이미지 Path
        answer = rs.getString("answer"); //정답
        
        
        sql = "select * from userinfo where id = '"+session.getAttribute("id")+"'"; //내 세션정보로 내 스코어 로드.
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
    
      <img src='http://alpacao.cafe24.com/img/<%out.print(src);%>'>

      <form action="answercheck.jsp">
        <div
          style="
            width: 400px;
            height: 40px;
            background-color: rgb(36, 131, 255);
          "
        >
          <div
            style="
              float: left;
              width: 390px;
              height: 30px;
              margin-top: 5px;
              margin-left: 5px;
              background-color: #ffffff;
            "
          >
          <input type="hidden" name="answer" id="answer" value="<%out.print(answer);%>">
          <input type="hidden" name="num" id="num" value="<%out.print(num);%>">
            <input 
              type="text"
              style="width: 390px; height: 30px; border: none; outline: none"
              name="userinput"
              id="userinput"
              type="text"
              autocomplete="off"
              autofocus
              placeholder="정답을 입력하세요."
            />
          </div>
        </div>
            <input type="submit" style="display: none;"/>
      </form>
      <div style="width: 300px; height: 30px; background-color:aquamarine;">
      출제자: 
      <%
        out.print("  " +answerid);
%>

    </div>
      <div style="width: 300px; height: 30px; background-color:aquamarine;">
      현재 내 스코어: 
      <%
        out.print("  " +score);
%>

    </div>
<br><br>
<button onclick="movehome()">홈으로</button>   
<button onclick="illegal()">그림 신고</button> 
    </center>

    <script>
    function movehome() {
      location.href="index.jsp";
    }

    function illegal()
    {
      //picture : 피신고자 아이디
      //num : 그림번호
      //src : 그림경로
      location.href = "illegal.jsp?pictureid=<%out.print(answerid);%>&num=<%out.print(num);%>&myid=<%out.print(session.getAttribute("id"));%>&src=<%out.print(src);%>"
    }


    </script>