if(ds_map_find_value(async_load, "type") == network_type_data)
{
	var packet = async_load[? "buffer"];
	buffer_seek(packet, buffer_seek_start, 0);
	var packetGame = buffer_read(packet, buffer_string);
	if(packetGame == global.gameName)
	{
		var packetType = buffer_read(packet, buffer_string);
		switch(packetType)
		{
			case "connection_confirmed" :
				stillConnected = true;
				break;
			case "aut_request_info" :
				var packet1 = buffer_create(256, buffer_grow, 1);
				buffer_seek(packet1, buffer_seek_start, 0);
				buffer_write(packet1, buffer_string, global.gameName);
				buffer_write(packet1, buffer_string, "aut_info_name");
				buffer_write(packet1, buffer_string, global.playerName);
				buffer_write(packet1, buffer_s16, -2);
				network_send_packet(client, packet1, buffer_tell(packet1));
				buffer_delete(packet1);
				waitingForResponse = false;
				break;
			case "aut_online_server" :
				var tempID = buffer_read(packet, buffer_s16);
				var tempName = buffer_read(packet, buffer_string);
				total_servers++;
				servers[total_servers] = {
					clientID : tempID,
					clientName : tempName
				};
				break;
			default : 
				buffer_seek(packet, buffer_seek_end, 0);
			break;
		}
	}
}