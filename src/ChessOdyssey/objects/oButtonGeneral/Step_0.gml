var w_ratio = global.menu_width/room_width;
var h_ratio = global.menu_height/room_height;

var mouse_gx = device_mouse_x_to_gui(0);
var mouse_gy = device_mouse_y_to_gui(0);

var mouse_left_click = mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0, gp_face1);


displayBackgroundColor = backgroundColor;

if(tab_targeted || targeted)
{
	displayBackgroundColor = make_color_rgb(0, 160, 200);
}

//Check if button is selected
selected = false;
if(point_in_rectangle(mouse_gx, mouse_gy, x*w_ratio, y*h_ratio, (x + width)*w_ratio, (y + height)*h_ratio))
{
	displayBackgroundColor = make_color_rgb(60, 150, 60);
	selected = true;
}

//If the button is selected for the first time make a sound
if(wasSelected == false && selected == true)
{
	wasSelected = true;
	mySound = audio_play_sound(sndButtonHover, 1, false);
}
//If the button is no longer selected update acordingly
if(wasSelected == true && selected == false)
{
	wasSelected = false;
}
//If the button is not for the online server listing display get its text from localization file
if(mainText == "" && type != "OnlineServerList")
{
	ini_open("Data/Localization/localization_"+global.gameLanguage+".ini");
	mainText = ini_read_string("Main", type, "");
	ini_close();
}
if(extraText == "" && type != "OnlineServerList")
{
	ini_open("Data/Localization/localization_"+global.gameLanguage+".ini");
	extraText = ini_read_string("Extra", type, "");
	ini_close();
}
//If the left mouse button is pressed perform the click action
if(mouse_left_click)
{
	if(selected)
	{
		audio_play_sound(sndButtonClick, 10, false);
		mySound = audio_play_sound(sndButtonClick, 10, false);
		leftClickAction();
	}
}
