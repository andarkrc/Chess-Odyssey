selected = false;
if(point_in_rectangle(mouse_x, mouse_y, x + posTL.xx, y + posTL.yy, x + posBR.xx, y + posBR.yy))
{
	selected = true;
}
if(wasSelected == false && selected == true)
{
	wasSelected = true;
	mySound = audio_play_sound(sndButtonHover, 1, false);
}
if(wasSelected == true && selected == false)
{
	wasSelected = false;
}
if(mainText == "" && type != "OnlineServerList")
{
	ini_open("Data/Localization/localization_"+global.gameLanguage+".ini");
	mainText = ini_read_string("Main", type, "");
	extraText = ini_read_string("Extra", type, "");
	ini_close();
}
if(mouse_check_button_pressed(mb_left))
{
	if(selected)
	{
		mySound = audio_play_sound(sndButtonClick, 2, false);
		clickAction();
	}
}