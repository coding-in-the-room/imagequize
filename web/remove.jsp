<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-09-21
  Time: 오후 2:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%@ page import = "java.sql.*, java.util.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
String img = request.getParameter("img");
    String num = request.getParameter("num");
    String managerid = request.getParameter("id");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/alpacao?useUnicode=true&characterEncoding=utf-8", "alpacao", "alpaca16");
        pstmt = conn.prepareStatement("delete from imagedata where src=?");
        pstmt.setString(1, img);
        pstmt.executeUpdate(); //쿼리 Excute. 실제 쿼리 실행부분

        pstmt = conn.prepareStatement("update illegalpicture set result='처리완료',manager=? where num = ? ");
        pstmt.setString(1,managerid);
        pstmt.setString(2, num);
        pstmt.executeUpdate(); //쿼리 Excute. 실제 쿼리 실행부분

        response.sendRedirect("manager.jsp?id="+managerid); //index로 보냄.

    } catch (SQLException e) {
        out.print(e);
        e.printStackTrace();
    } finally {

        if (pstmt != null)
            try {
                pstmt.close();
            } catch (Exception e) {
                out.print(e);
            }
        if (conn != null)
            try {
                conn.close();
            } catch (Exception e) {
                out.print(e);
            }

    }

%>

</body>
</html>
