<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-09-11
  Time: 오후 4:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
</head>
<% if(session.getAttribute("id") == null) {
    response.sendRedirect("");}
%>



<body>
<%
String id = (String)session.getAttribute("id");
out.print(id);
%>

<div>
    <div style="background-color: aquamarine; width: 100%; height: 100px">
        <div
                class="color-pink"
                style="
            margin-left: 40%;
            background-color: #ffc0cb;
            height: 30px;
            width: 30px;
            float: left;
          "
                onclick="pink()"
        ></div>

        <div
                class="color-yellow"
                style="
            background-color: #ffff00;
            height: 30px;
            width: 30px;
            float: left;
            margin-left: 10px;
          "
                onclick="yellow()"
        ></div>
        <div
                class="color-black"
                style="
            background-color: black;
            height: 30px;
            width: 30px;
            float: left;
            margin-left: 10px;
          "
                onclick="black()"
        ></div>
        <div
                class="color-red"
                style="
            background-color: red;
            height: 30px;
            width: 30px;
            float: left;
            margin-left: 10px;
          "
                onclick="red()"
        ></div>
        <div
                class="color-green"
                style="
            background-color: #059e05;
            height: 30px;
            width: 30px;
            float: left;
            margin-left: 10px;
          "
                onclick="green()"
        ></div>
        <div
                class="color-brown"
                style="
            background-color: #995900;
            height: 30px;
            width: 30px;
            float: left;
            margin-left: 10px;
          "
                onclick="brown()"
        ></div>
        <div
                class="color-blue"
                style="
            background-color: #003cff;
            height: 30px;
            width: 30px;
            float: left;
            margin-left: 10px;
          "
                onclick="blue()"
        ></div>
        <div
                class="color-sky"
                style="
            background-color: #6bc6ff;
            height: 30px;
            width: 30px;
            float: left;
            margin-left: 10px;
          "
                onclick="sky()"
        ></div>
        <div
                class="color-purple"
                style="
            background-color: #8000db;
            height: 30px;
            width: 30px;
            float: left;
            margin-left: 10px;
          "
                onclick="purple()"
        ></div>
        <div
                class="color-white"
                style="
            background-color: #ffffff;
            height: 30px;
            width: 30px;
            float: left;
            margin-left: 10px;
          "
                onclick="white()"
        ></div>

        <button style="margin-left: 10px" onclick="clearboard()">초기화</button>
        <button style="margin-left: 10px" onclick="save()">저장</button>
        <input type="submit">
    </div>
</div>
</body>
</html>
<script>
window.onload = function () {
  canvas = document.getElementById("canvas");
  ctx = canvas.getContext("2d");

  canvas.addEventListener("mousedown", li);
  canvas.addEventListener("mousemove", li);
  canvas.addEventListener("mouseup", li);
  canvas.addEventListener("mouseout", li);
};

</script>
<script src="fun.js"></script>
