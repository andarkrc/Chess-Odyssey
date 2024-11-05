var w_ratio = global.menu_width/room_width;
var h_ratio = global.menu_height/room_height;

draw_sprite_stretched(sGrid, 0, x*w_ratio, y*h_ratio, 128*w_ratio, 128*h_ratio);
if(mouseHover)
{
	draw_sprite_stretched(sGrid, 1, x*w_ratio, y*h_ratio, 128*w_ratio, 128*h_ratio);
}
if(selected)
{
	draw_sprite_stretched(sGrid, 2, x*w_ratio, y*h_ratio, 128*w_ratio, 128*h_ratio);
}
if(piece != "")
{
	draw_sprite_stretched(asset_get_index("s"+pieceType+piece+global.pieceArt), 0, x*w_ratio, y*h_ratio, 128*w_ratio, 128*h_ratio);
}
drawSetup(1, c_black, fnMedium, fa_left, fa_middle);
draw_text_transformed((x + sprite_width + 4)*w_ratio, (y + sprite_height/2)*h_ratio, "x"+string(count), w_ratio, h_ratio, 0);