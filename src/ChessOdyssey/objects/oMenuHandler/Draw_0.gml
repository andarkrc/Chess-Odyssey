if(room == rServerSelect)
{
	drawSetup(0.5, c_white);
	draw_rectangle(64, 64 + 64, room_width - 128, 64 + room_height - 256+16, false);
	drawSetup(1, c_black);
	draw_rectangle(64, 64 + 64, room_width - 128, 64 + room_height - 256+16, true);
	
	with(oButtonGeneral)
	{
		drawSetup(1);
		if(type == "PublicTickBox" || type == "OnlineTickBox")
		{
			draw_sprite(sPublicTickBoxIcon, ticked, x + 192, y);
		}
	}
}
else if(room == rMainMenu || room == rMainMenuP)
{
	drawSetup(1, c_black, fnSmall);
	draw_text(8, room_height - 12, global.gameVersion);
}
else if(room == rServerSelectP)
{
	drawSetup(0.5, c_white);
	draw_rectangle(64, 64 + 128, room_width - 64, 64 + room_height - 256+16, false);
	drawSetup(1, c_black);
	draw_rectangle(64, 64 + 128, room_width - 64, 64 + room_height - 256+16, true);
	
	with(oButtonGeneral)
	{
		drawSetup(1);
		if(type == "PublicTickBox" || type == "OnlineTickBox")
		{
			draw_sprite(sPublicTickBoxIcon, ticked, x + 192, y);
		}
		if(type == "Refresh")
		{
			draw_sprite(sRefreshButtonIcon, 0, x, y);
		}
	}
}