if(hasBackground)
{
	drawSetup(filledBackgroundAlpha, filledBackgroundColor);
	draw_rectangle(x + posTL.xx + 1, y + posTL.yy + 1, x + posBR.xx - 1, y + posBR.yy - 1, false);
}

if(selected)
{
	drawSetup(backgroundAlpha, backgroundColor);
	draw_rectangle(x + posTL.xx, y + posTL.yy, x + posBR.xx, y + posBR.yy, false);
	drawSetup(fontAlpha, fontColor, fontExtra, fontHAlign, fontVAlign);
	draw_text(x + textOffset.xx + posBR.xx - posTL.xx, y + textOffset.yy, extraText);
}

if(hasBackground)
{
	drawSetup(1, c_black);
	draw_rectangle(x + posTL.xx + 1, y + posTL.yy + 1, x + posBR.xx - 1, y + posBR.yy - 1, true);
}

drawSetup(fontAlpha, fontColor, fontMain, fontHAlign, fontVAlign);
if(string_width(mainText) > posBR.xx)
{
	if(fontMain == fnMedium)
	{
		fontMain = fnSmall;
	}
	else if(fontMain == fnSmall)
	{
		fontMain = fnTiny;
	}
}
drawSetup(fontAlpha, fontColor, fontMain, fontHAlign, fontVAlign);
draw_text(x + textOffset.xx, y + textOffset.yy, mainText);
