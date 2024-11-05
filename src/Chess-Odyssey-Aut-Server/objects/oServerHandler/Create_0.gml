port = 6551;
server = network_create_server(network_socket_tcp, port, 1000);
while(server < 0)
{
	network_destroy(server);
	port++;
	server = network_create_server(network_socket_tcp, port, 1000);
}

clients = [{
	clientID : -1,
	clientName : "",
	connectedTo : -1,
	serverHasClient : -1,
	serverispublic : true
}];
connected_clients = 0;