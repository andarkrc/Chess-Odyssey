width = 128;
height = 64;

mySound = -1;
type = "";

mainText = "";
mainFont = fnMedium;
mainVAlign = fa_middle;
mainHAlign = fa_center;
mainFontColor = c_black;

extraText = "";
extraFont = fnSmall;
extraVAlign = fa_middle;
extraHAlign = fa_left;
extraFontColor = c_black;

backgroundColor = c_white;
displayBackgroundColor = c_white;
hasBorder = true;
specialIcon = "NaN";

selected = false;
wasSelected = true;
targeted = false;
tab_targeted = false;
cooldown = false;
scrollAffected = false;
replaceable = false;

///@function leftClickAction
leftClickAction = function(){
	//Stuff
}


var func = function(){
	cooldown = false;
}

buttonCooldownReset = time_source_create(time_source_game, 2, time_source_units_seconds, func);