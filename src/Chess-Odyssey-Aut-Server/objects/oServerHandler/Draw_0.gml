draw_set_color(c_black);
draw_text(64, 64, global.gameName);
draw_text(64, 128, string(port));
draw_text(64, 192, string(connected_clients));
for(var i=1; i<=connected_clients; i++)
{
	draw_text(64, 192 + 64*i, clients[i].clientName + " : " + string(clients[i].clientID) + " "+ string(clients[i].connectedTo) + " "+string(clients[i].serverHasClient) + " " + string(clients[i].serverispublic));
}
