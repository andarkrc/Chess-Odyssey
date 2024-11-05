if(async_load[? "id"] == global.autServerInfoRequest)
{
	if(async_load[? "status"] == 0)
	{
		var file = file_text_open_read(async_load[? "result"]);
		global.autServerIP = file_text_read_string(file);
		file_text_readln(file);
		global.autServerPort = file_text_read_string(file);
		file_text_close(file);
		file_delete(async_load[? "result"]);
	}
}
