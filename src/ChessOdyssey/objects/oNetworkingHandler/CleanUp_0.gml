if(global.connectionMode == "server")
{
	network_destroy(server);
}
else
{
	network_destroy(client);
}

if(time_source_exists(connectionVerify))
{
	time_source_destroy(connectionVerify);
}