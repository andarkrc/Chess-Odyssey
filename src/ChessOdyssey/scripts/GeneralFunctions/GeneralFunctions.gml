///@function generateGrid
function generateGrid(){
	var startx=room_width/2-192*5;
	var starty=room_height/2-192*5;
	if(global.orientation == "landscape")
	{
		var offset = 0;
	}else if(global.orientation == "portrait")
	{
		var offset = -512+64;
	}
	for(var i = 1; i<=10; i++)
	{
		for(var j = 1; j<=10; j++)
		{
			
			global.gridTable[i][j]={
				piece : "",
				pieceType : ""
			};
			
			with(instance_create_layer(startx + (j-1)*192+6*(j-1), starty + (i-1)*192+6*(i-1)+offset, "Instances", oGrid))
			{
				row = i;
				column = j;
			}
		}
	}
}
		
///@function generateSettingsFile
function generateSettingsFile(){
	ini_open("Data/settings.ini");
	ini_write_string("Settings", "selectedFormation", "base");
	ini_write_string("Settings", "gameLanguage", "english");
	ini_write_string("Settings", "playerName", "Player");
	ini_write_string("Settings", "pieceArt", "Classic");
	ini_write_real("Settings", "soundVolume", 1);
	ini_write_real("Settings", "formationAutoSelect", 1);
	ini_close();
}

///@function generateLocalizationFiles
function generateLocalizationFiles(){
	{///Delete the files
		if(file_exists("Data/Localization/localization_english.ini"))
		{
			file_delete("Data/Localization/localization_english.ini");
		}
	
		if(file_exists("Data/Localization/localization_english_AboutGame.txt"))
		{
			file_delete("Data/Localization/localization_english_AboutGame.txt");
		}
	
		if(file_exists("Data/Localization/localization_english_Credits.txt"))
		{
			file_delete("Data/Localization/localization_english_Credits.txt");
		}
	
		if(file_exists("Data/Localization/localization_english_Tutorial.txt"))
		{
			file_delete("Data/Localization/localization_english_Tutorial.txt");
		}
		
		if(file_exists("Data/Localization/localization_english_TutorialPieces.ini"))
		{
			file_delete("Data/Localization/localization_english_TutorialPieces.ini");
		}
		if(file_exists("Data/Localization/localization_english_TutorialControls.txt"))
		{
			file_delete("Data/Localization/localization_english_TutorialControls.txt");
		}
	
		if(file_exists("Data/Localization/localization_romana.ini"))
		{
			file_delete("Data/Localization/localization_romana.ini");
		}
	
		if(file_exists("Data/Localization/localization_romana_AboutGame.txt"))
		{
			file_delete("Data/Localization/localization_romana_AboutGame.txt");
		}
	
		if(file_exists("Data/Localization/localization_romana_Credits.txt"))
		{
			file_delete("Data/Localization/localization_romana_Credits.txt");
		}
	
		if(file_exists("Data/Localization/localization_romana_Tutorial.txt"))
		{
			file_delete("Data/Localization/localization_romana_Tutorial.txt");
		}
		
		if(file_exists("Data/Localization/localization_romana_TutorialPieces.ini"))
		{
			file_delete("Data/Localization/localization_romana_TutorialPieces.ini");
		}
		if(file_exists("Data/Localization/localization_romana_TutorialControls.txt"))
		{
			file_delete("Data/Localization/localization_romana_TutorialControls.txt");
		}
	}
	generateLocalizationFileEng();	
	generateLocalizationFileRou();	
}

///@function loadGameSettings
function loadGameSettings(){
	ini_open("Data/settings.ini");
	global.selectedFormation = ini_read_string("Settings", "selectedFormation", "base");
	global.gameLanguage = ini_read_string("Settings", "gameLanguage", "english");
	global.playerName = ini_read_string("Settings", "playerName", "Player");
	global.pieceArt = ini_read_string("Settings", "pieceArt", "Classic");
	global.soundVolume = ini_read_real("Settings", "soundVolume", 1);
	global.formationAutoSelect = ini_read_real("Settings", "formationAutoSelect", -1);
	if(global.formationAutoSelect == -1)
	{
		global.formationAutoSelect = 1;
		ini_write_real("Settings", "formationAutoSelect", 1);
		loadGameSettings();
	}
	ini_close();
	audio_group_set_gain(audiogroup_default, global.soundVolume/10, 0);
}

///@function wrapString
///@param input_string
///@param wrap_size
///@param wrap_height
///@param font_used
function wrapString(input_string, wrap_size, wrap_height, font_used){
	drawSetup(1, c_white, font_used);
	if(string_width(input_string) > wrap_size || string_height(input_string) > wrap_height)
	{
		//If string is wider than the provided width(wrap_size) or height(wrap_height),  
		//wrap again with 1 less character
		var new_string = string_copy(input_string, 1, string_length(input_string) - 1);
		return wrapString(new_string, wrap_size, wrap_height,font_used);
	}
	else
	{
		if(string_height(input_string + "d") > wrap_height)
		{
			//If the string has a new line character at the end, remove it
			var new_string = string_copy(input_string, 1, string_length(input_string) - 2);
			return new_string;
		}
		else
		{
			return input_string;
		}
	}
}

///@function drawSetup
///@param alpha
///@param color
///@param font
///@param halign
///@param valign
function drawSetup(alpha = 1, color = c_black, font = fnMedium, halign = fa_left, valign = fa_middle){
		draw_set_alpha(alpha);
		draw_set_color(color);
		draw_set_font(font);
		draw_set_halign(halign);
		draw_set_valign(valign);
}
