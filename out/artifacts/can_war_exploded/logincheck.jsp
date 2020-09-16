<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-09-11
  Time: 오후 4:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="example.*" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>logincheck</title>
</head>

<body>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    String dbid = "alpacao";
    String dbpw = "alpaca16";
    String dbname = "alpacao";
    String tablename = "userinfo";

    Connection conn = null;
    ResultSet rs = null;
    PreparedStatement pstmt = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/alpacao?useUnicode=true&characterEncoding=utf-8", "alpacao", "alpaca16");
        String sql = "select count(*) as cnt from "+tablename +" where id=? and pw=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, pw);
        rs = pstmt.executeQuery();
        rs.next();

        if(rs.getString("cnt").equals("1"))
        {
            session.setAttribute("id",id); //세션으로 id값 전달.
            response.sendRedirect("index.jsp"); //index로 보냄.

        }
        else
        {
%>
<script>
    alert("로그인에 실패하였습니다.");
    location.href="login.jsp"; // 로그인페이지로 이동시킴
</script>
<%
        }

    }catch(Exception e) {
        out.print(e);
    }
%>


</body>
</html>