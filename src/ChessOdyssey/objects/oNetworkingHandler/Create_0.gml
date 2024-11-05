if(global.connectionMode == "server")
{
	port = 6550;
	server = network_create_server(network_socket_tcp, port, 20);
	while(server < 0)
	{
		network_destroy(server);
		port++;
		server = network_create_server(network_socket_tcp, port, 20);
	}
	enemy = {
		clientID : -1,
		myName : ""
	};
	connectionVerify = -1;
}
else
{
	client = network_create_socket(network_socket_tcp);
	isConnected = -1;
	isConnected = network_connect_async(client, global.serverIP, real(global.serverPort));
	if(isConnected < 0)
	{
		if(global.orientation == "landscape")
		{
			room_goto(rMainMenu);
		}else if(global.orientation == "portrait")
		{
			room_goto(rMainMenuP);
		}
	}
	if(global.connectionMode == "client_host")
	{
		enemy = {
			clientID : client,
			myName : ""
		};
	}
	stillConnected = true;
	verifyConnectionFunc = function(){
		if(stillConnected)
		{
			var packet = buffer_create(256, buffer_grow, 1);
			buffer_seek(packet, buffer_seek_start, 0);
			buffer_write(packet, buffer_string, global.gameName);
			buffer_write(packet, buffer_string, "confirm_connection");
			network_send_packet(client, packet, buffer_tell(packet));
			buffer_delete(packet);
			stillConnected = false;
		}
		else
		{
			if(instance_exists(oGameHandler))
			{
				oGameHandler.rematch_enemy = false;
				if(!oGameHandler.gameEnded)
				{
					oGameHandler.gameEnded = true;
					oGameHandler.gameStarted = true;
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
					network_destroy(client);
				}
			}
		}
	}
	connectionVerify = time_source_create(time_source_game, 15, time_source_units_seconds, verifyConnectionFunc, [], -1);
	time_source_start(connectionVerify);
}
winner = "";
roomCode = -1;
