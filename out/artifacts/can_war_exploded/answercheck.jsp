





<%


//#####################################
//
//          정답 확인 페이지
//
//#####################################


%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>answercheck</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="css.css" type="text/css">
</head>

<body>
  <% if(session.getAttribute("id") == null) {  //세션확인.
    response.sendRedirect("login.jsp");
}
%>
<%@ page import = "java.sql.*, java.util.*" %>
<%
    String answer = request.getParameter("answer"); //정답.
    String userinput = request.getParameter("userinput"); //사용자 입력값.
    String id = (String)session.getAttribute("id"); //세션에서 아이디 가져옴.

if(answer.equals(userinput)){ // 정답 맞췄을 때
    

    
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/alpacao?useUnicode=true&characterEncoding=utf-8", "alpacao", "alpaca16");
        pstmt = conn.prepareStatement("update userinfo set score = score +1 where id='"+id+"'" ); // 스코어 +1시킴.
        
        pstmt.executeUpdate(); //쿼리 Excute. 실제 쿼리 실행부분
%>
<center>
<button style="width: 1000px; height: 600px">
  정답 입니다. <br />
  잠시 후 다음 문제로 넘어갑니다.
</button>
</center>

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
            }
       
        //자원 반환 및 에러처리
  
    }


}



else{
     %>
<center>
<button style="width: 1000px; height: 600px">
  오답 입니다. <br />
  잠시 후 다음 문제로 넘어갑니다.
</button>



     <%
}

    %>

<br>
<br></center>
<script>
  function movehome(){
    location.href="viewquize.jsp"
  }


setTimeout(() => {
           location.href="viewquize.jsp";
        }, 1500);


</script>