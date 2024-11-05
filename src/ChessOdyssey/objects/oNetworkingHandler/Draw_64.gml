var w_ratio = global.menu_width/room_width;
var h_ratio = global.menu_height/room_height; 

ini_open("Data/Localization/localization_"+global.gameLanguage+".ini");
var waiting_opponent = ini_read_string("MiscText", "WaitingOpponent", "");
var starting_in = ini_read_string("MiscText", "StartingIn", "");
var connection_rejected = ini_read_string("MiscText", "ConnectionRejected", "");
var winner_is = ini_read_string("MiscText", "WinnerIs", "");
var display_port = ini_read_string("MiscText", "Port", "");
var display_room_code = ini_read_string("MiscText", "RoomCode", "");
ini_close();

if(global.connectionMode == "server")
{
	drawSetup(0.8, c_white, fnMedium);
	draw_rectangle((room_width - string_width(display_port+string(port)) - 32 - 48)*w_ratio, 4*h_ratio, (room_width-4)*w_ratio, 48*h_ratio, false);
	drawSetup(1, c_black, fnMedium);
	draw_text_transformed((room_width - string_width(display_port+string(port)) - 32)*w_ratio, 32*h_ratio, display_port + string(port), w_ratio, h_ratio, 0);
	
	var existsEnemy = false;
	with(oGrid)
	{
		if(pieceType == "Enemy")
		{
			existsEnemy = true;
		}
	}
	
	if(!existsEnemy && !oGameHandler.gameEnded && !oGameHandler.gameStarted)
	{
		drawSetup(1, c_green, fnBig, fa_center, fa_middle);
		draw_text_transformed((room_width/2)*w_ratio, 64*h_ratio, waiting_opponent, w_ratio, h_ratio, 0);
	}
	else
	{
		if(!oGameHandler.gameStarted)
		{
			drawSetup(1, c_green, fnBig, fa_center, fa_middle);
			draw_text_transformed((room_width/2)*w_ratio, 64*h_ratio, starting_in+string(oGameHandler.starting)+"...", w_ratio, h_ratio, 0);
		}
	}
	
}
else if(global.connectionMode == "client_host")
{
	var existsEnemy = false;
	with(oGrid)
	{
		if(pieceType == "Enemy")
		{
			existsEnemy = true;
		}
	}
	if(!existsEnemy && !oGameHandler.gameEnded && !oGameHandler.gameStarted)
	{
		drawSetup(1, c_green, fnBig, fa_center, fa_middle);
		draw_text_transformed((room_width/2)*w_ratio, 64*h_ratio, waiting_opponent, w_ratio, h_ratio, 0);
	}
	else
	{
		if(!oGameHandler.gameStarted)
		{
			drawSetup(1, c_green, fnBig, fa_center, fa_middle);
			draw_text_transformed((room_width/2)*w_ratio, 64*h_ratio, starting_in+string(oGameHandler.starting)+"...", w_ratio, h_ratio, 0);
		}
	}
}
else if(global.connectionMode == "client")
{
	if(isConnected >= 0)
	{
		if(!oGameHandler.gameStarted)
		{
			drawSetup(1, c_green, fnBig, fa_center, fa_middle);
			draw_text_transformed((room_width/2)*w_ratio, 64*h_ratio, starting_in+string(oGameHandler.starting)+"...", w_ratio, h_ratio, 0);
		}
	}
	else
	{
		drawSetup(1, c_red, fnBig, fa_center, fa_middle);
		draw_text_transformed((room_width/2)*w_ratio, 64*h_ratio, connection_rejected, w_ratio, h_ratio, 0);
	}
}
if(instance_exists(oGameHandler))
{
	if(oGameHandler.gameEnded)
	{
		drawSetup(1, c_olive, fnBig, fa_center, fa_middle);
		draw_text_transformed((room_width/2)*w_ratio, 64*h_ratio, winner_is+winner+"!", w_ratio, h_ratio, 0);
	}
}

if(global.connectionMode == "client_host")
{
	drawSetup(0.8, c_white, fnMedium);
	draw_rectangle((room_width - string_width(display_room_code+string(roomCode)) - 32 - 48)*w_ratio, 4*h_ratio, (room_width - 4)*w_ratio, 48*h_ratio, false);
	drawSetup(1, c_black, fnMedium);
	draw_text_transformed((room_width - string_width(display_room_code+string(roomCode)) - 32)*w_ratio, 32*h_ratio, display_room_code + string(roomCode), w_ratio, h_ratio, 0);
}
