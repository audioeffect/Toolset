/*****************************************************
	Global variables
	
	- Can be referenced anywhere in the application 
******************************************************/
var resize = false;
var resizeTimer = undefined;
var inputStyle = 'solid 1px #333333';
var tabArray = [];
var activeIndex = '';
var activeTab = '';
var activeName = '';
var loop;
var updater;
var windowWidth = window.innerWidth;
var windowHeight = window.innerHeight;
var tsHeight;
var tsWidth;
var currentTheme;
var updated;

/*****************************************************************
	On Window Load
	
	- Set up application when it is opened
	- Set window and canvas width/height
	- Set theme
	- Adds event listeners for various elements in application
*****************************************************************/
window.onload=function(){
	var themes = document.getElementById('themes');
	var themesList = document.getElementById('themes-list');
	var shortcutsList = document.getElementById('shortcuts-list');
	var overlay = document.getElementById('overlay');
	var canvas = document.getElementById('canvas');
	var error1 = document.getElementById('error1');
	var error1text = document.getElementById('error1text');
	var input = document.getElementById('input');
	var addTab = document.getElementById('add-tab');
	var tabLeft = document.getElementById('tab-left');
	var tabRight = document.getElementById('tab-right');
	var feedbackLink = document.getElementById('feedback-link');
	canvas = document.getElementById('canvas');
	context = canvas.getContext('2d');
	
	getSettings();
	cleanUp();
	window.resizeTo(tsWidth,tsHeight);  // Size window to 600x400 plus window border (border 16x39)
	canvas.width = windowWidth;  // Set the canvas width to 600
	canvas.height = windowHeight;  // Set the canvas height to 400
	updateTheme(currentTheme);  // Set the theme to Chalk
	updateApp();  // Refresh the app at 11pm every night
	
	addTab.addEventListener('click', createTab); // Listener - New tab
	
	themesList.addEventListener('mouseenter', function(){  // Add Listener - Pops theme list button out from the edge of window
		themesList.className = 'hover';
	});
	themesList.addEventListener('mouseleave', function(){  // Add Listener - Slides theme list button into the edge of window
		themesList.className = '';
	});
	themesList.addEventListener('click', function(){  // Add Listener - Displays theme list and overlay
		themesList.className = 'expanded';
		overlay.className = 'active-overlay';
	});
	themesList.addEventListener('mouseleave', function(){  // Add Listener - Hide theme list and overlay
		themesList.className = '';
		overlay.className = 'inactive-overlay';
	});
	shortcutsList.addEventListener('mouseenter', function(){  // Add Listener - Pops link list button out from the edge of window
		shortcutsList.className = 'hover';
	});
	shortcutsList.addEventListener('mouseleave', function(){  // Add Listener - Slides link list button into the edge of window
		shortcutsList.className = '';
	});
	shortcutsList.addEventListener('click', function(){  // Add Listener - Displays link list and overlay
		shortcutsList.className = 'expanded';
		overlay.className = 'active-overlay';
	});
	shortcutsList.addEventListener('mouseleave', function(){  // Add Listener - Hide link list and overlay
		shortcutsList.className = '';
		overlay.className = 'inactive-overlay';
	});
	
	error1.addEventListener('mouseover', function(){  // Add Listener - Displays error text when hovering on the !-icon
		if(input.value === ''){
			error1text.style.color = '#ff0000';
			error1text.className = 'active';  // Error - User must enter text in the input field
		}
		else{
			error2text.style.color = '#ff0000';  // Error - User must click the add(+) button
			error2text.className = 'active';			
		}
	});
	error1.addEventListener('mouseout', function(){  // Add Listener - Hides error text
		error1text.className = 'inactive';
		error2text.className = 'inactive';
	});
	
	input.addEventListener('input', function(){  // Add Listener - Clear error after user types in the input field
		input.style.border = inputStyle;
		error1.className = 'inactive';
		error1text.className = 'inactive';
	});
	
	tabLeft.addEventListener('click', function(){  // Add Listener - Move active tab to the left
		if(activeIndex > 0){
			--activeIndex;
			tabArray[activeIndex].activate();
		}
	});
	tabRight.addEventListener('click', function(){  // Add Listener - Move active tab to the right
		if(activeIndex < tabArray.length - 1){
			++activeIndex;
			tabArray[activeIndex].activate();
		}
	});
	feedbackLink.addEventListener('mouseenter', function(){  //Add Listener - Change text on hover
		feedbackLink.innerHTML = '[-]feedback';
	});
	feedbackLink.addEventListener('mouseleave', function(){  //Add Listener - Change text on hover
		feedbackLink.innerHTML = '[+]feedback';
	});
};

