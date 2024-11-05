var w_ratio = global.menu_width/room_width;
var h_ratio = global.menu_height/room_height;

//Draw the background
drawSetup(max(selected, canWrite)/3+0.4, displayBackgroundColor);
draw_rectangle(x*w_ratio, y*h_ratio, (x + width)*w_ratio, (y + height)*h_ratio, false);
drawSetup(1, c_black, font, fa_left, fa_middle);
draw_rectangle(x*w_ratio, y*h_ratio, (x + width)*w_ratio, (y + height)*h_ratio, true);
//Write the text
if(canWrite)
{
	if(flash)
	{
		draw_text_transformed((x + 16)*w_ratio, (y + height/2)*h_ratio, text+"|", w_ratio, h_ratio, 0);
	}
	else
	{
		draw_text_transformed((x + 16)*w_ratio, (y + height/2)*h_ratio, text, w_ratio, h_ratio, 0);
	}
}
else
{
	draw_text_transformed((x + 16)*w_ratio, (y + height/2)*h_ratio, text, w_ratio, h_ratio, 0);
	if(text == "")
	{
		draw_text_transformed((x + 16)*w_ratio, (y + height/2)*h_ratio, ghostText, w_ratio, h_ratio, 0);
	}
}