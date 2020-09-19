<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>신고하기</title>
  </head>
  <body>
  
  <%
        String userid = request.getParameter("myid"); //신고자 아이디
        String pictureuserid = request.getParameter("pictureid"); //피신고자 아이디
        String picturenum = request.getParameter("num");
        String src = request.getParameter("src");
  %>
  
      <center>
      <img src="http://alpacao.cafe24.com/img/<%out.print(src);%>" alt="" style="width: 500px; height: 350px" />
      <br />
      다음 그림을 신고합니다
      <br />

      신고 사유를 선택해주세요.
      <br />
      <select name="reason" id="reason">
        <option value="불건전한 그림">불건전한 그림</option>
        <option value="성의없는 그림">성의없는 그림</option>
        <option value="타인을 비방하는 그림">타인을 비방하는 그림</option>
        <option value="기타">기타</option>
      </select>
      <button onclick="report()">신고하기</button> 
      <button>취소</button>
    </center>
  </body>
</html>
<script>
function report(){
location.href = "report.jsp?userid=<%out.print(userid);%>&pictureuserid=<%out.print(pictureuserid);%>&picturenum=<%out.print(picturenum);%>&src=<%out.print(src);%>&reason="+ document.getElementById("reason").value;
}

function calcle(){
location.href = "viewquize.jsp";


}


</script>
