var w_ratio = global.menu_width/room_width;
var h_ratio = global.menu_height/room_height;

var mouse_gx = device_mouse_x_to_gui(0);
var mouse_gy = device_mouse_y_to_gui(0);
var mouse_left_click = mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0, gp_face1);
selected = false;
displayBackgroundColor = backgroundColor;
if(point_in_rectangle(mouse_gx, mouse_gy, x*w_ratio, y*h_ratio, (x + width)*w_ratio, (y + height)*h_ratio))
{
	displayBackgroundColor = make_color_rgb(60, 150, 60);
	selected = true;
}
if(mouse_left_click)
{
	if(selected)
	{
		mySound = audio_play_sound(sndButtonClick, 2, false);
	}
	if(canWrite == false && selected == true)
	{
		keyboard_string = text;
		canWrite = true;
	}	
	if(canWrite == true && selected = false)
	{
		canWrite = false;
		keyboard_string = "";
	}
}
var textboxactive = false;
with(oTextBox)
{
	if(canWrite)
	{
		textboxactive = true;
	}
}

if(textboxactive)
{
	if(!keyboard_virtual_status())
	{
		keyboard_virtual_show(kbv_type_default, kbv_returnkey_default, kbv_autocapitalize_none, false);
	}
}
else
{
	if(keyboard_virtual_status())
	{
		keyboard_virtual_hide();
	}
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
if(canWrite && keyboard_lastkey != 0)
{	
	if(keyboard_lastkey == vk_enter || (keyboard_lastkey == 10 && keyboard_virtual_status()))
	{
		if(canWrite)
		{
			if(keyboard_virtual_status())
			{
				keyboard_virtual_hide();
			}
			canWrite = false;
			if(text != "")
			{
				enterAction();
			}
		}
	}
	if(canWrite)
	{
		if(!keyboard_check(vk_lcontrol) && (keyboard_lastkey != vk_enter || keyboard_lastkey != vk_return))
		{
			text = keyboard_string;
			text = wrapString(text, width-32, height+16,font);
			keyboard_string = text;
		}
		else if(keyboard_check(vk_lcontrol))
		{
			if(keyboard_lastkey == ord("V"))
			{
				text += clipboard_get_text();
				keyboard_string = text;
				text = wrapString(text, width-32, height+16,font);
				keyboard_string = text;
			}
		}	
	}
	keyboard_lastkey = 0;
}
