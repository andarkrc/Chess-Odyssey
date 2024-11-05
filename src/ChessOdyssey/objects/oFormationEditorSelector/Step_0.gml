var mouse_gx = device_mouse_x_to_gui(0);
var mouse_gy = device_mouse_y_to_gui(0);
var mouse_left_click = mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0, gp_face1);

mouseHover = false;
if(instance_position(mouse_gx, mouse_gy, id))
{
	mouseHover = true;
}
//If the button is selected for the first time make a sound
if(wasSelected == false && mouseHover == true)
{
	wasSelected = true;
	mySound = audio_play_sound(sndButtonHover, 1, false);
}
//If the button is no longer selected update acordingly
if(wasSelected == true && mouseHover == false)
{
	wasSelected = false;
}
if(mouseHover)
{
	if(mouse_left_click)
	{
		mySound = audio_play_sound(sndPieceSelect, 1, false);
		switch(oFormationEditorHandler.selectedPiece)
		{
			case piece : oFormationEditorHandler.selectedPiece = "";break;
			default : oFormationEditorHandler.selectedPiece = piece;break;
		}
	}
}
selected = false;
if(oFormationEditorHandler.selectedPiece == piece)
{
	selected = true;
}