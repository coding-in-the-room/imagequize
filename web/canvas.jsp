<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
        
            <link rel="stylesheet" href="css.css" type="text/css">
                <link href="color-picker.min.css" rel="stylesheet" />
    <script src="color-picker.min.js"></script>
    <script src="fun.js" charset="UTF-8"></script>
  </head>
  <body >
    <% if(session.getAttribute("id") == null) { //세션 확인
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

     
<center>
<div>
펜 색상 <br>
<input type="text" id="co" name="co" value="#000000" />

<br>
채우기 색상 <br>
<div style="float:left; margin-left:30%">
      <div class="out">
        <div class="in" onclick="fill('rgb(255, 255, 255)')" style="background-color: rgb(255, 255, 255)"></div>
      </div>
      <div class="out">
        <div class="in" onclick="fill('rgb(0, 0, 0)')" style="background-color:  rgb(0, 0, 0)"></div>
      </div>
      <div class="out">
        <div class="in" onclick="fill('rgb(5, 201, 71)')" style="background-color: rgb(5, 201, 71)"></div>
      </div>
      <div class="out">
        <div class="in" onclick="fill('rgb(38, 0, 255)')" style="background-color: rgb(38, 0, 255)"></div>
      </div>
      <div class="out">
        <div class="in" onclick="fill('rgb(255, 0, 234)')" style="background-color: rgb(255, 0, 234)"></div>
      </div>
      <div class="out">
        <div class="in" onclick="fill('rgb(255, 0, 128)')" style="background-color: rgb(255, 0, 128)"></div>
      </div>
      <div class="out">
        <div class="in" onclick="fill('rgb(255, 0, 0)')" style="background-color: rgb(255, 0, 0)"></div>
      </div>
      <div class="out">
        <div class="in" onclick="fill('rgb(255, 251, 13)')" style="background-color: rgb(255, 251, 13)"></div>
      </div>
      <div class="out">
        <div class="in" onclick="fill('rgb(3, 213, 250)')" style="background-color: rgb(3, 213, 250)"></div>
      </div>
      <div class="out">
        <div class="in" onclick="fill('rgb(255, 255, 255)')" style="background-color: rgb(153, 0, 255)"></div>
      </div>
    </div>

</div>


        <br>
        <br>
       
<br>
<br>
<div>
<center>

<div style="width: 500px; height: 100px; margin-left: 10%;"> <!-- 붓 크기 설정 -->
  <div class="size" style="width: 40px; height: 40px; margin: 10px 10px 10px 10px; "onclick="size(40)"></div>
  <div class="size" style="width: 30px; height: 30px; margin: 14px 12px 12px 12px; "onclick="size(25)"></div>
  <div class="size" style="width: 25px; height: 25px; margin: 18px 14px 14px 14px; "onclick="size(15)"></div>
  <div class="size" style="width: 15px; height: 15px; margin: 22px 16px 16px 16px; "onclick="size(10)"></div>
  <div class="size" style="width: 10px; height: 10px; margin: 26px 18px 18px 18px; "onclick="size(5)"></div>
  <div class="size" style="width: 8px; height: 8px; margin: 30px 30px 30px 30px; "onclick="size(3)"></div>
  <div class="size" style="width: 6px; height: 6px; margin: 34px 34px 34px 34px; "onclick="size(1)"></div>
</div>

<div>

        <br></center>
        <form action="send.jsp" method="post" id="frm" name="frm">
        <input type="hidden" id="ss" name="ss" value="null"> <!-- image Base64값 담을 공간 -->
        
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




        
         
       <button  style="margin-left: 20px" onclick="save()">SAVE</button> 
       </center>
        </form><button onclick="movehome()">홈으로</button> <button onclick="undo()">UNDO</button>
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

<script type="text/javascript">


if(isMobile()){ 

	location.href = "mobile404.html";	//모바일일때 보낼 페이지

}


function isMobile(){ //모바일 접속인지 확인.
	var UserAgent = navigator.userAgent;

	if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null)
    return true;
    
else return false;
	
}

function movehome() {
  location.href = "index.jsp";
}






var picker = new CP(document.getElementById("co"));

function onChange(r, g, b, a) {
  canvas = document.getElementById("canvas");
  ctx = canvas.getContext("2d");
  this.source.value = this.color(r, g, b, a);
  ctx.strokeStyle = this.color(r, g, b, a);
  ctx.stroke;
}
picker.on("change", onChange);

var picker = new CP(document.getElementById("co"), {
  color: "HEX", // color format
  e: ["touchstart", "mousedown"], // events to show the color picker
  parent: null, //parent element
});








</script>