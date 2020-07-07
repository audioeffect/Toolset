function setupReflect(){
	var reflectFont = 'bold 24px Arial';
	paddle1 = new Paddle();
	paddle2 = new Paddle();
	ball = new Ball();
	reflectStyle = 'rgba(255,255,255,0.5)';
	reflectError = 'rgba(200,0,0,0.7)';
	canvas = document.getElementById('canvas');
	context = canvas.getContext('2d');
	
	canvas.width = windowWidth;
	canvas.height = windowHeight;
	context.font = reflectFont;
	context.fillStyle = reflectStyle;
	
	paddle1.x = 10;
	paddle1.y = canvas.height / 2 - paddle1.height / 2;
	paddle2.x = canvas.width - 20;
	paddle2.y = canvas.height / 2 - paddle2.height / 2;
		
	drawReflect();
}

function drawReflect(){
	loop = createTimer(loop, drawReflect, 1000/60);
	
	clearCanvas();
	paddle1.update();
	paddle2.update();
	ball.update();
		
	if(ball.y + ball.radius >= paddle1.y && ball.y <= paddle1.y + paddle1.height && ball.x <= paddle1.x + paddle1.width && ball.x + ball.radius >= paddle1.x){
		ball.velocityX = -ball.velocityX;
		ball.velocityX *= 1.05;
		ball.velocityY *= 1.05;
		ball.velocityY = (((ball.y + ball.radius / 2) - paddle1.y) - (paddle1.height / 2)) / 3;
	}
	if(ball.y + ball.radius >= paddle2.y && ball.y <= paddle2.y + paddle2.height && ball.x <= paddle2.x + paddle2.width && ball.x + ball.radius*2 >= paddle2.x){
		ball.velocityX = -ball.velocityX;
		ball.velocityY = (((ball.y + ball.radius / 2) - paddle2.y) - (paddle2.height / 2)) / 3;
	}
	if(ball.x - ball.radius < 0 || ball.x + ball.radius > canvas.width){
		ball = new Ball();
		paddle1.x = 10;
		paddle1.y = canvas.height / 2 - paddle1.height / 2;
		paddle2.x = canvas.width - 20;
		paddle2.y = canvas.height / 2 - paddle2.height / 2;
	}
	
	if(ball.y < paddle1.y + paddle1.height / 2 - ball.radius && ball.velocityX < 0){
		if(paddle1.velocity > -6)
			paddle1.velocity -= paddle1.speed;
		else
			paddle1.velocity = -6;
	}
	if(ball.y >= paddle1.y + paddle1.height / 2 + ball.radius && ball.velocityX < 0){
		if(paddle1.velocity < 6)
			paddle1.velocity += paddle1.speed;
		else
			paddle1.velocity = 6;
	}
	if(ball.y < paddle2.y + paddle2.height / 2 - ball.radius && ball.velocityX > 0){
		if(paddle2.velocity > -6)
			paddle2.velocity -= paddle2.speed;
		else
			paddle2.velocity = -6;
	}
	if(ball.y >= paddle2.y + paddle2.height / 2 + ball.radius && ball.velocityX > 0){
		if(paddle2.velocity < 6)
			paddle2.velocity += paddle2.speed;
		else
			paddle2.velocity = 6;
	}
	
	if(document.getElementById('error1').className === 'active'){  // Changes ball and paddles to red if there's an input error
		context.fillStyle = reflectError;
		canvas.style.backgroundColor = '#180000';
	}
	else{
		context.fillStyle = reflectStyle;
		canvas.style.backgroundColor = '#151515';
	}
}

function Paddle(){
	var i = this;
	
	i.x = 0;
	i.y = 0;
	i.width = 10;
	i.height = 50;
	i.velocity = 0;
	i.friction = 0.8;
	i.speed = 3;
	i.counter = 0;
	
	i.render = function(){
		context.fillRect(i.x, i.y, i.width, i.height);
	};
	i.update = function(){
		i.velocity *= i.friction;
		i.y += i.velocity;
		i.render();
	};
	
	return i;
}

function Ball(){
	var i = this;
	
	i.direction = getRandom(-1,1);
	if(i.direction === -1)
		i.radians = deg2rad(getRandom(45,135));
	else
		i.radians = deg2rad(getRandom(225,315));
	
	i.x = canvas.width / 2;
	i.y = canvas.height / 2;
	i.radius = 6;
	i.speed = 6;
	i.velocityX = i.speed * Math.sin(i.radians);
	i.velocityY = i.speed * Math.cos(i.radians);
	
	i.render = function(){
		context.beginPath();
		context.fillRect(i.x, i.y, i.radius*2, i.radius*2);
	};
	i.update = function(){
		if(i.x - i.radius < 0 || i.x + i.radius > canvas.width){
			i.velocityX = 0;
			i.velocityY = 0;
		}
		if(i.y - i.radius < 0 || i.y + i.radius > canvas.height){
			i.velocityY = -i.velocityY;
		}
		i.x += i.velocityX;
		i.y += i.velocityY;
		i.render();
	};
}

