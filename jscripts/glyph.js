function setupGlyph(){
	var glyphFont = 'bold 14px Courier New';
	glyphStyle = 'rgba(0,200,0,0.5)';
	glyphError = 'rgba(200,0,0,0.8)';
	glyphs = [];
	canvas = document.getElementById('canvas');
	context = canvas.getContext('2d');
	
	canvas.width = windowWidth;
	canvas.height = windowHeight;
	context.textBaseline = 'top';
	context.font = glyphFont;
	context.fillStyle = glyphStyle;
	
	for(var counter = 0; counter < Math.floor
	(canvas.width / 9); counter++){  // Dynamically changes the number of glyphs depending on the width of the canvas
			var glyph = new Glyph();
			glyphs.push(glyph);
	}
	
	drawGlyph();
}

function drawGlyph(){
	loop = createTimer(loop, drawGlyph, 1000/30);  // FPS set to 30 to optimize loop
	
	if(document.getElementById('error1').className === 'active'){  // Changes glyphs to red if there's an input error
		context.fillStyle = glyphError;
		canvas.style.backgroundColor = '#180000';
	}
	else{
		context.fillStyle = glyphStyle;
		canvas.style.backgroundColor = '#001800';
	}
	
	clearCanvas();  // Clears the canvas each loop before drawing again
	for(var counter = 0; counter < glyphs.length; counter++){  // Updates all glyphs every loop
		glyphs[counter].update();
	}
}

function Glyph(){
	var i = this;
	
	i.x = Math.floor(Math.random() * canvas.width);  // Randomly position glyphs across the width of the canvas
	i.y = -605;// - Math.floor(Math.random() * (canvas.height));  // Set glyphs offscreen
	i.speed = getRandomFloat(5.0, 0.1);  // Set glyphs to random speed. Min set greater than 0 so the glyph moves 
	i.text = [];
	
	for(var a=0; a<50; a++){
		var b = Math.random();
		
		if(b < 0.5)
			i.text[a] = 0;
		if(b >= 0.5)
			i.text[a] = 1;
	}
	
	i.render = function(){
		for(var a=0; a<50; a++){
			context.fillText(i.text[a], i.x, i.y + 12 * a);
		}
	};
	i.update = function(){
		i.y += i.speed;
		if(i.y > canvas.height){
			i.x = Math.floor(Math.random() * (canvas.width - 10));
			i.y = -605;
			i.speed = getRandomFloat(5.0, 0.1);
		}
		i.render();
	};
	
	return i;
}