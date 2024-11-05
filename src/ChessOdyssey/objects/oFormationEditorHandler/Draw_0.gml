if(errorMessage != "")
{
	drawSetup(1, c_red, fnNotSoTiny, fa_left, fa_middle);
	if(string_width(errorMessage) >= string_width("Use all the pieces before savin"))
	{
		drawSetup(1, c_red, fnTiny, fa_left, fa_middle);
	}
	draw_text(x + 208+64+32, y + 4, errorMessage);
}