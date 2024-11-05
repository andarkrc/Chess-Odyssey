randomize();
if(room_width == 1280)
{
	global.orientation = "landscape";
}
else if(room_width == 720)
{
	global.orientation = "portrait";
}
global.menu_width = room_width;
global.menu_height = room_height;
global.autServerInfoRequest = http_get_file(global.autServerConnectionInfoURL, "Data/relay_server_info.txt");