///@function sendGridUpdateToSocket
///@param socket
///@param row
///@param column
///@param change
///@param changetype
function sendGridUpdateToSocket(socket, row, column, change, changetype){
	var packet = buffer_create(256, buffer_grow, 1);
	buffer_seek(packet, buffer_seek_start, 0);
	buffer_write(packet, buffer_string, global.gameName);
	buffer_write(packet, buffer_string, "grid_update");
	buffer_write(packet, buffer_u8, row);
	buffer_write(packet, buffer_u8, column);
	buffer_write(packet, buffer_string, change);
	buffer_write(packet, buffer_string, changetype);
	network_send_packet(socket, packet, buffer_tell(packet));
	buffer_delete(packet);
}

///@function recieveGridUpdateFromSocket
///@param row
///@param column
///@param change
///@param changetype
function recieveGridUpdateFromSocket(row, column, change, changetype){
	global.gridTable[row][column].piece = change;
	global.gridTable[row][column].pieceType = changetype;
	with(oGrid)
	{
		pieceUpdate();
	}
}

///function requestGridUpdate
///@param row1
///@param column1
///@param row2
///@param column2
function requestGridUpdate(row1, column1, row2, column2){
	var packet = buffer_create(256, buffer_grow, 1);
	buffer_seek(packet, buffer_seek_start, 0);
	buffer_write(packet, buffer_string, global.gameName);
	buffer_write(packet, buffer_string, "grid_update_request");
	buffer_write(packet, buffer_u8, row1);
	buffer_write(packet, buffer_u8, column1);
	buffer_write(packet, buffer_u8, row2);
	buffer_write(packet, buffer_u8, column2);
	network_send_packet(client, packet, buffer_tell(packet));
	buffer_delete(packet);
}

///@function requestPromotion
///@param row
///@param column
///@param promoteTo
function requestPromotion(row, column, promoteTo){
	var packet = buffer_create(256, buffer_grow, 1);
	buffer_seek(packet, buffer_seek_start, 0);
	buffer_write(packet, buffer_string, global.gameName);
	buffer_write(packet, buffer_string, "promotion_request");
	buffer_write(packet, buffer_s8, row);
	buffer_write(packet, buffer_s8, column);
	buffer_write(packet, buffer_string, promoteTo);
	network_send_packet(client, packet, buffer_tell(packet));
	buffer_delete(packet);
}

///@function animationMovePiece
///@param start_row
///@param start_column
///@param end_row
///@param end_column
///@param targetPiece
///@param targetType
function animationMovePiece(start_row, start_column, end_row, end_column, targetPiece, targetType){
	var startx = 0;
	var starty = 0;
	var endx = 0;
	var endy = 0;
	with(oGrid)
	{
		if(row == start_row && column == start_column)
		{
			startx = x;
			starty = y;
		}
		if(row == end_row && column == end_column)
		{
			endx = x;
			endy = y;
		}
	}
	with(instance_create_layer(startx, starty, "MovingPieces", oMovingPiece))
	{
		targetX = endx;
		targetY = endy;
		piece = targetPiece;
		pieceType = targetType;
		spd = (point_distance(startx, starty, endx, endy)/room_speed)*2;
	}
	if(global.connectionMode != "client")
	{
		if(targetType == "My")
		{
			targetType = "Enemy";
		}
		else
		{
			targetType = "My";
		}
		var packet = buffer_create(256, buffer_grow, 1);
		buffer_seek(packet, buffer_seek_start, 0);
		buffer_write(packet, buffer_string, global.gameName);
		buffer_write(packet, buffer_string, "animation_move_piece");
		buffer_write(packet, buffer_s8, 11 - start_row);
		buffer_write(packet, buffer_s8, 11 - start_column);
		buffer_write(packet, buffer_s8, 11 -  end_row);
		buffer_write(packet, buffer_s8, 11 - end_column);
		buffer_write(packet, buffer_string, targetPiece);
		buffer_write(packet, buffer_string, targetType);
		with(oNetworkingHandler)
		{
			network_send_packet(enemy.clientID, packet, buffer_tell(packet));
		}
		buffer_delete(packet);
	}
}

