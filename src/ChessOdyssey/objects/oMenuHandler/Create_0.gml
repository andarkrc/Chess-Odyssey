connectionType="Direct";
serverIP = "";
serverPort = -1;
depth = -10;
generateLocalizationFiles();
global.selfWins = 0;
global.otherWins = 0;
if(!file_exists("Data/Formations/formation_base.ini"))
{
	generateBaseFormation();
}
if(!file_exists("Data/settings.ini"))
{
	generateSettingsFile();
	loadGameSettings();
}
else
{
	loadGameSettings();
}

switch(room)
{
	//Landscape Orientation
	case rMainMenu : GenerateMainMenu();break;
	case rServerSelect : GenerateServerSelectionMenu();break;
	case rFormationEditor : GenerateFormationEditorMenu();break;
	case rSettingsMenu : GenerateSettingsMenu();break;
	case rInfoMenu : GenerateInfoMenu();break;
	
	//Portrait Orientation
	case rMainMenuP : GenerateMainMenuP();break;
	case rServerSelectP : GenerateServerSelectionMenuP();break;
	case rFormationEditorP : GenerateFormationEditorMenuP();break;
	case rSettingsMenuP : GenerateSettingsMenuP();break;
	case rInfoMenuP : GenerateInfoMenuP();break;
	default : break;
}

