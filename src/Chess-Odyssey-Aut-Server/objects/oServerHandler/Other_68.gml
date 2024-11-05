if(ds_map_find_value(async_load, "id") == server)
{
	if(ds_map_find_value(async_load, "type") == network_type_connect)
	{
		connected_clients++;
		clients[connected_clients] = {
			clientID : ds_map_find_value(async_load, "socket"),
			clientName : "",
			connectedTo : -1,
			serverHasClient : -1,
			serverispublic : true
		};
		var packet = buffer_create(256, buffer_grow, 1);
		buffer_seek(packet, buffer_seek_start, 0);
		buffer_write(packet, buffer_string, global.gameName);
		buffer_write(packet, buffer_string, "aut_request_info");
		network_send_packet(clients[connected_clients].clientID, packet, buffer_tell(packet));
		buffer_delete(packet);
		var packet1 = buffer_create(256, buffer_grow, 1);
		buffer_seek(packet1, buffer_seek_start, 0);
		buffer_write(packet1, buffer_string, global.gameName);
		buffer_write(packet1, buffer_string, "aut_room_code");
		buffer_write(packet1, buffer_s16, clients[connected_clients].clientID);
		network_send_packet(clients[connected_clients].clientID, packet1, buffer_tell(packet1));
		buffer_delete(packet1);
	}
	else if(ds_map_find_value(async_load, "type") == network_type_disconnect)
	{
		var i = 0;
		for(i = 1; i <= connected_clients; i++)
		{
			if(clients[i].clientID == ds_map_find_value(async_load, "socket"))
			{
				break;
			}
		}
		var k = 0;
		if(clients[i].connectedTo == -1)//If client that leaves is the host
		{
			for(k = 1; k <= connected_clients; k++)
			{
				if(clients[k].connectedTo == clients[i].clientID)
				{
					break;
				}
			}
			if(k <= connected_clients)
			{
				var packet1 = buffer_create(256, buffer_grow, 1);
				buffer_seek(packet1, buffer_seek_start, 0);
				buffer_write(packet1, buffer_string, global.gameName);
				buffer_write(packet1, buffer_string, "opponent_left");
				network_send_packet(clients[k].clientID, packet1, buffer_tell(packet1));
				buffer_delete(packet1);
			}
		}
		else if(clients[i].connectedTo != -2)//If clients is not from lobby
		{
			var l = 0;
			for(l=1; l<=connected_clients; l++)
			{
				if(clients[l].clientID == clients[i].connectedTo)
				{
					break;
				}
			}
			if(l <= connected_clients)
			{
				if(clients[i].clientID == clients[l].serverHasClient)//If the client that left is the same as host's connected client
				{
					clients[l].serverHasClient = -1;
					var packet1 = buffer_create(256, buffer_grow, 1);
					buffer_seek(packet1, buffer_seek_start, 0);
					buffer_write(packet1, buffer_string, global.gameName);
					buffer_write(packet1, buffer_string, "opponent_left");
					network_send_packet(clients[i].connectedTo, packet1, buffer_tell(packet1));
					buffer_delete(packet1);
				}
			}
		}
		for(var j = i; j < connected_clients; j++)
		{
			clients[j] = {
				clientID : clients[j+1].clientID,
				clientName : clients[j+1].clientName,
				connectedTo : clients[j+1].connectedTo,
				serverHasClient: clients[j+1].serverHasClient,
				serverispublic : clients[j+1].serverispublic
			};
		}
		connected_clients--;
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
		switch(packetType)
		{
			case "confirm_connection" :
				var packet1 = buffer_create(256, buffer_grow, 1);
				buffer_seek(packet1, buffer_seek_start, 0);
				buffer_write(packet1, buffer_string, global.gameName);
				buffer_write(packet1, buffer_string, "connection_confirmed");
				network_send_packet(async_load[? "id"], packet1, buffer_tell(packet1));
				buffer_delete(packet1);
				break;
			case "aut_info_name" :
				var i = 0;
				for(i=1; i<=connected_clients; i++)
				{
					if(clients[i].clientID == async_load[? "id"])
					{
						break;
					}
				}
				clients[i].clientName = buffer_read(packet, buffer_string);
				clients[i].connectedTo = buffer_read(packet, buffer_s8);
				clients[i].serverHasClient = -1;
				var j = i;
				for(i=1; i<=connected_clients; i++)
				{
					if(clients[i].connectedTo == -1 && clients[i].serverHasClient == -1 && clients[i].serverispublic)
					{
						var packet1 = buffer_create(256, buffer_grow, 1);
						buffer_seek(packet1, buffer_seek_start, 0);
						buffer_write(packet1, buffer_string, global.gameName);
						buffer_write(packet1, buffer_string, "aut_online_server");
						buffer_write(packet1, buffer_s16, clients[i].clientID);
						buffer_write(packet1, buffer_string, clients[i].clientName);
						network_send_packet(clients[j].clientID, packet1, buffer_tell(packet1));
						buffer_delete(packet1);
					}
				}
				break;
			case "aut_request_servers" :
				var i = 0;
				for(i=1; i<=connected_clients; i++)
				{
					if(clients[i].clientID == async_load[? "id"])
					{
						break;
					}
				}
				var j = i;
				for(i=1; i<=connected_clients; i++)
				{
					if(clients[i].connectedTo == -1 && clients[i].serverHasClient == -1 && clients[i].serverispublic == true)
					{
						var packet1 = buffer_create(256, buffer_grow, 1);
						buffer_seek(packet1, buffer_seek_start, 0);
						buffer_write(packet1, buffer_string, global.gameName);
						buffer_write(packet1, buffer_string, "aut_online_server");
						buffer_write(packet1, buffer_s16, clients[i].clientID);
						buffer_write(packet1, buffer_string, clients[i].clientName);
						network_send_packet(clients[j].clientID, packet1, buffer_tell(packet1));
						buffer_delete(packet1);
					}
				}
				break;
			case "aut_connection_info" :
				var i = 0;
				for(i=1; i<=connected_clients; i++)
				{
					if(clients[i].clientID == async_load[? "id"])
					{
						break;
					}
				}
				clients[i].clientName = buffer_read(packet, buffer_string);
				clients[i].connectedTo = buffer_read(packet, buffer_s16);
				clients[i].serverispublic = buffer_read(packet, buffer_s16);
				var l = 0;
				for(l=1; l<=connected_clients; l++)
				{
					if(clients[l].clientID == clients[i].connectedTo)
					{
						break;
					}
				}
				if(clients[i].connectedTo != -1 && clients[i].connectedTo != -2 && l <= connected_clients && clients[i].connectedTo != clients[i].clientID)
				{
					if(clients[l].serverHasClient == -1)
					{
						clients[l].serverHasClient = clients[i].clientID;
						var packet1 = buffer_create(256, buffer_grow, 1);
						buffer_seek(packet1, buffer_seek_start, 0);
						buffer_write(packet1, buffer_string, global.gameName);
						buffer_write(packet1, buffer_string, "aut_request_formation_send");
						network_send_packet(clients[i].clientID, packet1, buffer_tell(packet1));
						network_send_packet(clients[i].connectedTo, packet1, buffer_tell(packet1));
						buffer_delete(packet1);
					}
					else
					{
						var packet1 = buffer_create(256, buffer_grow, 1);
						buffer_seek(packet1, buffer_seek_start, 0);
						buffer_write(packet1, buffer_string, global.gameName);
						buffer_write(packet1, buffer_string, "connection_rejected");
						network_send_packet(clients[i].clientID, packet1, buffer_tell(packet1));
						buffer_delete(packet1);
					}
				}
				if(l > connected_clients || clients[i].connectedTo == clients[i].clientID)
				{
					var packet1 = buffer_create(256, buffer_grow, 1);
					buffer_seek(packet1, buffer_seek_start, 0);
					buffer_write(packet1, buffer_string, global.gameName);
					buffer_write(packet1, buffer_string, "connection_rejected");
					network_send_packet(clients[i].clientID, packet1, buffer_tell(packet1));
					buffer_delete(packet1);
				}
				if(l <= connected_clients)
				{
					if(clients[l].connectedTo != -1)
					{
						var packet1 = buffer_create(256, buffer_grow, 1);
						buffer_seek(packet1, buffer_seek_start, 0);
						buffer_write(packet1, buffer_string, global.gameName);
						buffer_write(packet1, buffer_string, "connection_rejected");
						network_send_packet(clients[i].clientID, packet1, buffer_tell(packet1));
						buffer_delete(packet1);
					}
				}
				break;
			case "grid_update_send_back" :
					buffer_seek(packet, buffer_seek_end, 0);
					network_send_packet(async_load[? "id"], packet, buffer_tell(packet));
				break;
			default :
				buffer_seek(packet, buffer_seek_end, 0);
				var i = 0;
				for(i=1; i<=connected_clients; i++)
				{
					if(clients[i].clientID == async_load[? "id"])
					{
						break;
					}
				}
				for(var j=1;j<=connected_clients;j++)
				{
					if(clients[j].connectedTo == clients[i].clientID || clients[i].connectedTo == clients[j].clientID)
					{
						network_send_packet(clients[j].clientID, packet, buffer_tell(packet));
					}
				}
				break;
		}
	}
	
	buffer_delete(packet);
}