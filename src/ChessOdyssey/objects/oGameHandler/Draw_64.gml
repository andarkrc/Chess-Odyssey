var w_ratio = global.menu_width/room_width;
var h_ratio = global.menu_height/room_height;

drawSetup(0.8, c_white, fnMedium);
ini_open("Data/Localization/localization_"+global.gameLanguage+".ini");
draw_rectangle(48*w_ratio, 32*h_ratio, 48 + 332*w_ratio, 32 + 388*h_ratio, false);
drawSetup(1, c_black, fnMedium);
draw_text_transformed(64*w_ratio, 64*h_ratio, ini_read_string("MiscText", "CooldownText", "Attack cooldown:"), w_ratio, h_ratio, 0);
draw_text_transformed(64*w_ratio, 256*h_ratio, ini_read_string("MiscText", "SuppliesText", "Supplies:"), w_ratio, h_ratio, 0);
draw_text_transformed(64*w_ratio, 448*h_ratio, ini_read_string("MiscText", "Score", "Score: ")+string(global.selfWins)+"-"+string(global.otherWins), w_ratio, h_ratio, 0);
ini_close();
draw_healthbar(64*w_ratio, 128*h_ratio, 448*w_ratio, 192*h_ratio, cooldown*100, c_aqua, c_black, c_black, 1, true, true);

draw_healthbar(64*w_ratio, 320*h_ratio, 448*w_ratio, 384*h_ratio, supplies, c_black, c_red, c_green, 0, true, true);



if(global.orientation == "landscape")
{
	if(promotingTo != "")
	{
		with(oButtonGeneral)
		{
			if(type == "Promote")
			{
				draw_sprite_stretched(asset_get_index("sMy"+other.promotingTo+global.pieceArt), 0, (x + 96)*w_ratio, (y-160)*h_ratio, 128*w_ratio, 128*h_ratio);
			}
		}
	}
	with(oButtonGeneral)
	{
		if(type == "Rematch")
		{
			var ww = sprite_get_width(sPublicTickBoxIcon);
			var hh = sprite_get_height(sPublicTickBoxIcon);
			draw_sprite_stretched(sPublicTickBoxIcon, other.rematch_self, (x+64)*w_ratio, (y-128)*h_ratio, ww*w_ratio, hh*h_ratio);
			draw_sprite_stretched(sPublicTickBoxIcon, other.rematch_enemy, (x + 128+32)*w_ratio, (y-128)*h_ratio, ww*w_ratio, hh*h_ratio);
		}
		if(type == "ShowChat")
		{
			draw_sprite_stretched(sShowChatIcon, 0, x*w_ratio, y*h_ratio, width*w_ratio, height*h_ratio);
		}
	}
}else if(global.orientation == "portrait")
{
	if(promotingTo != "")
	{
		with(oButtonGeneral)
		{
			if(type == "Promote")
			{
				draw_sprite_stretched(asset_get_index("sMy"+other.promotingTo+global.pieceArt), 0, (x + 96)*w_ratio, (y+128)*h_ratio, 128*w_ratio, 128*h_ratio);
			}
		}
	}
	with(oButtonGeneral)
	{
		if(type == "Rematch")
		{
			draw_sprite_stretched(sPublicTickBoxIcon, other.rematch_self, (x+64)*w_ratio, (y+96)*h_ratio, sprite_get_width(sPublicTickBoxIcon)*w_ratio, sprite_get_height(sPublicTickBoxIcon)*h_ratio);
			draw_sprite_stretched(sPublicTickBoxIcon, other.rematch_enemy, (x + 128+32)*w_ratio, (y+96)*h_ratio, sprite_get_width(sPublicTickBoxIcon)*w_ratio, sprite_get_height(sPublicTickBoxIcon)*h_ratio);
		}
		if(type == "ShowChat")
		{
			draw_sprite_stretched(sShowChatIcon, 0, x*w_ratio, y*h_ratio, sprite_get_width(sShowChatIcon)*w_ratio, sprite_get_height(sShowChatIcon)*h_ratio);
		}
	}
}