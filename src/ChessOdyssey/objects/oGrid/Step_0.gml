pieceUpdate();
if(selected &&(piece == "" || pieceType == "Enemy"))
{
	oGameHandler.selectedGrid.row = 0;
	oGameHandler.selectedGrid.column = 0;
	selected = false;
}
if(global.pieceArt != "3D")
{
	mouseHover = false
	if(instance_position(mouse_x, mouse_y, id))
	{
		mouseHover = true;
	}
}

var mouse_left_click = mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0, gp_face1);


if(mouseHover)
{
	if(mouse_left_click)
	{
		if(piece != "" && pieceType == "My" && !oGameHandler.gameEnded && oGameHandler.gameStarted)
		{
			mySound = audio_play_sound(sndPieceSelect, 1, false);
			with(oGrid)
			{
				validMove = false;
				validAttack = false;
			}
			with(oButtonGeneral)
			{
				if(type == "Promote")
				{
					instance_destroy();
				}
			}
			var temprow = oGameHandler.selectedGrid.row;
			var tempcolumn = oGameHandler.selectedGrid.column;
			if(temprow != row || tempcolumn != column)
			{
				oGameHandler.selectedGrid.row = row;
				oGameHandler.selectedGrid.column = column;
				oGameHandler.promotingTo = "";
				createPromotionButton(room_width-384, room_height-256);
				switch(global.gridTable[row][column].piece)
				{
					case "Soldier" :
						oGameHandler.promotingTo = "Knight";
						break;
					case "Knight" :
						oGameHandler.promotingTo = "Elephant";
						break;
					case "Chariot" :
						oGameHandler.promotingTo = "Jester";
						break;
					case "Paladin" :
						oGameHandler.promotingTo = "Assassin";
						break;
					case "Archer" :
						oGameHandler.promotingTo = "Musketeer";
						break;
					default : 
						oGameHandler.promotingTo = "";
						break;
				}
			}
			else
			{
				createPromotionButton(room_width-384, room_height-256);
				if(global.gridTable[row][column].piece == "Soldier")
				{
					switch(oGameHandler.promotingTo)
					{
						case "Knight" :
							oGameHandler.promotingTo = "Chariot";
							break;
						case "Chariot" :
							oGameHandler.promotingTo = "Paladin";
							break;
						case "Paladin" :
							oGameHandler.promotingTo = "Archer";
							break;
						case "Archer" :
							oGameHandler.promotingTo = "Knight";
							break;
						default :
							oGameHandler.promotingTo = "Knight";
							break;
					}
				}
			}
		}
		else
		{
			if(oGameHandler.canMovePiece)
			{		
				if(oGameHandler.selectedGrid.row != 0)
				{
					if(validMove == true || validAttack == true)
					{
						selected = false;
						with(oButtonGeneral)
						{
							if(type == "Promote")
							{
								instance_destroy();
							}
						}
						oGameHandler.cooldown = 1;
						if(global.connectionMode == "client")
						{
							with(oNetworkingHandler)
							{
								requestGridUpdate(11 - oGameHandler.selectedGrid.row, 11 - oGameHandler.selectedGrid.column, 11 - other.row, 11 - other.column);
							}
							oGameHandler.selectedGrid.row = 0;
							oGameHandler.selectedGrid.column = 0;
						}
						else
						{
							with(oNetworkingHandler)
							{
								if(global.connectionMode == "client_host")
								{
									var packet = buffer_create(256, buffer_grow, 1);
									buffer_seek(packet, buffer_seek_start, 0);
									buffer_write(packet, buffer_string, global.gameName);
									buffer_write(packet, buffer_string, "grid_update_send_back");
									buffer_write(packet, buffer_s8, oGameHandler.selectedGrid.row);
									buffer_write(packet, buffer_s8, oGameHandler.selectedGrid.column);
									buffer_write(packet, buffer_s8, other.row);
									buffer_write(packet, buffer_s8, other.column);
									network_send_packet(enemy.clientID, packet, buffer_tell(packet));
									buffer_delete(packet);
								}
								else
								{
									computeGridUpdate(oGameHandler.selectedGrid.row, oGameHandler.selectedGrid.column, other.row, other.column, "server");
								}
							}
						}
					}
				}
			}
		}
	}
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
selected = false;
if(oGameHandler.selectedGrid.row == row && oGameHandler.selectedGrid.column == column && pieceType = "My")
{
	selected = true;
}

if(oGameHandler.selectedGrid.row == 0)
{
	with(oGrid)
	{
		validAttack = false;
		validMove = false;
	}
}
if(selected)
{
	generateOptions();
}