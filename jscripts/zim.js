function setupZim(){
	player = new Player();
	enemyArray = [];
	
	drawZim();
}

function drawZim(){
	loop = createTimer(loop, drawZim, 1000/60);

	clearCanvas();
	
}

function Player(){
	var i = this;
	i.speed = 5;
	i.width = 12;
	i.height = 12;
	i.x = canvas.width/2 + i.width/2;  // Center on x-axis
	i.y = canvas.height - 40;
	
	i.render = function(){
		context.fillRect(i.x, i.y, i.width, i.height);
	};
}

function Enemy(){
	
}

function Missile(){
	
}