///@function animationArrowShoot
///@param start_row
///@param start_column
///@param end_row
///@param end_column
///@param targetPiece
function animationArrowShoot(start_row, start_column, end_row, end_column, targetPiece){
	var startx = 0;
	var starty = 0;
	var endx = 0;
	var endy = 0;
	with(oGrid)
	{
		if(row == start_row && column == start_column)
		{
			startx = x;
			starty = y;
		}
		if(row == end_row && column == end_column)
		{
			endx = x;
			endy = y;
		}
	}
	with(instance_create_layer(startx + 96, starty + 96, "MovingPieces", oMovingArrow))
	{
		targetX = endx + 96;
		targetY = endy + 96;
		arrowType = targetPiece;
		angle = (180*arctan2(starty - endy, startx - endx))/pi;
		spd = (point_distance(startx, starty, endx, endy)/room_speed)*2;
	}
	if(global.connectionMode != "client")
	{
		var packet = buffer_create(256, buffer_grow, 1);
		buffer_seek(packet, buffer_seek_start, 0);
		buffer_write(packet, buffer_string, global.gameName);
		buffer_write(packet, buffer_string, "animation_arrow_shoot");
		buffer_write(packet, buffer_s8, 11 - start_row);
		buffer_write(packet, buffer_s8, 11 - start_column);
		buffer_write(packet, buffer_s8, 11 -  end_row);
		buffer_write(packet, buffer_s8, 11 - end_column);
		buffer_write(packet, buffer_string, targetPiece);
		with(oNetworkingHandler)
		{
			network_send_packet(enemy.clientID, packet, buffer_tell(packet));
		}
		buffer_delete(packet);
	}
}

///@function animationPromotePiece
///@param selrow
///@param selcolumn
///@param seltype
function animationPromotePiece(selrow, selcolumn, seltype){
	with(oGrid)
	{
		if(row == selrow && column == selcolumn)
		{
			with(instance_create_layer(x, y, "MovingPieces", oPromotionAnimation))
			{
				type = seltype;
			}
		}
	}
}

///@function computeGameEnd
function computeGameEnd(){
	var existsEnemyKing = false;
	var existsMyKing = false;
	var existsOtherPieces = false;
	with(oGrid)
	{
		if(piece == "King")
		{
			if(pieceType == "My")
			{
				existsMyKing = true;
			}
			else
			{
				existsEnemyKing = true;
			}
		}
		else if(piece != "")
		{
			existsOtherPieces = true;
		}
	}
	if(existsEnemyKing && existsMyKing)
	{
		if(existsOtherPieces)
		{
			return -1;
		}
		else
		{
			winner = "noone";
		}
	}
	if(existsMyKing && !existsEnemyKing)
	{
		winner = global.playerName;
		global.selfWins++;
		//winner = "server";
		var packet1 = buffer_create(256, buffer_grow, 1);
		buffer_seek(packet1, buffer_seek_start, 0);
		buffer_write(packet1, buffer_string, global.gameName);
		buffer_write(packet1, buffer_string, "update_score");
		buffer_write(packet1, buffer_string, "other");
		with(oNetworkingHandler)
		{
			network_send_packet(enemy.clientID, packet1, buffer_tell(packet1));
		}
		buffer_delete(packet1);
	}
	else if(!existsMyKing && existsEnemyKing)
	{
		winner = oNetworkingHandler.enemy.myName;
		global.otherWins++;
		//winner = "client";
		var packet1 = buffer_create(256, buffer_grow, 1);
		buffer_seek(packet1, buffer_seek_start, 0);
		buffer_write(packet1, buffer_string, global.gameName);
		buffer_write(packet1, buffer_string, "update_score");
		buffer_write(packet1, buffer_string, "self");
		with(oNetworkingHandler)
		{
			network_send_packet(enemy.clientID, packet1, buffer_tell(packet1));
		}
		buffer_delete(packet1);
	}
	else if(!existsMyKing && !existsEnemyKing)
	{
		winner = "noone";
	}
	if(winner != "")
	{
		createRematchButton(room_width-384, room_height-256);
		oGameHandler.gameEnded = true;
		var packet = buffer_create(256, buffer_grow, 1);
		buffer_seek(packet, buffer_seek_start, 0);
		buffer_write(packet, buffer_string, global.gameName);
		buffer_write(packet, buffer_string, "game_end");
		buffer_write(packet, buffer_string, winner);
		with(oNetworkingHandler)
		{
			network_send_packet(enemy.clientID, packet, buffer_tell(packet));
		}
		buffer_delete(packet);
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
	}
}

