if(global.connectionMode == "server")
{
	if(ds_map_find_value(async_load, "id") == server)
	{
		if(ds_map_find_value(async_load, "type") == network_type_connect)
		{
			if(enemy.clientID < 0 && !oGameHandler.gameEnded)
			{
				enemy.clientID = ds_map_find_value(async_load, "socket");
				sendFormationToSocket(enemy.clientID);
				var packet = buffer_create(256, buffer_seek_start, 1);
				buffer_seek(packet, buffer_seek_start, 0);
				buffer_write(packet, buffer_string, global.gameName);
				buffer_write(packet, buffer_string, "info_request");
				buffer_write(packet, buffer_string, global.playerName);
				network_send_packet(enemy.clientID, packet, buffer_tell(packet));
				with(oGameHandler)
				{
					time_source_start(gameStarter);
				}
				buffer_delete(packet);
			}
			else
			{
				var packet = buffer_create(256, buffer_grow, 1);
				buffer_seek(packet, buffer_seek_start, 0);
				buffer_write(packet, buffer_string, global.gameName);
				buffer_write(packet, buffer_string, "connection_rejected");
				network_send_packet(async_load[? "socket"], packet, buffer_tell(packet));
				buffer_delete(packet);
				network_destroy(async_load[? "socket"]);
			}
		}
		if(ds_map_find_value(async_load, "type") == network_type_disconnect)
		{
			if(enemy.clientID == ds_map_find_value(async_load, "socket"))
			{
				network_destroy(enemy.clientID);
				enemy.clientID = -1;
				enemy.myName = "";
				oGameHandler.rematch_enemy = false;
				if(oGameHandler.gameStarted)
				{
					if(!oGameHandler.gameEnded)
					{
						oGameHandler.gameEnded = true;
						createLeaveButton(192, room_height/2 + 128*5);
						oGameHandler.selectedGrid.row = 0;
						oGameHandler.selectedGrid.column = 0;
						with(oGrid)
						{
							validMove = false;
							validAttack = false;
							selected = false;
							if(pieceType == "Enemy")
							{
								global.gridTable[self.row][self.column].pieceType = "";
								global.gridTable[self.row][self.column].piece = "";
							}
						}
						with(oButtonGeneral)
						{
							if(type == "Promote")
							{
								instance_destroy();
							}
						}
						winner = global.playerName;
					}
				}
				else
				{
					room_restart();
				}
				
			}
		}
	}
}
if(ds_map_find_value(async_load, "type") == network_type_data)
{
	var packet = ds_map_find_value(async_load, "buffer");
	buffer_seek(packet, buffer_seek_start, 0);
	var packetGame = buffer_read(packet, buffer_string);
	if(packetGame == global.gameName)
	{
		var packetType = buffer_read(packet, buffer_string);
		if(global.connectionMode == "server" || global.connectionMode == "client_host")
		{
			switch(packetType)
			{
				case "grid_update_send_back" :
					var r1 = buffer_read(packet, buffer_s8);
					var c1 = buffer_read(packet, buffer_s8);
					var r2 = buffer_read(packet, buffer_s8);
					var c2 = buffer_read(packet, buffer_s8);
					computeGridUpdate(r1, c1, r2, c2, "server");
					break;
				case "chat_message" :
					var message_sender = buffer_read(packet, buffer_string);
					var chat_message = buffer_read(packet, buffer_string);
					with(oChatHandler)
					{
						addMessageInChat(chat_message, message_sender, "other");
						if(can_display_chat == false)
						{
							new_unseen_message = true;
						}
					}
					break;
				case "aut_room_code" :
					roomCode = buffer_read(packet, buffer_s16);
					break;
				case "grid_update_request" :
					var row1 = buffer_read(packet, buffer_u8);
					var column1 = buffer_read(packet, buffer_u8);
					var row2 = buffer_read(packet, buffer_u8);
					var column2 = buffer_read(packet, buffer_u8);
					computeGridUpdate(row1, column1, row2, column2, "client");
					break;
				case "game_rematch" :
					switch(oGameHandler.rematch_enemy)
					{
						case true :
							oGameHandler.rematch_enemy = false;
							break;
						case false :
							oGameHandler.rematch_enemy = true;
							break;
						default :
							oGameHandler.rematch_enemy = true;
							break;
					}
					break;
				case "promotion_request" :
					var row = 11 - buffer_read(packet, buffer_s8);
					var column = 11 - buffer_read(packet, buffer_s8);
					var promoteTo = buffer_read(packet, buffer_string);
					var selpiece = global.gridTable[row][column].piece;
					var selpiecetype = global.gridTable[row][column].pieceType;
					if((selpiece == "Soldier" || selpiece == "Knight" || selpiece == "Chariot" || selpiece == "Paladin" || selpiece == "Archer") && selpiecetype == "Enemy")
					{
						animationPromotePiece(row, column, "Enemy");
						mySound2 = audio_play_sound(sndPiecePromotion, 1, false);
						global.gridTable[row][column].piece = promoteTo;
						with(oNetworkingHandler)
						{
							var packet1 = buffer_create(256, buffer_grow, 1);
							buffer_seek(packet1, buffer_seek_start, 0);
							buffer_write(packet1, buffer_string, global.gameName);
							buffer_write(packet1, buffer_string, "animate_promotion");
							buffer_write(packet1, buffer_s8, 11 - row);
							buffer_write(packet1, buffer_s8, 11 - column);
							buffer_write(packet1, buffer_string, "My");
							network_send_packet(enemy.clientID, packet1, buffer_tell(packet1));
							buffer_delete(packet1);
							sendGridUpdateToSocket(enemy.clientID, 11 - row, 11 - column, promoteTo, "My");
						}
						with(oGrid)
						{
							pieceUpdate();
							validMove = false;
							validAttack = false;
							if(selected)
							{
								generateOptions();
							}
						}
					}
					break;
				case "client_info" :
					enemy.myName = buffer_read(packet, buffer_string);
					break;
				case "grid_update" :
					var row = buffer_read(packet, buffer_u8);
					var column = buffer_read(packet, buffer_u8);
					var change = buffer_read(packet, buffer_string);
					var changetype = buffer_read(packet, buffer_string);
					recieveGridUpdateFromSocket(row, column, change, changetype);
					break;
				case "aut_request_info" :
					var packet1 = buffer_create(256, buffer_grow, 1);
					buffer_seek(packet1, buffer_seek_start, 0);
					buffer_write(packet1, buffer_string, global.gameName);
					buffer_write(packet1, buffer_string, "aut_connection_info");
					buffer_write(packet1, buffer_string, global.playerName);
					buffer_write(packet1, buffer_s16, -1);
					buffer_write(packet1, buffer_s16, global.visibility);
					network_send_packet(client, packet1, buffer_tell(packet1));
					buffer_delete(packet1);
					break;
				case "aut_request_formation_send" :
					sendFormationToSocket(client);
					with(oGameHandler)
					{
						time_source_start(gameStarter);
					}
					var packet = buffer_create(256, buffer_grow, 1);
					buffer_seek(packet, buffer_seek_start, 0);
					buffer_write(packet, buffer_string, global.gameName);
					buffer_write(packet, buffer_string, "client_info");
					buffer_write(packet, buffer_string, global.playerName);
					network_send_packet(client, packet, buffer_tell(packet));
					buffer_delete(packet);
					break;
				default : 
					buffer_seek(packet, buffer_seek_end, 0);
					break;
			}
			if(packetType == "confirm_connection")
			{
				if(global.connectionMode == "server")
				{
					var packet1 = buffer_create(256, buffer_grow, 1);
					buffer_seek(packet1, buffer_seek_start, 0);
					buffer_write(packet1, buffer_string, global.gameName);
					buffer_write(packet1, buffer_string, "connection_confirmed");
					network_send_packet(enemy.clientID, packet1, buffer_tell(packet1));
					buffer_delete(packet1);
				}
			}
		}
		else if(global.connectionMode == "client")
		{
			switch(packetType)
			{
				case "update_score" :
					var new_winner = buffer_read(packet, buffer_string);
					if(new_winner == "self")
					{
						global.selfWins++;
					}
					else
					{
						global.otherWins++;
					}
					break;
				case "chat_message" :
					var message_sender = buffer_read(packet, buffer_string);
					var chat_message = buffer_read(packet, buffer_string);
					with(oChatHandler)
					{
						addMessageInChat(chat_message, message_sender, "other");
						if(can_display_chat == false)
						{
							new_unseen_message = true;
						}
					}
					break;
				case "grid_update" :
					var row = buffer_read(packet, buffer_u8);
					var column = buffer_read(packet, buffer_u8);
					var change = buffer_read(packet, buffer_string);
					var changetype = buffer_read(packet, buffer_string);
					recieveGridUpdateFromSocket(row, column, change, changetype);
					with(oGrid)
					{
						validAttack = false;
						validMove = false;
						if(selected)
						{
							generateOptions();
						}
					}
					break;
				case "animation_arrow_shoot" :
					var start_row = buffer_read(packet, buffer_s8);
					var start_column = buffer_read(packet, buffer_s8);
					var end_row = buffer_read(packet, buffer_s8);
					var end_column = buffer_read(packet, buffer_s8);
					var arrowType = buffer_read(packet, buffer_string);
					animationArrowShoot(start_row, start_column, end_row, end_column, arrowType);
					break;
				case "game_rematch" :
					switch(oGameHandler.rematch_enemy)
					{
						case true :
							oGameHandler.rematch_enemy = false;
							break;
						case false :
							oGameHandler.rematch_enemy = true;
							break;
						default :
							oGameHandler.rematch_enemy = true;
							break;
					}
					break;
				case "connection_rejected" :
					with(oGrid)
					{
						instance_destroy();
					}
					isConnected = -1;
					with(oGameHandler)
					{
						instance_destroy();
					}
					with(oNetworkingHandler)
					{
						network_destroy(client);
					}
					createLeaveButton(192, room_height/2 + 128*5);
					break;
				case "supply_send" :
					oGameHandler.supplies = oGameHandler.supplies+10 > 100 ? 100 : oGameHandler.supplies+10;
					break;
				case "info_request" :
					sendFormationToSocket(client);
					with(oGameHandler)
					{
						time_source_start(gameStarter);
					}
					var packet1 = buffer_create(256, buffer_grow, 1);
					buffer_seek(packet1, buffer_seek_start, 0);
					buffer_write(packet1, buffer_string, global.gameName);
					buffer_write(packet1, buffer_string, "client_info");
					buffer_write(packet1, buffer_string, global.playerName);
					network_send_packet(client, packet1, buffer_tell(packet1));
					buffer_delete(packet1);
					break;
				case "game_end" :
					createRematchButton(room_width-384, room_height-256);
					oGameHandler.gameEnded = true;
					winner = buffer_read(packet, buffer_string);
					createLeaveButton(192, room_height/2 + 128*5);
					oGameHandler.selectedGrid.row = 0;
					oGameHandler.selectedGrid.column = 0;
					with(oGrid)
					{
						validMove = false;
						validAttack = false;
						selected = false;
					}
					with(oButtonGeneral)
					{
						if(type == "Promote")
						{
							instance_destroy();
						}
					}
					break;
				case "aut_request_info" :
					var packet1 = buffer_create(256, buffer_grow, 1);
					buffer_seek(packet1, buffer_seek_start, 0);
					buffer_write(packet1, buffer_string, global.gameName);
					buffer_write(packet1, buffer_string, "aut_connection_info");
					buffer_write(packet1, buffer_string, global.playerName);
					buffer_write(packet1, buffer_s16, global.connectionTo);
					buffer_write(packet1, buffer_s16, 1);
					show_debug_message(string(global.connectionTo));
					network_send_packet(client, packet1, buffer_tell(packet1));
					buffer_delete(packet1);
					break;
				case "aut_request_formation_send" :
					sendFormationToSocket(client);
					with(oGameHandler)
					{
						time_source_start(gameStarter);
					}
					var packet = buffer_create(256, buffer_grow, 1);
					buffer_seek(packet, buffer_seek_start, 0);
					buffer_write(packet, buffer_string, global.gameName);
					buffer_write(packet, buffer_string, "client_info");
					buffer_write(packet, buffer_string, global.playerName);
					network_send_packet(client, packet, buffer_tell(packet));
					buffer_delete(packet);
					break;
				case "animation_move_piece" :
					var startx = buffer_read(packet, buffer_s8);
					var starty = buffer_read(packet, buffer_s8);
					var endx = buffer_read(packet, buffer_s8);
					var endy = buffer_read(packet, buffer_s8);
					var targetPiece = buffer_read(packet, buffer_string);
					var targetType = buffer_read(packet, buffer_string);
					animationMovePiece(startx, starty, endx, endy, targetPiece, targetType);
					break;
				case "animate_promotion" :
					var selrow = buffer_read(packet, buffer_s8);
					var selcolumn = buffer_read(packet, buffer_s8);
					var seltype = buffer_read(packet, buffer_string);
					mySound2 = audio_play_sound(sndPiecePromotion, 1, false);
					animationPromotePiece(selrow, selcolumn, seltype);
					break;
				case "aut_room_code" :
					roomCode = buffer_read(packet, buffer_s16);
					break;
				default : 
					buffer_seek(packet, buffer_seek_end, 0);
					break;
			}
		}
		if(packetType == "connection_confirmed")
		{
			if(global.connectionMode == "client" || global.connectionMode == "client_host")
			{
				stillConnected = true;
			}
		}
		if(packetType == "opponent_left")
		{
			if(global.connectionMode == "client" || global.connectionMode == "client_host")
			{
				if(oGameHandler.gameStarted || global.connectionMode == "client")
				{
					stillConnected = false;
					if(!oGameHandler.gameEnded)
					{
						verifyConnectionFunc();
					}
					network_destroy(client);
				}
				else
				{
					oGameHandler.rematch_enemy = false;
					if(global.connectionMode == "client_host")
					{
						room_restart();
					}
				}
			}
		}
	}
	buffer_delete(packet);
}