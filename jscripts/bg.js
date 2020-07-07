// Set up Background parameters
function setupBG(){
	bg = new Background('images/background.png');
	canvas = document.getElementById('canvas');
	context = canvas.getContext('2d');
	
	if(window.innerWidth/window.innerHeight <= 1.5){
		bg.width = window.innerWidth;
		bg.height = bg.width / 1.5;
		bg.y = window.innerHeight/2 - bg.height/2;
	}
	else{
		bg.height = window.innerHeight;
		bg.width = bg.height * 1.5;
		bg.x = window.innerWidth/2 - bg.width/2;
	}
	
	drawBG();
}

// Render Background
function drawBG(){
	loop = createTimer(loop, drawBG, 1000/30);  // FPS set to 5 to optimize loop
	
	if(document.getElementById('error1').className === 'active'){  // Changes glyphs to red if there's an input error
		bg.img.src = 'images/background_error.png';
	}
	else{
		bg.img.src = 'images/background.png';
	}

	clearCanvas();
	bg.update();
}

// Class - Background
function Background(url){
	var i = this;
	i.img = new Image();
	i.img.crossOrigin = 'anonymous';
	i.x = 0;
	i.y = 0;
	i.width = 600;
	i.height = 400;
	i.img.src = url;
		
	i.render = function(){
		i.img.onload = function(){
			context.drawImage(i.img, i.x, i.y, i.width, i.height);  // Draw the image
			getColor();  // Capture color from top left pixel of the image and fill the canvas with this color
		};
		
		return i;
	};
	
	i.update = function(){
		i.render();	

		return i;
	};
}

function getColor(){
	var pixel = context.getImageData(bg.x,bg.y,1,1);
	var data = pixel.data;
	var rgba = 'rgba(' + data[0] + ',' + data[1] + ',' + data[2] + ',255)';
	
	canvas.style.backgroundColor = rgba;
}