///@function sendSuppliesToSocket
///@param socket
function sendSuppliesToSocket(socket){
	var packet = buffer_create(256, buffer_grow, 1);
	buffer_seek(packet, buffer_seek_start, 0);
	buffer_write(packet, buffer_string, global.gameName);
	buffer_write(packet, buffer_string, "supply_send");
	network_send_packet(socket, packet, buffer_tell(packet));
	buffer_delete(packet);
}

///@function computeGridUpdate
///@param row1
///@param column1
///@param row2
///@param column2
///@param type
function computeGridUpdate(row1, column1, row2, column2, type){
	if(global.gridTable[row1][column1].piece != "")
	{
		with(oGrid)
		{
			if(row == row2 && column == column2)
			{
				if(type == "server")
				{
					if(global.gridTable[row1][column1].pieceType == "My")
					{
						if(piece == "")
						{
					
							global.gridTable[row2][column2].piece = global.gridTable[row1][column1].piece;
							global.gridTable[row2][column2].pieceType = global.gridTable[row1][column1].pieceType;
							global.gridTable[row1][column1].piece = "";
							global.gridTable[row1][column1].pieceType = "";
							animationMovePiece(row1, column1, row2, column2, global.gridTable[row2][column2].piece, "My");
							with(oNetworkingHandler)
							{
								sendGridUpdateToSocket(enemy.clientID, 11 - row1, 11 - column1, global.gridTable[row1][column1].piece, global.gridTable[row1][column1].pieceType);
								sendGridUpdateToSocket(enemy.clientID, 11 - row2, 11 - column2, global.gridTable[row2][column2].piece, "Enemy");	
							}
						}
						else if(pieceType == "Enemy")
						{
							switch(global.gridTable[row1][column1].piece)
							{
								case "Archer" :
									global.gridTable[row2][column2].piece = "";
									global.gridTable[row2][column2].pieceType = "";
									animationArrowShoot(row1, column1, row2, column2, "Archer");
									with(oNetworkingHandler)
									{
										sendGridUpdateToSocket(enemy.clientID, 11 - row2, 11 - column2, "", "");
									}
									oGameHandler.supplies = oGameHandler.supplies+10 > 100 ? 100 : oGameHandler.supplies+10;
									break;
								case "Musketeer" :
									global.gridTable[row2][column2].piece = "";
									global.gridTable[row2][column2].pieceType = "";
									animationArrowShoot(row1, column1, row2, column2, "Musketeer");
									with(oNetworkingHandler)
									{
										sendGridUpdateToSocket(enemy.clientID, 11 - row2, 11 - column2, "", "");
									}
									oGameHandler.supplies = oGameHandler.supplies+10 > 100 ? 100 : oGameHandler.supplies+10;
									break;
								default : 
									global.gridTable[row2][column2].piece = global.gridTable[row1][column1].piece;
									global.gridTable[row2][column2].pieceType = global.gridTable[row1][column1].pieceType;
									global.gridTable[row1][column1].piece = "";
									global.gridTable[row1][column1].pieceType = "";
									animationMovePiece(row1, column1, row2, column2, global.gridTable[row2][column2].piece, "My");
									with(oNetworkingHandler)
									{
										sendGridUpdateToSocket(enemy.clientID, 11 - row1, 11 - column1, global.gridTable[row1][column1].piece, global.gridTable[row1][column1].pieceType);
										sendGridUpdateToSocket(enemy.clientID, 11 - row2, 11 - column2, global.gridTable[row2][column2].piece, "Enemy");	
									}
									oGameHandler.supplies = oGameHandler.supplies+10 > 100 ? 100 : oGameHandler.supplies+10;
									break;
							}
						}
						oGameHandler.selectedGrid.row = 0;
						oGameHandler.selectedGrid.column = 0;
					}
				}
				else
				{
					if(global.gridTable[row1][column1].pieceType == "Enemy")
					{
						if(piece == "")
						{
							global.gridTable[row2][column2].piece = global.gridTable[row1][column1].piece;
							global.gridTable[row2][column2].pieceType = global.gridTable[row1][column1].pieceType;
							global.gridTable[row1][column1].piece = "";
							global.gridTable[row1][column1].pieceType = "";
							animationMovePiece(row1, column1, row2, column2, global.gridTable[row2][column2].piece, "Enemy");
							with(oNetworkingHandler)
							{
								sendGridUpdateToSocket(enemy.clientID, 11 - row1, 11 - column1, global.gridTable[row1][column1].piece, global.gridTable[row1][column1].pieceType);
								sendGridUpdateToSocket(enemy.clientID, 11 - row2, 11 - column2, global.gridTable[row2][column2].piece, "My");	
							}
						}
						else if(pieceType == "My")
						{
							switch(global.gridTable[row1][column1].piece)
							{
								case "Archer" :
									global.gridTable[row2][column2].piece = "";
									global.gridTable[row2][column2].pieceType = "";
									animationArrowShoot(row1, column1, row2, column2, "Archer");
									with(oNetworkingHandler)
									{
										sendGridUpdateToSocket(enemy.clientID, 11 - row2, 11 - column2, "", "");
										sendSuppliesToSocket(enemy.clientID);
									}
									break;
								case "Musketeer" :
									global.gridTable[row2][column2].piece = "";
									global.gridTable[row2][column2].pieceType = "";
									animationArrowShoot(row1, column1, row2, column2, "Musketeer");
									with(oNetworkingHandler)
									{
										sendGridUpdateToSocket(enemy.clientID, 11 - row2, 11 - column2, "", "");
										sendSuppliesToSocket(enemy.clientID);
									}
									break;
								default : 
									global.gridTable[row2][column2].piece = global.gridTable[row1][column1].piece;
									global.gridTable[row2][column2].pieceType = global.gridTable[row1][column1].pieceType;
									global.gridTable[row1][column1].piece = "";
									global.gridTable[row1][column1].pieceType = "";
									animationMovePiece(row1, column1, row2, column2, global.gridTable[row2][column2].piece, "Enemy");
									with(oNetworkingHandler)
									{
										sendGridUpdateToSocket(enemy.clientID, 11 - row1, 11 - column1, global.gridTable[row1][column1].piece, global.gridTable[row1][column1].pieceType);
										sendGridUpdateToSocket(enemy.clientID, 11 - row2, 11 - column2, global.gridTable[row2][column2].piece, "My");	
										sendSuppliesToSocket(enemy.clientID);
									}
									break;
							}
						}
					}
				}
			}
		}
	}
	with(oGrid)
	{
		pieceUpdate();
	}
	with(oGrid)
	{
		validAttack = false;
		validMove = false;
		if(selected)
		{
			generateOptions();
		}
	}
	if(oGameHandler.gameStarted && !oGameHandler.gameEnded)
	{
		computeGameEnd();
	}
}

///@function sendFormationToSocket
///@param socket
function sendFormationToSocket(socket){
	var i = 0;
	var j = 0;
	for(i=7; i<=10; i++)
	{
		for(j = 3; j<=8; j++)
		{
			if(global.gridTable[i][j].piece != "")
			{
				sendGridUpdateToSocket(socket, 11 -  i, 11 - j, global.gridTable[i][j].piece, "Enemy");
			}
		}
	}
}

