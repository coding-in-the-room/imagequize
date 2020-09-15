var pos = {
  drawable: false,
  x: -1,
  y: -1,
};
var canvas, ctx, count;
count = 1;

function li(event) {
  switch (event.type) {
    case "mousedown":
      //   if (count > 5) {
      //     alert("5획이상 그을 수 없습니다.");
      //    break;
      //    }
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

function pink() {
  ctx.strokeStyle = "#fc00e6";
  ctx.stroke;
  console.log("pink");
}

function yellow() {
  console.log("yellow");
  ctx.strokeStyle = "#ffff00";
  ctx.stroke;
}
function black() {
  ctx.strokeStyle = "#000000";
  ctx.stroke;
}
function red() {
  ctx.strokeStyle = "#fc0303";
  ctx.stroke;
}
function green() {
  ctx.strokeStyle = "#059e05";
  ctx.stroke;
}
function brown() {
  ctx.strokeStyle = "#995900";
  ctx.stroke;
}
function blue() {
  ctx.strokeStyle = "#003cff";
  ctx.stroke;
}
function sky() {
  ctx.strokeStyle = "#6bc6ff";
  ctx.stroke;
}
function purple() {
  ctx.strokeStyle = "#8000db";
  ctx.stroke;
}
function white() {
  ctx.strokeStyle = "#FFFFFF";
  ctx.stroke;
}

function clearboard() {
  ctx.clearRect(0, 0, 1000, 700);
}

function save() {
  var c = document.getElementById("canvas");
  var url = c.toDataURL();
  console.log(url);
}
