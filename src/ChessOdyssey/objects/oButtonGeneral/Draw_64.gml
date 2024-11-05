var w_ratio = global.menu_width/room_width;
var h_ratio = global.menu_height/room_height;

//Draw the button's background
drawSetup(max(selected, targeted, tab_targeted)/3+0.6, displayBackgroundColor);
draw_rectangle(x*w_ratio, y*h_ratio, (x + width)*w_ratio, (y + height)*h_ratio, false);

//Draw the button's border
if(hasBorder)
{
	drawSetup(1, c_black);
	draw_rectangle(x*w_ratio, y*h_ratio, (x + width)*w_ratio, (y + height)*h_ratio, true);
}

//Draw the button's main text
drawSetup(1, mainFontColor, mainFont, mainHAlign, mainVAlign);
if(string_width(mainText) > width-16)//Adapt the text to the button's size
{
	if(mainFont == fnMedium)
	{
		mainFont = fnSmall;
	}
	else if(mainFont == fnSmall)
	{
		mainFont = fnTiny;
	}
}
drawSetup(1, mainFontColor, mainFont, mainHAlign, mainVAlign);
draw_text_transformed((x + width/2)*w_ratio, (y + height/2)*h_ratio, mainText, w_ratio, h_ratio, 0);

//Draw the button's extra text
if(global.orientation == "landscape")
{
	drawSetup(selected+0.3, extraFontColor, extraFont, extraHAlign, extraVAlign);
	draw_text_transformed((x + width + 16)*w_ratio, (y + height/2)*h_ratio, extraText, w_ratio, h_ratio, 0);
} else if(global.orientation == "portrait")
{
	drawSetup(selected+0.3, extraFontColor, extraFont, fa_center, fa_middle);
	if(string_width(extraText) > room_width-16)//Adapt the text to the room's size
	{
		if(extraFont == fnMedium)
		{
			extraFont = fnSmall;
		}
		else if(extraFont == fnSmall)
		{
			extraFont = fnNotSoTiny;
		}
	}
	drawSetup(selected+0.3, extraFontColor, extraFont, fa_center, fa_middle);
	draw_text_transformed((x + width/2)*w_ratio, (y + height + 32)*h_ratio, extraText, w_ratio, h_ratio, 0);
}

//Draw the button's icon
if(specialIcon != "NaN")
{
	drawSetup(1);
	draw_sprite_stretched(asset_get_index(specialIcon), 0, x*w_ratio, y*h_ratio, sprite_get_width(asset_get_index(specialIcon))*w_ratio, sprite_get_height(asset_get_index(specialIcon))*h_ratio);
}