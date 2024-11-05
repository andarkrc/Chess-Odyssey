with(oTextBox)
{
	if(type == "FormationName")
	{
		if(canWrite == false)
		{
			if(global.selectedFormation != text && file_exists("Data/Formations/formation_"+text+".ini"))
			{
				global.selectedFormation = text;
				ini_open("Data/settings.ini");
				ini_write_string("Settings", "selectedFormation", text);
				ini_close();
			}
			else
			{
				if(!file_exists("Data/Formations/formation_"+text+".ini"))
				{
					other.formationError = true;
					time_source_start(other.formationErrorReset);
					text = "base";
				}
			}
		}
	}
	else if(type == "PlayerName")
	{
		if(canWrite == false)
		{
			if(global.playerName != text)
			{
				if(text == "")
				{
					text = "Player";
				}
				global.playerName = text;
				ini_open("Data/settings.ini");
				ini_write_string("Settings", "playerName", text);
				ini_close();
			}
		}
	}
}

