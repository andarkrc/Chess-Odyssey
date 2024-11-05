if(global.pieceArt != "3D")
{
	if((row+column) mod 2 == 1)
	{
		drawSetup(0.7, c_ltgray);
		draw_rectangle(x+1, y+1, x+sprite_width-1, y+sprite_width-1, false);
	}
	draw_self();
	drawSetup(1);
	if(mouseHover)
	{
		draw_sprite(sGrid, 1, x, y);
	}
	drawSetup(0.7);
	if(selected)
	{
		draw_sprite(sGrid, 2, x, y);
	}
	drawSetup(0.7);
	if(validAttack)
	{
		draw_sprite(sGrid, 4, x, y);
	}
	else if(validMove)
	{
		draw_sprite(sGrid, 3, x, y);
	}

	if(piece != "")
	{
		
		var piece_index = asset_get_index("s"+pieceType+piece+global.pieceArt);
		draw_sprite_ext(piece_index, 0, x, y, 1, 1, 0, c_white, 1);
	}
}
drawSetup(1, c_black, fnMedium, fa_center, fa_middle);
if(global.connectionMode == "server" || global.connectionMode == "client_host")
{
	if(column == 1)
	{
		draw_text(x - 32, y + 96, letters[row]);
	}
	if(row == 10)
	{
		draw_text(x + 96, y + 128 + 64+32, column);
	}
}
if(global.connectionMode == "client")
{
	if(column == 1)
	{
		draw_text(x - 32, y + 96, letters[10 - row + 1]);
	}
	if(row == 10)
	{
		draw_text(x + 96, y + 128 + 64+32, 10 - column + 1);
	}
}

if(row == 1 && column == 1)
{
	var xx = -224;
	var yy = 416;
	if(global.orientation == "portrait")
	{
		xx = 448;
		yy = 2432;
	}
	
	switch(global.pieceArt)
	{
		case "3D" : 
			draw_sprite(sGameName, 0, xx, yy);
			break;
		case "Classic" : 
			draw_sprite(sGameName, 0, xx, yy);
			break;
		case "Shogi" : 
			draw_sprite(sGameName, 1, xx, yy);
			break;
		default:
			draw_sprite(sGameName, 0, xx, yy);
			break;
	}
}