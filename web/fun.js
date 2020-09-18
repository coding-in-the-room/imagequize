class Stack {
  //스택 구조 생성
  constructor() {
    this.store = [];
  }
  push(item) {
    this.store.push(item);
  }
  pop() {
    return this.store.pop();
  }
}
const stack = new Stack(); //스택 사용

var pos = {
  drawable: false,
  x: -1,
  y: -1,
};
var canvas, ctx, count;
window.onload = function () {
  canvas = document.getElementById("canvas");
  ctx = canvas.getContext("2d");

  canvas.addEventListener("mousedown", li);
  canvas.addEventListener("mousemove", li);
  canvas.addEventListener("mouseup", li);
  canvas.addEventListener("mouseout", li);
};
function li(event) {
  switch (event.type) {
    case "mousedown":
      initDraw(event);
      count++;
      break;

    case "mousemove":
      if (pos.drawable) draw(event);
      break;

    case "mouseout":
    case "mouseup":
      finishDraw();
      break;
  }
}

function initDraw(event) {
  ctx.beginPath();
  pos.drawable = true;
  var coors = getPosition(event);
  pos.X = coors.X;
  pos.Y = coors.Y;
  ctx.moveTo(pos.X, pos.Y);
}

function draw(event) {
  var coors = getPosition(event);
  ctx.lineTo(coors.X, coors.Y);
  pos.X = coors.X;
  pos.Y = coors.Y;
  ctx.stroke();
}

function savetmp() {
  var recent = document.getElementById("canvas").toDataURL();
  stack.push(recent);
}

function undo() {
  var abd = document.getElementById("canvas");
  var ccc = abd.getContext("2d");
  var image = new Image();

  image.onload = function () {
    ccc.fillStyle = "#FFFFFF";
    ccc.fillRect(0, 0, abd.width, abd.height);
    ccc.drawImage(image, 0, 0);
  };
  image.src = stack.store.pop();
}

function finishDraw() {
  pos.drawable = false;
  pos.X = -1;
  pos.Y = -1;
}

function getPosition(event) {
  var x = event.pageX - canvas.offsetLeft;
  var y = event.pageY - canvas.offsetTop;
  return { X: x, Y: y };
}

function pencolor(c) {
  ctx.strokeStyle = c;
  ctx.stroke;
}
//채우기

function fill(color) {
  ctx.fillStyle = color;
  ctx.fillRect(0, 0, 1000, 700);
}

function size(s) {
  ctx.lineWidth = s;
  ctx.stroke;
}

/* Reset Canvas.
function clearboard() {
  ctx.clearRect(0, 0, 1000, 700);
}
*/

function save() {
  var answercheck = document.getElementById("answer").value;
  if (answercheck == "") alert("정답을 입력해주세요");
  else {
    var url = canvas.toDataURL();
    //console.log(url);

    document.getElementById("ss").value = url;
    console.log("*");
    var form = document.getElementById("frm");
    form.submit();
  }
}