/*************************************************
	Create Tab
	
	- Called when user clicks the add(+) button
	- Creates a new Tab using class below
	- Adds event listeners for the tab
	- Adds the tab to the tab array
*************************************************/
function createTab(){
	var input = document.getElementById('input');
	var newTab = new Tab(input.value);  // New Tab using class below

	activeName = input.value;  // Store the user input as global variable
	input.value = '';  // Clear input field

	var check = verifyComputerName(); // Verify input
	
	if(check === 0){
		newTab.create();
		
		newTab.closeButton.addEventListener('click', newTab.destroy);  // Add Listener - Destroy tab when close button is clicked
		newTab.tab.addEventListener('click', newTab.activate);  // Add Listener - Make tab active when clicked
		tabArray.push(newTab);  // Add tab to tab array
		tabArray[tabArray.length - 1].activate();  // Set new tab as active
	}
}

/*************************************************
	Submit Suggestion
	
	- Called when user clicks the Submit button
	- Writes text in textarea box to a text file
	- Output: ".\_out\suggestions.txt"
*************************************************/
function submitSuggestion(){
	var suggestionText = document.getElementById('suggestiontext');
	var obj = new ActiveXObject("Scripting.FileSystemObject");  // Access the FileSystemObject
	var file = obj.OpenTextFile("_out\\suggestions.txt", 8, true)  //Open file and append to it
	var net = new ActiveXObject("WScript.Network");
	var user = net.UserName;
	var separator = "----------------------------"  // Separate text with this variable
 
	file.WriteLine(Date());  // Date
	file.WriteLine(user);
	file.WriteLine(separator);  // ----------------------------
	file.WriteLine('  ' + suggestiontext.value);  // Input from text box
	file.WriteLine(separator);  // ----------------------------
	file.WriteLine();  // Newline
	file.close();  // Close file
	
	suggestionText.value = '';  // Clear text box
	toggleSuggestion('close');  // Close suggestion form in the app
}

/*************************************************
	Update App
	
	- Checks the time every hour
	- Refreshes the app at 11pm
*************************************************/
function updateApp(){
	var now = new Date();  // Get the time now
	var hour = now.getHours();  // Get only the hour
	var day = now.getDay();
	
	updater = createTimer(updater, updateApp, 60 * 60 * 1000);  // Run this function once an hour

	if(hour === 22 && day === 0){  // At 10pm Sunday, set the app as not updated
		updated = false;
		saveSettings();
	}
	if(hour === 23 && day === 0 && updated === false){  // At 11pm Sunday, if the app is not updated, refresh
		updated = true;
		saveSettings();
		location.reload(true);
	}
}

function cleanUp(){
	var obj = new ActiveXObject("Scripting.FileSystemObject");  // Access the FileSystemObject
	var net = new ActiveXObject("WScript.Network");
	var user = net.UserName;
	var path = "c:\\temp\\ts";
	var file = "c:\\users\\" + user + "\\_toolset\\settings_test.config"
	
	if(obj.FolderExists(path)){
		obj.DeleteFolder(path);
	}
	if(obj.FileExists(file)){
		obj.DeleteFile(file);
	}

}

