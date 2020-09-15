<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="example.*" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>logincheck</title>
</head>

<body>
<%@ page import = "java.sql.*, java.util.*" %>

  <% if(session.getAttribute("id") == null) {
    response.sendRedirect("login.jsp");
}%>
<%
    request.setCharacterEncoding("UTF-8");
    String url = request.getParameter("ss");
    String answer = request.getParameter("answer");
    //.substring(22);
    
    out.print(url);
    String id = (String)session.getAttribute("id");
    out.print(id);


  Class.forName("com.mysql.jdbc.Driver");
    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/alpacao?useUnicode=true&characterEncoding=utf-8", "alpacao", "alpaca16");
        pstmt = conn.prepareStatement("insert into imagedata (id,src,answer) values(?,?,?) ");
        pstmt.setString(1, id);
        pstmt.setString(2, url);
        pstmt.setString(3,answer);
        pstmt.executeUpdate(); //쿼리 Excute. 실제 쿼리 실행부분

        %>
<script>
    alert("문제를 제출했어요!")
    location.href="index.jsp"
    </script>


        <%


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
            
    }}



    %>
    
    
    </body>
    </html>
