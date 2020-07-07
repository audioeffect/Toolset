function updateTheme(theme){
 	var chalk = document.getElementById('chalk');
	var charcoal = document.getElementById('charcoal');
	var coral = document.getElementById('coral');
	var carrot = document.getElementById('carrot');
	var sunglow = document.getElementById('sunglow');
	var android = document.getElementById('android');
	var sky = document.getElementById('sky');
	var amethyst = document.getElementById('amethyst');
	var glyph = document.getElementById('glyph');
	var reflect = document.getElementById('reflect');
	var bg = document.getElementById('bg');
	var zim = document.getElementById('zim');

	switch(theme){
		case "chalk":
			chalk.disabled = false;
			charcoal.disabled = true;
			coral.disabled = true;
			carrot.disabled = true;
			sunglow.disabled = true;
			android.disabled = true;
			sky.disabled = true;
			amethyst.disabled = true;
			glyph.disabled = true;
			reflect.disabled = true;
			bg.disabled = true;
			zim.disabled = true;
			currentTheme = 'chalk';
			break;
		case "charcoal":
			chalk.disabled = true;
			charcoal.disabled = false;
			coral.disabled = true;
			carrot.disabled = true;
			sunglow.disabled = true;
			android.disabled = true;
			sky.disabled = true;
			amethyst.disabled = true;
			glyph.disabled = true;
			reflect.disabled = true;
			bg.disabled = true;
			zim.disabled = true;
			currentTheme = 'charcoal';
			break;
		case "coral":
			chalk.disabled = true;
			charcoal.disabled = true;
			coral.disabled = false;
			carrot.disabled = true;
			sunglow.disabled = true;
			android.disabled = true;
			sky.disabled = true;
			amethyst.disabled = true;
			glyph.disabled = true;
			reflect.disabled = true;
			bg.disabled = true;
			zim.disabled = true;
			currentTheme = 'coral';
			break;
		case "carrot":
			chalk.disabled = true;
			charcoal.disabled = true;
			coral.disabled = true;
			carrot.disabled = false;
			sunglow.disabled = true;
			android.disabled = true;
			sky.disabled = true;
			amethyst.disabled = true;
			glyph.disabled = true;
			reflect.disabled = true;
			bg.disabled = true;
			zim.disabled = true;
			currentTheme = 'carrot';
			break;
		case "sunglow":
			chalk.disabled = true;
			charcoal.disabled = true;
			coral.disabled = true;
			carrot.disabled = true;
			sunglow.disabled = false;
			android.disabled = true;
			sky.disabled = true;
			amethyst.disabled = true;
			glyph.disabled = true;
			reflect.disabled = true;
			bg.disabled = true;
			zim.disabled = true;
			currentTheme = 'sunglow';
			break;
		case "android":
			chalk.disabled = true;
			charcoal.disabled = true;
			coral.disabled = true;
			carrot.disabled = true;
			sunglow.disabled = true;
			android.disabled = false;
			sky.disabled = true;
			amethyst.disabled = true;
			glyph.disabled = true;
			reflect.disabled = true;
			bg.disabled = true;
			zim.disabled = true;
			currentTheme = 'android';
			break;
		case "sky":
			chalk.disabled = true;
			charcoal.disabled = true;
			coral.disabled = true;
			carrot.disabled = true;
			sunglow.disabled = true;
			android.disabled = true;
			sky.disabled = false;
			amethyst.disabled = true;
			glyph.disabled = true;
			reflect.disabled = true;
			bg.disabled = true;
			zim.disabled = true;
			currentTheme = 'sky';
			break;
		case "amethyst":
			chalk.disabled = true;
			charcoal.disabled = true;
			coral.disabled = true;
			carrot.disabled = true;
			sunglow.disabled = true;
			android.disabled = true;
			sky.disabled = true;
			amethyst.disabled = false;
			glyph.disabled = true;
			reflect.disabled = true;
			bg.disabled = true;
			zim.disabled = true;
			currentTheme = 'amethyst';
			break;
		case "glyph":
			chalk.disabled = true;
			charcoal.disabled = true;
			coral.disabled = true;
			carrot.disabled = true;
			sunglow.disabled = true;
			android.disabled = true;
			sky.disabled = true;
			amethyst.disabled = true;
			glyph.disabled = false;
			reflect.disabled = true;
			bg.disabled = true;
			zim.disabled = true;
			currentTheme = 'glyph';
			break;
		case "reflect":
			chalk.disabled = true;
			charcoal.disabled = true;
			coral.disabled = true;
			carrot.disabled = true;
			sunglow.disabled = true;
			android.disabled = true;
			sky.disabled = true;
			amethyst.disabled = true;
			glyph.disabled = true;
			reflect.disabled = false;
			bg.disabled = true;
			zim.disabled = true;
			currentTheme = 'reflect';
			break;
		case "bg":
			chalk.disabled = true;
			charcoal.disabled = true;
			coral.disabled = true;
			carrot.disabled = true;
			sunglow.disabled = true;
			android.disabled = true;
			sky.disabled = true;
			amethyst.disabled = true;
			glyph.disabled = true;
			reflect.disabled = true;
			bg.disabled = false;
			zim.disabled = true;
			currentTheme = 'bg';
			break;
		case "zim":
			chalk.disabled = true;
			charcoal.disabled = true;
			coral.disabled = true;
			carrot.disabled = true;
			sunglow.disabled = true;
			android.disabled = true;
			sky.disabled = true;
			amethyst.disabled = true;
			glyph.disabled = true;
			reflect.disabled = true;
			bg.disabled = true;
			zim.disabled = false;
			currentTheme = 'zim';
			break;
	}
	canvasHandler(theme);
	saveSettings();
}

function canvasHandler(media){
	destroyTimer(loop);
	switch(media){
		case 'glyph':
			setupGlyph();
			break;
		case 'reflect':
			setupReflect();
			break;
		case 'bg':
			setupBG();
			break;
		case 'zim':
			setupZim();
			break;
		default:
			break;
	}
}