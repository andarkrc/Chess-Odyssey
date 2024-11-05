var w_ratio = global.menu_width/room_width;
var h_ratio = global.menu_width/room_width;

if(can_display_chat == true)
{
	if(global.orientation == "landscape")
	{
		drawSetup(0.8, c_white);
		draw_rectangle((room_width - 896 + 64)*w_ratio, (192+32)*h_ratio, (room_width - 48)*w_ratio, (2*room_height/3+96)*h_ratio, false);
		drawSetup(1, c_black, fnMedium, fa_left, fa_middle);
		draw_rectangle((room_width - 896 + 64)*w_ratio, (192+32)*h_ratio, (room_width - 48)*w_ratio, (2*room_height/3+96)*h_ratio, true);

		var i = 0;
		var yy = 192+80;
		for(i = max_message_display; i >= 1; i--)
		{
			if(chatMessages[i].chatMessage != "")
			{
				if(chatMessages[i].messageOwner != chatMessages[i+1].messageOwner)
				{
					if(chatMessages[i].messageOwner == "other")
					{
						drawSetup(1, c_red, fnMedium, fa_left, fa_middle);
						draw_text_transformed((room_width - 896 + 80)*w_ratio, yy*h_ratio, chatMessages[i].messageSender, w_ratio, h_ratio, 0);
						yy += 64;
					}
					else
					{
						drawSetup(1, c_blue, fnMedium, fa_right, fa_middle);
						draw_text_transformed((room_width - 64)*w_ratio, yy*h_ratio, chatMessages[i].messageSender, w_ratio, h_ratio, 0);
						yy += 64;
					}
				}
				if(chatMessages[i].messageOwner == "other")
				{
					drawSetup(1, c_black, fnMedium, fa_left, fa_middle);
					draw_text_transformed((room_width - 896 + 80)*w_ratio, yy*h_ratio, chatMessages[i].chatMessage, w_ratio, h_ratio, 0);
					yy += 64;
				}
				else
				{
					drawSetup(1, c_black, fnMedium, fa_right, fa_middle);
					draw_text_transformed((room_width - 64)*w_ratio, yy*h_ratio, chatMessages[i].chatMessage, w_ratio, h_ratio, 0);
					yy += 64;
				}
			}
		}
	}
	else if(global.orientation == "portrait")
	{
		drawSetup(0.8, c_white);
		draw_rectangle((room_width - 896 + 64 - 896+128-32)*w_ratio, (192+32 + 128)*h_ratio, (room_width-256-64+32)*w_ratio, (2*room_height/3+96 - 192)*h_ratio, false);
		drawSetup(1, c_black, fnMedium, fa_left, fa_middle);
		draw_rectangle((room_width - 896 + 64 - 896+128-32)*w_ratio, (192+32 + 128)*h_ratio, (room_width-256-64+32)*w_ratio, (2*room_height/3+96 - 192)*h_ratio, true);

		var i = 0;
		var yy = 192+80 + 128;
		for(i = max_message_display; i >= 1; i--)
		{
			if(chatMessages[i].chatMessage != "")
			{
				if(chatMessages[i].messageOwner != chatMessages[i+1].messageOwner)
				{
					if(chatMessages[i].messageOwner == "other")
					{
						drawSetup(1, c_red, fnMedium, fa_left, fa_middle);
						draw_text_transformed((room_width - 896 + 64 - 896+128)*w_ratio, yy*h_ratio, chatMessages[i].messageSender, w_ratio, h_ratio, 0);
						yy += 64;
					}
					else
					{
						drawSetup(1, c_blue, fnMedium, fa_right, fa_middle);
						draw_text_transformed((room_width-256-64)*w_ratio, yy*h_ratio, chatMessages[i].messageSender, w_ratio, h_ratio, 0);
						yy += 64;
					}
				}
				if(chatMessages[i].messageOwner == "other")
				{
					drawSetup(1, c_black, fnMedium, fa_left, fa_middle);
					draw_text_transformed((room_width - 896 + 64 - 896+128)*w_ratio, yy*h_ratio, chatMessages[i].chatMessage, w_ratio, h_ratio, 0);
					yy += 64;
				}
				else
				{
					drawSetup(1, c_black, fnMedium, fa_right, fa_middle);
					draw_text_transformed((room_width-256-64)*w_ratio, yy*h_ratio, chatMessages[i].chatMessage, w_ratio, h_ratio, 0);
					yy += 64;
				}
			}
		}
	}
}
else
{
	with(oButtonGeneral)
	{
		if(type == "ShowChat")
		{
			if(other.new_unseen_message == true)
			{
				drawSetup(1, c_maroon);
				draw_circle((x + width)*w_ratio, (y + height)*w_ratio, 16*sqrt(w_ratio*w_ratio + h_ratio*h_ratio), false);
			}
		}
	}
}