/*************************************************
	Save Settings
	
	- Writes window size and theme to text file
	- Output: "C:\Temp\ts\settings.config"
*************************************************/
function saveSettings(){
	var obj = new ActiveXObject("Scripting.FileSystemObject");  // Access the FileSystemObject
	var net = new ActiveXObject("WScript.Network");
	var user = net.UserName;
	var path = "c:\\users\\" + user + "\\_toolset\\"
	var file;
	
	if(!obj.FolderExists(path)){
		var temppath = obj.CreateFolder(path);
	}

	file = obj.OpenTextFile(path + "settings.config", 2, true);  // Open file and write to it
	
	file.WriteLine(windowWidth + 16);  // Save window width (16 for the window border)
	file.WriteLine(windowHeight + 39);  // Save window height (39 for the window border)
	file.WriteLine(currentTheme);  // Save current theme
	file.WriteLine(updated);  // Save whether the app has been updated or not
	
	file.close();
}
function getSettings(){
	var obj = new ActiveXObject("Scripting.FileSystemObject");
	var net = new ActiveXObject("WScript.Network");
	var user = net.UserName;
	var path = "c:\\users\\" + user + "\\_toolset\\"
	var file

	if(obj.FileExists(path + "settings.config")){
		file = obj.OpenTextFile(path + "settings.config", 1, false);
		tsWidth = file.ReadLine();
		tsHeight = file.ReadLine();
		
		if(file.AtEndOfStream)
			currentTheme = 'chalk';
		else
			currentTheme = file.ReadLine();
		
		if(file.AtEndOfStream)
			updated = true;
		else
			updated = file.ReadLine();
		
		file.close();	
	}
	else{
		tsWidth = 616;
		tsHeight = 439;
		currentTheme = 'chalk';
		updated = true;
	}	
}

function toggleSuggestion(toggle){
	var suggestionBox = document.getElementById('suggestion-box');
	var overlay = document.getElementById('overlay');
	
	if(toggle === 'open'){
		suggestionBox.className = '';
		overlay.className = 'active-overlay'
	}
	if(toggle === 'close'){
		suggestionBox.className = 'inactive';
		overlay.className = 'inactive-overlay'
	}
}

/*****************

	Class: Tab

*****************/
function Tab(value){
	var tabs = document.getElementById('tabs');
	var tabRight = document.getElementById('tab-right');
	var allTabs = document.getElementsByClassName('tab');
	var allClose = document.getElementsByClassName('tab-close');
	var i = this;  // Variable i used to access this Tab
	i.value = value;  // Set this value to user input
	
	/*********************************************************************
		Tab: Create
		- Creates this Tab made of a 'tab' button and a 'close' button
	*********************************************************************/
	i.create = function(){
		i.tab = document.createElement('button');
		i.closeButton = document.createElement('button');

		/***NOTE*** 
		- The element IDs below must have the added text ('-tab' and '-close-button') to the value to prevent code injection
		--------------------------------------------------------------------------------------------------------------------*/
		i.tab.id = i.value + '-tab';  // Element id is set to the computer name and '-tab'
		i.tab.innerHTML = i.value;  // Element text is set to the computer name
		i.closeButton.id = i.value + '-close-button';  // Element id is set to the computer name and '-close-button'
		i.closeButton.innerHTML = 'X';  // Element text is set to 'X'
		
		tabs.appendChild(i.closeButton);  // Add elements to parent DOM
		tabs.appendChild(i.tab);
	};
	
	/****************************************
		Tab: Destroy
		- Destroys this Tab and cleans up
	****************************************/
	i.destroy = function(){ 
		tabs.removeChild(i.tab);  // Remove elements from parent DOM
		tabs.removeChild(i.closeButton);
		i.closeButton.removeEventListener('click', i.destroy);  // Remove Listener - Remove this Tab listener
		i.tab.removeEventListener('click', i.activate);  // Remove Listener - Remove this Tab listener
 		if(activeName === i.tab.id){  // Clear active global items
			activeTab = '';
			activeName = '';
		}
		tabArray.splice(tabArray.indexOf(i), 1);  // Remove this Tab from tab array
		if(activeIndex < tabArray.indexOf(i)){  // When the closed tab is to the right of the active tab
			//Do nothing
		}
		else if(activeIndex > tabArray.indexOf(i)){  // When the closed tab is to the left of the active tab
			if(activeIndex > 0)  // Prevents the active index from getting set to -1
				--activeIndex;  // The active tab moves down 1 in the array so the index must be decreased 1
		}
		else if(activeIndex === tabArray.indexOf(i)){  // When the closed tab is the active tab
			if(activeIndex > 0){  // Prevents the active index from getting set to -1
				--activeIndex;  // Move the active index to the left
			}
			else{
				++activeIndex;  // Otherwise move it right
			}
			activeTab = tabArray[activeIndex].tab;  // Reassign active items
			activeName = tabArray[activeIndex].value;
		}
		if(tabArray.length > 0)
			tabArray[activeIndex].activate();  // Activate new active tab if there are any left
		else if (tabArray.length === 0){
			activeIndex = '';
			activeTab = '';
			activeName = '';
		}
	};
	
	/*********************************************
		Tab: Activate
		- Activates this tab as the active tab
	*********************************************/
	i.activate = function(){
		activeTab = i.tab;  // Make this Tab active
		activeName = i.value;
		for(var a = 0; a < allTabs.length; a++){  // Set all tabs inactive first
			allTabs[a].className = 'tab inactive';
			allClose[a].className = 'tab-close inactive';
		}
		activeIndex = tabArray.indexOf(i);  // This Tab is set to active
		i.tab.className = 'tab';  // Make this Tab elements active
		i.closeButton.className = 'tab-close';
	};
}

