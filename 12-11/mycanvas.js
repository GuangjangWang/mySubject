//涂鸦板
var canvas = null;
var context = null;
var drawflag = false;//控制画还是不画的全局变量

function init(){
	canvas = document.getElementById('mycanvas');
	context = canvas.getContext('2d');

	//测试
	// context.fillStyle="red";
	// context.fillRect(100,100,400,400);

	draw();
}
function draw(){
	context.lineWidth = document.getElementById('mywidth').value;
	context.strokeStyle = document.getElementById('mycolor').value;
	context.fillText("王广江",100,100);
	//测试
	// context.strokeRect(100,100,400,400);
	//鼠标按下绘画准备  mousedown
	canvas.onmousedown=function(e){
		//开始状态
		drawflag = true;
		context.beginPath();
		//画笔移动到鼠标当前位置
		context.moveTo(e.layerX,e.layerY);
	}
	//鼠标移动 绘画 mousemove
	canvas.onmousemove=function(e){
		if(drawflag){			
		context.lineTo(e.layerX,e.layerY);
		context.stroke();
		}
	}

	//鼠标松开 绘画结束 mouseup
	canvas.onmouseup=function(){
		context.closePath();
		drawflag = false ;
	}
}
function setColor(){
	context.strokeStyle=document.getElementById('mycolor').value;
}
function setWidth(){
	context.lineWidth=document.getElementById('mywidth').value;
}
function clearCanvas(){
	context.clearRect(0,0,context.canvas.width,context.canvas.height);
}
function saveCanvas(){
	var image = canvas.toDataURL();
	document.getElementById('imageSave').src=image;
}
//页面加载完成后执行init函数
window.addEventListener('load',init,false);