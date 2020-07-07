/***************
 * Create Timer
 * *************/
function createTimer(clock, func, rate){
  clock = setTimeout(func, rate);
  
  return clock;
}

/****************
 * Destroy Timer
 * **************/
function destroyTimer(clock){
  clearTimeout(clock);
}

/******************
 * Create Listener
 * ****************/
function createListener(elem, event, func){
  elem.addEventListener(event, func);
}

/*******************
 * Destroy Listener
 * *****************/
function destroyListener(elem, event, func){
  elem.removeEventListener(event, func);
}

/*******************
 * Randomizer (Int)
 * *****************/
function getRandom(min, max){
	return Math.floor(Math.random() * (max - min + 1)) + min;
}
/*********************
 * Randomizer (Float)
 * *******************/
function getRandomFloat(min, max){
	return Math.random() * (max - min + 1) + min;
}

/****************
 * Clear canvas
 * **************/
function clearCanvas(){
	var canvas = document.getElementById('canvas');
	var context = canvas.getContext('2d');
	
	context.clearRect(0, 0, canvas.width, canvas.height);
}

/*********************
 * Degrees to Radians
 * *******************/
 function deg2rad(deg){
	return (180 - deg) * Math.PI/180;
 }

/********************
 * Decimal to Binary
 * ******************/
function dec2bin(dec){
	return (dec >>> 0).toString(2);
}