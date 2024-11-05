var w_ratio = global.menu_width/room_width;
var h_ratio = global.menu_height/room_height;

if(global.orientation == "landscape")
{
	draw_sprite_stretched(sGrid, 0, x*w_ratio, y*h_ratio, 128*w_ratio, 128*h_ratio);
	if(mouseHover)
	{
		draw_sprite_stretched(sGrid, 1, x*w_ratio, y*h_ratio, 128*w_ratio, 128*h_ratio);
	}
	if(piece != "")
	{
		draw_sprite_stretched(asset_get_index("s"+pieceType+piece+global.pieceArt), 0, x*w_ratio, y*h_ratio, 128*w_ratio, 128*h_ratio);
	}
}
else if(global.orientation == "portrait")
{
	draw_sprite_stretched(sGrid, 0, x*w_ratio, y*h_ratio, 96*w_ratio, 96*h_ratio);
	if(mouseHover)
	{
		draw_sprite_stretched(sGrid, 1, x*w_ratio, y*h_ratio, 96*w_ratio, 96*h_ratio);
	}
	if(piece != "")
	{
		draw_sprite_stretched(asset_get_index("s"+pieceType+piece+global.pieceArt), 0, x*w_ratio, y*h_ratio, 96*w_ratio, 96*h_ratio);
	}
}