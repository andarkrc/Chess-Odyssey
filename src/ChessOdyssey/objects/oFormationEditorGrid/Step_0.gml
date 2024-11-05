mouseHover = false;
if(global.orientation == "landscape")
{
	var brx = 128;
	var bry = 128;
}
else if(global.orientation == "portrait")
{
	var brx = 96;
	var bry = 96;
}

var w_ratio = global.menu_width/room_width;
var h_ratio = global.menu_height/room_height;

var mouse_gx = device_mouse_x_to_gui(0);
var mouse_gy = device_mouse_y_to_gui(0);

var mouse_left_click = mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0, gp_face1);
var mouse_right_click = mouse_check_button_pressed(mb_right) || gamepad_button_check_pressed(0, gp_face2);


if(point_in_rectangle(mouse_gx, mouse_gy, x*w_ratio, y*h_ratio, (x+brx)*w_ratio, (y+bry)*h_ratio))
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
	var pieceCounter = -1;
	with(oFormationEditorSelector)
	{
		if(piece == other.piece)	
		{
			pieceCounter = id;
		}
	}
	if(mouse_right_click && piece != "")
	{
		piece = "";
		pieceCounter.count++;
		mySound = audio_play_sound(sndPieceSelect, 1, false);
	}
	var pieceCounter = -1;
	with(oFormationEditorSelector)
	{
		if(piece == oFormationEditorHandler.selectedPiece)	
		{
			pieceCounter = id;
		}
	}
	if(mouse_left_click && oFormationEditorHandler.selectedPiece != "")
	{
		if(oFormationEditorHandler.selectedPiece != "")
		{
			if(pieceCounter.count > 0 && piece == "")
			{
				piece = oFormationEditorHandler.selectedPiece;
				pieceCounter.count--;
				mySound = audio_play_sound(sndPieceSelect, 1, false);
			}
		}
	}
}