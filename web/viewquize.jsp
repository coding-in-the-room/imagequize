<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>view</title>
</head>

<body>

  <% if(session.getAttribute("id") == null) {
    response.sendRedirect("login.jsp");
}%>

<%
    String src = "";
    String num = "";
    String id = "";
    String answer = "";
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
        String sql = "select * from imagedata order by rand() limit 1";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        rs.next();

        num = rs.getString("num");
        id = rs.getString("id");
        src = rs.getString("src");
        answer = rs.getString("answer");
        
        
    }
    catch(Exception e){
        out.print(e);
    }
        
        
%>


    <center>
      <img src="<%out.print(src);%>" />

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
    </center>