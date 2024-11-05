client = network_create_socket(network_socket_tcp);

isConnected = -1;
isConnected = network_connect_async(client, global.autServerIP, real(global.autServerPort));

waitingForResponse = true;

server_level = 0;
total_servers = 0;
servers = [{
	clientID : -1,
	clientName : ""
}];

//Connection verifying
stillConnected = true;
var func = function(){
	if(stillConnected)
	{
		stillConnected = false;
		var packet = buffer_create(256, buffer_grow, 1);
		buffer_seek(packet, buffer_seek_start, 0);
		buffer_write(packet, buffer_string, global.gameName);
		buffer_write(packet, buffer_string, "confirm_connection");
		network_send_packet(client, packet, buffer_tell(packet));
		buffer_delete(packet);
	}
	else
	{
		isConnected = -1;
	}
}
connectionVerify = time_source_create(time_source_game, 15, time_source_units_seconds, func, [], -1);
time_source_start(connectionVerify);

//Online server list loading
var func = function(){
	if(oMenuHandler.connectionType == "Online")
	{
		if(global.orientation == "landscape")
		{
			GenerateOnlineServerList();
		}else if(global.orientation == "portrait")
		{
			GenerateOnlineServerListP();
		}
	}
}
onlineServerListLoading = time_source_create(time_source_game, 1, time_source_units_seconds, func);

//Refresh button refresh
var func = function(){
	if(isConnected > -1)
	{
		with(oButtonGeneral)
		{
			if(type == "Refresh")
			{
				leftClickAction();
			}
		}
	}
}
refreshButtonLoop = time_source_create(time_source_game, 30, time_source_units_seconds, func, [], -1);
time_source_start(refreshButtonLoop);