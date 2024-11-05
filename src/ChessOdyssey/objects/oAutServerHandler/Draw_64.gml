ini_open("Data/Localization/localization_"+global.gameLanguage+".ini");
if(isConnected < 0)
{
	drawSetup(1, c_red, fnSmall);
	draw_text(32, 16, ini_read_string("MiscText", "ConnectionFailed", "Connection to the auth. server failed."));
}
else
if(waitingForResponse == true)
{
	drawSetup(1, #E68000, fnSmall);
	draw_text(32, 16, ini_read_string("MiscText", "ConnectionWaiting", "Connecting to the relay server..."));
}
else
{
	drawSetup(1, c_green, fnSmall);
	draw_text(32, 16, ini_read_string("MiscText", "ConnectionResolved", "Connected to the auth. server."));
	if(oMenuHandler.connectionType == "Online" && total_servers != 0)
	{
		if(global.orientation == "landscape")
		{
			drawSetup(1, c_black, fnMedium);
			draw_text(96, 160, string(server_level+1)+"/"+string(floor((total_servers-1)/3+1)));
		}
		else if(global.orientation == "portrait")
		{
			drawSetup(1, c_black, fnMedium, fa_center, fa_middle);
			draw_text(room_width/2, room_height-384+48, string(server_level+1)+"/"+string(floor((total_servers-1)/3+1)));
		}
	} 
}
if(oMenuHandler.connectionType == "Online" && total_servers == 0)
{
	if(global.orientation == "landscape")
	{
		drawSetup(1, c_maroon, fnMedium);
		draw_text(96, 192, ini_read_string("MiscText", "NoServersFound", "No online matches found :("));
	}else if(global.orientation == "portrait")
	{
		drawSetup(1, c_maroon, fnNotSoSmall);
		draw_text(96, 224, ini_read_string("MiscText", "NoServersFound", "No online matches found :("));
	}
}
if(global.orientation == "landscape")
{
	drawSetup(1, c_black, fnSmall, fa_right);
	draw_text(room_width-32, 16, ini_read_string("MiscText", "ServersOpen", "Online servers are open between 14:00 - 19:00 CEST."));
}
else if(global.orientation == "portrait")
{
	drawSetup(1, c_black, fnSmall, fa_left);
	draw_text(32, 48, ini_read_string("MiscText", "ServersOpen", "Online servers are open between 14:00 - 19:00 CEST."));
}
ini_close();