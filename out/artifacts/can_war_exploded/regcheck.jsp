<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Write Database Page</title>
</head>
<body>
<%@ page import = "java.sql.*, java.util.*" %>
<%

String id = request.getParameter("id");
String pw = request.getParameter("pw");

if(id.length()>5 && id.length()<20){

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/alpacao?useUnicode=true&characterEncoding=utf-8", "alpacao", "alpaca16");
        pstmt = conn.prepareStatement("insert into userinfo values(?,?,?) ");
        pstmt.setString(1, id);
        pstmt.setString(2, pw);
        pstmt.setString(3,"0");
        pstmt.executeUpdate(); //쿼리 Excute. 실제 쿼리 실행부분
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
       
        //자원 반환 및 에러처리
  
    }
%>
<script>
alert("회원가입 성공");
location.href="login.jsp"
</script>
<%

}
else {
    %>
        <script>
            alert("아이디가 양식에 맞지 않습니다. 아이디는 최소 6글자 입니다.");
        </script>
<%
}
%>
<script type="text/javascript">

</script>
</body>
</html>