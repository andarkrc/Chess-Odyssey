drawSetup(1, c_black, fnMedium, fa_left, fa_middle);
ini_open("Data/Localization/localization_"+global.gameLanguage+".ini");
with(oTextBox)
{
	if(type == "FormationName")
	{
		draw_text(x, y - 32, ini_read_string("MiscText", "SelectedFormation", "Selected formation:"));
	}
	else if(type == "PlayerName")
	{
		draw_text(x, y - 32, ini_read_string("MiscText", "PlayerName", "Your name:"));
	}
}
with(oButton)
{
	if(type == "ChangeArtStyle")
	{
		draw_text(x, y - 32, ini_read_string("MiscText", "ChangeArtStyle", "Piece art style:"));
	}
	if(type == "Language")
	{
		draw_sprite(asset_get_index("sFlag_"+global.gameLanguage), 0, x + posTL.xx + 32, y + posTL.yy + 16);
		draw_text(x, y - 32, ini_read_string("MiscText", "LanguageChange", "Language:"));
	}
	if(type == "VolumeChange")
	{
		draw_sprite(sVolumeButtonIcon, global.soundVolume, x, y);
	}
}
drawSetup(1, c_red, fnMedium, fa_center, fa_middle);
if(formationError)
{
	with(oTextBox)
	{
		if(type == "FormationName")
		{
			draw_text(x + (800-32)/2, y + 96, ini_read_string("MiscText", "FormationErrorNotExist", "This formation doesn't exist!"));
		}
	}
}
ini_close();