<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="css.css" type="text/css">
    <script src="fun.js" charset="UTF-8"></script>
  </head>
  <body >
    <% if(session.getAttribute("id") == null) {
    response.sendRedirect("login.jsp");
}%>
    <center>
    <div style="width:100%;">
      <div style="border: 1px solid; width: 1000px; height: 700px; ">
        <canvas
          name="canvas"
          id="canvas"
          width="1000px"
          height="700px"
        ></canvas>
      </div>




    </div>
    </center>

    <div>
      <div style="background-color: aquamarine; width: 100%; height: 200px; padding-top:20px;">

        <div
  style="
    margin-left: 30%;
    height: 30px;
    width: 100px;
    float: left;
  "
>그리기 도구</div>
        <div
          class="jb"
          style="
            background-color: #ffc0cb;
          "
          onclick="pencolor('#ffc0cb')"
        ></div>

        <div
          class="jb"
          style="
            background-color: #ffff00;
          "
          onclick="pencolor('#ffff00')"
        ></div>
        <div
          class="jb"
          style="
            background-color: black;
          "
          onclick="pencolor('#000000')"
        ></div>
        <div
          class="jb"
          style="
            background-color: red;
            
          "
          onclick="pencolor('rgb(255,0,0)')"
        ></div>
        <div
          class="jb"
          style="
            background-color: #059e05;
            
          "
          onclick="pencolor('#059e05')"
        ></div>
        <div
          class="jb"
          style="
            background-color: #995900;
            
          "
          onclick="pencolor('#995900')"
        ></div>
        <div
          class="jb"
          style="
            background-color: #003cff;
           
          "
          onclick="pencolor('#003cff')"
        ></div>
        <div
          class="jb"
          style="
            background-color: #6bc6ff;
            
          "
          onclick="pencolor('#6bc6ff')"
        ></div>
        <div
          class="jb"
          style="
            background-color: #8000db;
            
          "
          onclick="pencolor('#8000db')"
        ></div>
        <div
          class="jb"
          style="
            background-color: #ffffff;
            
          "
          onclick="pencolor('#ffffff')"
        ></div>
      
        <br>
        <br>
       
 <div
  style="
    margin-left: 30%;
    height: 30px;
    width: 100px;
    float: left;
  "
>채우기 도구</div>
        <div
          class="jb"
          style="
            background-color: #ffc0cb;
          "
          onclick="fill('#ffc0cb')"
        ></div>

        <div
          class="jb"
          style="
            background-color: #ffff00;
          "
          onclick="fill('#ffff00')"
        ></div>
        <div
          class="jb"
          style="
            background-color: black;
          "
          onclick="fill('#000000')"
        ></div>
        <div
          class="jb"
          style="
            background-color: red;
            
          "
          onclick="fill('rgb(255,0,0)')"
        ></div>
        <div
          class="jb"
          style="
            background-color: #059e05;
            
          "
          onclick="fill('#059e05')"
        ></div>
        <div
          class="jb"
          style="
            background-color: #995900;
            
          "
          onclick="fill('#995900')"
        ></div>
        <div
          class="jb"
          style="
            background-color: #003cff;
           
          "
          onclick="fill('#003cff')"
        ></div>
        <div
          class="jb"
          style="
            background-color: #6bc6ff;
            
          "
          onclick="fill('#6bc6ff')"
        ></div>
        <div
          class="jb"
          style="
            background-color: #8000db;
            
          "
          onclick="fill('#8000db')"
        ></div>
        <div
          class="jb"
          style="
            background-color: #ffffff;
            
          "
          onclick="fill('#ffffff')"
        ></div>
<br>
<br>
<div>
<center>

<div style="width: 500px; height: 100px; margin-left: 10%;">
  <div class="size" style="width: 40px; height: 40px; margin: 10px 10px 10px 10px; "onclick="size(40)"></div>
  <div class="size" style="width: 30px; height: 30px; margin: 14px 12px 12px 12px; "onclick="size(25)"></div>
  <div class="size" style="width: 25px; height: 25px; margin: 18px 14px 14px 14px; "onclick="size(15)"></div>
  <div class="size" style="width: 15px; height: 15px; margin: 22px 16px 16px 16px; "onclick="size(10)"></div>
  <div class="size" style="width: 10px; height: 10px; margin: 26px 18px 18px 18px; "onclick="size(5)"></div>
</div>

<div>

        <br></center>
        <form action="send.jsp" method="post" id="frm" name="frm">
        <input type="hidden" id="ss" name="ss" value="0000">
        <br>
        <center>


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
         
            <input 
              type="text"
              style="width: 390px; height: 30px; border: none; outline: none"
              name="answer"
              id="answer"
              type="text"
              autocomplete="off"
              autofocus
              placeholder="정답을 입력하세요."
            />
          </div>
        </div>




        
        <button  style="margin-left: 10px" onclick="save()">SAVE</button>
       </center>
        </form>
      </div>
    </div>
    
  </body>
</html>


<script> //엔터 키 막기.
  window.addEventListener("keydown",function(event){
    if(event.defaultPrevented){
      return;
    }
    var handled = false;
    if(event.keyCode == 13) {
      handled = true;
      console.log("enter");
    }
    if(handled) {
      event.preventDefault();
    }

  },true)
</script>