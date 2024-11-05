/*
drawSetup(1, c_black, fnMedium);
draw_text(64, global.menu_height-128, "Yaw: "+string(yaw_rotation/pi));
draw_text(64, global.menu_height-64, "Pitch: "+string(pitch_rotation/pi));
*/
if(can_move)
{
	draw_sprite_ext(sCross, 0, global.menu_width/2, global.menu_height/2, 1, 1, 0, c_gray, 0.6);
}