/*********************************************
	Verify Computer Name
	
	- Checks for text in the input field
	- Displays error if no text is entered
*********************************************/
function verifyComputerName(){
	var input = document.getElementById('input');
	var error1 = document.getElementById('error1');
	var error1text = document.getElementById('error1text');
	var error2text = document.getElementById('error1text');
	
	//  Automatically add a new tab if there is a value in the input field
	if(input.value !== '')
		createTab();
	
	//May be DEPRECATED...
	if(activeName === ''){  // Show error and return 1 if input field is empty
		error1text.style.color = '#ff0000';
		input.style.border = 'solid 1px #ff0000';
		error1.className = 'active';
		return 1;
	}
	else{  // Otherwise clear error and return 0
		input.style.border = 'solid 1px #808080';
		error1.className = 'inactive';
		return 0;
	}
}

/**************************************************************
	On Window Resize
	
	- Adjust canvas size to match inner window width/height
	- Displays window stats
**************************************************************/
window.onresize=function(){
	var canvas = document.getElementById('canvas');
	var info = document.getElementById('info');
	var windowInfo = document.getElementById('window-info');
	var feedbackLink = document.getElementById('feedback-link');
	var suggestionTitle = document.getElementById('suggestion-title');

	windowWidth = window.innerWidth;
	windowHeight = window.innerHeight;
	
	saveSettings();

/* 	if(windowWidth <= 520){
		feedbackLink.innerHTML = '[+]';
	}
	if(windowWidth > 520){
		feedbackLink.innerHTML = '[+]feedback';
	}
 */	if(windowWidth <= 310){
		suggestionTitle.innerHTML = 'Suggestion:';
	}
	if(windowWidth > 310){
		suggestionTitle.innerHTML = 'Write a suggestion below:';
	}
	
	info.style.visibility = 'visible';
	canvas.width = windowWidth;
	canvas.height = windowHeight;
	windowInfo.innerHTML = windowWidth + ' x ' + windowHeight;
	resizeHandler();
	canvasHandler(currentTheme);
};

/*********************
	Resize Handler
*********************/
function resizeHandler(){
	if(resize == false){
		if(resizeTimer != undefined){
			clearTimeout(resizeTimer);
		}
		resizeTimer = setTimeout("resetSize();", 500);
	}
}
/*****************
	Reset Size
*****************/
function resetSize(){
	clearTimeout(resizeTimer);
	resizeTimer = setTimeout("resetComplete();", 1000);
	resize = true;
}
/*********************
	Reset Complete
*********************/
function resetComplete(){
	var info = document.getElementById('info');

	info.style.visibility = 'hidden';
	clearTimeout(resizeTimer);
    resize = false;
}
