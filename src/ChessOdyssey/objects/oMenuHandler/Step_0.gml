var controller_input_joy_h = gamepad_axis_value(0, gp_axislh);
var controller_input_joy_v = gamepad_axis_value(0, gp_axislv);
controller_input_joy_h = abs(controller_input_joy_h) > 0.2 ? controller_input_joy_h : 0;
controller_input_joy_v = abs(controller_input_joy_v) > 0.2 ? controller_input_joy_v : 0;
var default_dist = 5;
if(gamepad_button_check(0, gp_shoulderlb)) default_dist = 10;
var newx = clamp(window_mouse_get_x() + default_dist*controller_input_joy_h, 0, window_get_width());
var newy = clamp(window_mouse_get_y() + default_dist*controller_input_joy_v, 0, window_get_height());
if(controller_input_joy_h != 0 || controller_input_joy_v != 0)
{
	window_mouse_set(newx, newy);
}
if(room == rServerSelect || room == rServerSelectP)
{
	if(connectionType == "Host")
	{
		with(oButtonGeneral)
		{
			if(type == "Connect")
			{
				type = "HostConnect";
				mainText = "";
				textOffset = {
					xx : 56,
					yy : 48
				};
			}
		}
	}
	else
	{
		with(oButtonGeneral)
		{
			if(type == "HostConnect")
			{
				type = "Connect";
				mainText = "";
				textOffset = {
					xx : 16,
					yy : 48
				};
			}
		}
	}
	var button_types = ["Direct", "Online", "RoomCode", "Host"];
	var connection_types = ["Direct", "Online", "Code", "Host"];
	with(oButtonGeneral)
	{
		
		if(array_contains(button_types, type))
		{
			tab_targeted = false;
			displayBackgroundColor = c_white;
		}
		if(array_contains(connection_types, other.connectionType))
		{
			var i = array_get_index(connection_types, other.connectionType);
			if(type == button_types[i])
			{
				tab_targeted = true;
				displayBackgroundColor = c_ltgray;
			}
		}
	}
}

if(room == rInfoMenu || room == rInfoMenuP)
{
	var button_types1 = ["InfoAbout", "InfoCredits", "InfoTutorial"];
	var tab_types1 = ["AboutGame", "Credits", "Tutorial"];
	var button_types2 = ["TutorialGeneralSection", "TutorialPiecesSection", "TutorialControlsSection"];
	var tab_types2 = ["General", "Pieces", "Controls"];
	with(oButtonGeneral)
	{
		
		if(array_contains(button_types1, type))
		{
			tab_targeted = false;
			displayBackgroundColor = c_white;
		}
		if(array_contains(tab_types1, oInfoHandler.infoTab))
		{
			var i = array_get_index(tab_types1, oInfoHandler.infoTab);
			if(type == button_types1[i])
			{
				tab_targeted = true;
				displayBackgroundColor = c_ltgray;
			}
		}
		if(array_contains(button_types2, type))
		{
			tab_targeted = false;
			displayBackgroundColor = c_white;
		}
		if(array_contains(tab_types2, oInfoHandler.tutorialTab))
		{
			var i = array_get_index(tab_types2, oInfoHandler.tutorialTab);
			if(type == button_types2[i])
			{
				tab_targeted = true;
				displayBackgroundColor = c_ltgray;
			}
		}
	}
}
