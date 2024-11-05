type = "";
text = "";
ghostText = "";
font = fnMedium;
canWrite = false;
flash = false;

//Set flashing
var func = function(){
	switch(flash)
	{
		case true : flash = false;break;
		default : flash = true;break;
	}
}
flashTimer = time_source_create(time_source_game, 1, time_source_units_seconds, func, [], -1);
time_source_start(flashTimer);


width = 320;
height = 64;

selected = false;
wasSelected = true;
mySound = -1;
displayBackgroundColor = c_white;
backgroundColor = c_white;

active = false;
var func = function(){
	active = true;
}

buttonActivator = time_source_create(time_source_game, 1/3, time_source_units_seconds, func);
time_source_start(buttonActivator);

///@function enterAction
enterAction = function(){
	//Stuff
}