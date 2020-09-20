<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-09-20
  Time: 오후 4:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
  </head>
  <body>
  <%
  Connection conn = null;
    ResultSet rs = null;
    PreparedStatement pstmt = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/alpacao?useUnicode=true&characterEncoding=utf-8", "alpacao", "alpaca16");

        String sql = "select * from illegalpicture"; //관리자 여부 체크.
        pstmt = conn.prepareStatement(sql);
        
        rs = pstmt.executeQuery();
        String num,reporter,illegaluser,reason,src,result,manager;
        while(rs.next()){
          num = rs.getString("num");
          reporter = rs.getString("reporter");
          illegaluser = rs.getString("illegaluser");
          reason = rs.getString("reason");
          src = rs.getString("src");
          result = rs.getString("result");
          manager = rs.getString("manager");
          if (result == null) result = "미처리";
          if (manager == null) manager = "";
        
  //  if(rs.getString("cnt").equals("1"))
  %>

    <table class="table table-striped" style="width: 800px; text-align: center">
      <tr>
        <td>산고번호</td>
        <td>신고자</td>
        <td>피신고자</td>
        <td>사유</td>
        <td>이미지</td>
        <td>처리결과</td>
        <td>관리자</td>
        <td>관리하기</td>
      </tr>
      <tr>
        <td><%out.print(num);%></td>
        <td><%out.print(reporter);%></td>
        <td><%out.print(illegaluser);%></td>
        <td><%out.print(reason);%></td>
        <td><img style="width:150px; height:100px;" src="http://alpacao.cafe24.com/img/<%out.print(src);%>"></td>
        <td><%out.print(result);%></td>
        <td><%out.print(manager);%></td>
        <td><button class="btn btn-info" onclick="blind(<%out.print(num);%>)">이미지 삭제</button></td>
      </tr>
    </table>
  </body>
</html>

<%


}}
catch (SQLException e) {
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
                
                //자원 반환 및 에러처리

                
    }
                %>