#region Landscape
///@function GenerateMainMenu
function GenerateMainMenu(){
	//Create Buttons
	createPlayButton(64, room_height/2 - 192);
	createFormationEditorButton(64, room_height/2 - 64);
	createCustomizationButton(64, room_height/2 + 64);
	createInfoButton(64, room_height/2 + 192);
	createDiscordInviteButton(room_width - 96, 32);
}

///@function GenerateFormationEditorMenu
function GenerateFormationEditorMenu(){
	///Create Buttons
	with(createBackButton(64, room_height-160+56))
	{
		width = 240;
	}
	createLoadButton(room_width/2 + 48, room_height-160+56);
	createSaveButton(room_width/2 + 48+144+16, room_height-160+56);
	///Create TextBoxes
	createFormationNameTextBox(64, 40-32);
	createFormationCycleButton(800 + 64, 40-32);
	///Create Formation Grid
	for(var i=1; i<=4; i++)
	{
		for(var j=1; j<=6; j++)
		{
			with(instance_create_layer(64 + (128+1)*(j-1), 64 + 64 + (128+1)*(i-1) - 48, "Instances", oFormationEditorGrid))
			{
				row = i;
				column = j;
			}
		}
	}
	{///Create Pieces Grids
		with(instance_create_layer(128 + 96 + 128*5, 128 + 128*0 - 48, "Instances", oFormationEditorSelector))//King Selector
		{
			piece = "King";
			count = 1;
		}
		with(instance_create_layer(128 + 96 + 128*5, 128 + 128*1 - 48, "Instances", oFormationEditorSelector))//General Selector
		{
			piece = "General";
			count = 1;
		}
		with(instance_create_layer(128 + 96 + 128*5, 128 + 128*2 - 48, "Instances", oFormationEditorSelector))//Chariot Selector
		{
			piece = "Chariot";
			count = 2;
		}
		with(instance_create_layer(128 + 96 + 128*5, 128 + 128*3 - 48, "Instances", oFormationEditorSelector))//Paladin Selector
		{
			piece = "Paladin";
			count = 2;
		}
		with(instance_create_layer(224 + 96 + 128*6, 128 + 128*0 - 48, "Instances", oFormationEditorSelector))//Knight Selector
		{
			piece = "Knight";
			count = 2;
		}
		with(instance_create_layer(224 + 96 + 128*6, 128 + 128*1 - 48, "Instances", oFormationEditorSelector))//Archer Selector
		{
			piece = "Archer";
			count = 2;
		}
		with(instance_create_layer(224 + 96 + 128*6, 128 + 128*2 - 48, "Instances", oFormationEditorSelector))///Soldier Selector
		{
			piece = "Soldier";
			count = 6;
		}
	}
}
	
///@function GenerateInfoMenu
function GenerateInfoMenu(){
	///Create Buttons
	with(createBackButton(64, room_height-160+16))
	{
		width = 288;
	}
	createAboutButton(64, 64);
	createCreditsButton(64, 64 + 128);
	createTutorialButton(64, 64 + 256);
}

///@function GenerateOnlineServerList
function GenerateOnlineServerList(){
	with(oButtonGeneral)
	{
		if(scrollAffected)
		{
			instance_destroy();
		}
		if(type == "OnlineServerListScroll")
		{
			instance_destroy();
		}
	}
	var i=0;
	for(i=1; i<=3 && 3*oAutServerHandler.server_level+i<=oAutServerHandler.total_servers; i++)
	{
		createOnlineServerListButton(room_width/2 - 256-64, 144 + 144*(i-1), i);
	}

	if(oAutServerHandler.server_level > 0)
	{
		createOnlineServerListScrollButton(192, 288, "<");
	}
	if(oAutServerHandler.server_level+1 < floor((oAutServerHandler.total_servers-1)/3+1))
	{
		createOnlineServerListScrollButton(192+160+512, 288, ">");
	}
}

///@function GenerateServerSelectionMenu
function GenerateServerSelectionMenu(){
	///Create Buttons
	with(createBackButton(64, room_height-160+16))
	{
		width = 240;
	}
	with(createDirectConnectButton(64, 46))
	{
		oMenuHandler.connectionType = "";
		leftClickAction();
	}
	createOnlineConnectButton(64 + 160 + 4, 46);
	createRoomCodeConnectButton(64 + 160*2 + 8, 46);
	createHostConnectButton(64 + 160*3 + 12, 46);
	createRefreshButton(room_width - 128- 80, 46);
	createConnectButton(64 + room_width - 512+80, room_height-160+16);
}
	
///@function GenerateSettingsMenu()
function GenerateSettingsMenu(){
	///Create Buttons
	with(createBackButton(64, room_height-160+56))
	{
		width = 240;
	}
	createLanguageButton(64, 320);
	createPieceArtButton(64, 416);
	createSoundVolumeButton(256 + 400-16, 320);
	createFormationAutoSelectButton(256 + 400-16, 416);
	///Create Text Boxes
	with(createFormationNameTextBox(64, 64))
	{
		ghostText = "";
		text = global.selectedFormation;
	}
	createFormationCycleButton(64+800, 64);
	createPlayerNameTextBox(64, 224);
}
#endregion

#region Portrait
///@function GenerateMainMenuP
function GenerateMainMenuP(){
	//Create Buttons
	createPlayButton(room_width/2 - 320/2, room_height/2 - 192);
	createFormationEditorButton(room_width/2 - 320/2, room_height/2 - 64 + 32);
	createCustomizationButton(room_width/2 - 320/2, room_height/2 + 64 + 64);
	createInfoButton(room_width/2 - 320/2, room_height/2 + 192 + 96);
	createDiscordInviteButton(room_width - 96, room_height - 96);
}

///@function GenerateFormationEditorMenuP
function GenerateFormationEditorMenuP(){
	///Create Buttons
	with(createBackButton(64, room_height-160))
	{
		width = 240;
	}
	createLoadButton(room_width-64-144-32-144, room_height-160);
	createSaveButton(room_width - 64 - 144, room_height-160);
	///Create TextBoxes
	with(createFormationNameTextBox(32, 32))
	{
		width = room_width-64;
	}
	createFormationCycleButton(room_width/2 - 32, 96+16);
	var offsety = 64;
	///Create Formation Grid
	for(var i=1; i<=4; i++)
	{
		for(var j=1; j<=6; j++)
		{
			with(instance_create_layer(64 + 100*(j-1), offsety + 64 + 64 + 100*(i-1), "Instances", oFormationEditorGrid))
			{
				row = i;
				column = j;
			}
		}
	}
	{///Create Pieces Grids
		with(instance_create_layer(64 + 48, offsety + room_height/2 - 96, "Instances", oFormationEditorSelector))//King Selector
		{
			piece = "King";
			count = 1;
		}
		with(instance_create_layer(64 + 128 + 64 + 48, offsety + room_height/2 - 96, "Instances", oFormationEditorSelector))//General Selector
		{
			piece = "General";
			count = 1;
		}
		with(instance_create_layer(64 + 128*2 + 64*2 + 48, offsety + room_height/2 - 96, "Instances", oFormationEditorSelector))//Chariot Selector
		{
			piece = "Chariot";
			count = 2;
		}
		with(instance_create_layer(64 + 48, offsety + room_height/2 + 64, "Instances", oFormationEditorSelector))//Paladin Selector
		{
			piece = "Paladin";
			count = 2;
		}
		with(instance_create_layer(64 + 128 + 64 + 48, offsety + room_height/2 + 64, "Instances", oFormationEditorSelector))//Knight Selector
		{
			piece = "Knight";
			count = 2;
		}
		with(instance_create_layer(64 + 128*2 + 64*2 + 48, offsety + room_height/2 + 64, "Instances", oFormationEditorSelector))//Archer Selector
		{
			piece = "Archer";
			count = 2;
		}
		with(instance_create_layer(64 + 128 + 64 + 48, offsety + room_height/2 + 192+32, "Instances", oFormationEditorSelector))///Soldier Selector
		{
			piece = "Soldier";
			count = 6;
		}
	}
}
	
///@function GenerateInfoMenuP
function GenerateInfoMenuP(){
	///Create Buttons
	with(createBackButton(room_width/2 - 144, room_height-160+16))
	{
		width = 288;
	}
	with(createAboutButton(64, 32))
	{
		width = 186;
		height = 64;
	}
	with(createCreditsButton(64 + 186 + 16, 32))
	{
		width = 186;
		height = 64;
	}
	with(createTutorialButton(64 + 186*2 +32, 32))
	{
		width = 186;
		height = 64;
	}
}

///@function GenerateOnlineServerListP
function GenerateOnlineServerListP(){
	with(oButtonGeneral)
	{
		if(scrollAffected)
		{
			instance_destroy();
		}
		if(type == "OnlineServerListScroll")
		{
			instance_destroy();
		}
	}
	var i=0;
	for(i=1; i<=3 && 3*oAutServerHandler.server_level+i<=oAutServerHandler.total_servers; i++)
	{
		createOnlineServerListButton(room_width/2 - 512/2, 224 + 224*(i-1), i);
	}

	if(oAutServerHandler.server_level > 0)
	{
		createOnlineServerListScrollButton(room_width/2 - 256/2 - 96 - 32, room_height-384, "<");
	}
	if(oAutServerHandler.server_level+1 < floor((oAutServerHandler.total_servers-1)/3+1))
	{
		createOnlineServerListScrollButton(room_width/2 + 256/2 + 32, room_height-384, ">");
	}
}

///@function GenerateServerSelectionMenuP
function GenerateServerSelectionMenuP(){
	///Create Buttons
	with(createBackButton(64, room_height-160+16))
	{
		width = 240;
	}
	with(createDirectConnectButton(64, 48+64))
	{
		width = 124;
		oMenuHandler.connectionType = "";
		leftClickAction();
	}
	with(createOnlineConnectButton(64 + 124 + 4, 48+64))
	{
		width = 124;
	}
	with(createRoomCodeConnectButton(64 + 124*2 + 8, 48+64))
	{
		width = 124;
	}
	with(createHostConnectButton(64 + 124*3 + 12, 48+64))
	{
		width = 124;
	}
	createRefreshButton(64 + 124*4 + 16, 48+64);
	createConnectButton(room_width - 64 - 240, room_height-160+16);
}
	
///@function GenerateSettingsMenuP
function GenerateSettingsMenuP(){
	///Create Buttons
	with(createBackButton(room_width/2 - 240/2, room_height-160))
	{
		width = 240;
	}
	var offsety = 64;
	createLanguageButton(room_width/2 - (400-16)/2, offsety + 352);
	createPieceArtButton(room_width/2 - (400-16)/2, offsety + 480);
	createSoundVolumeButton(room_width/2 - (400-16)/2, offsety + 608);
	createFormationAutoSelectButton(room_width/2 - (400-16)/2, offsety + 736);
	///Create Text Boxes
	with(createFormationNameTextBox(32, 64))
	{
		width = room_width-64;
		ghostText = "";
		text = global.selectedFormation;
	}
	createFormationCycleButton(room_width/2-32, 64+80);
	with(createPlayerNameTextBox(32, offsety + 224))
	{
		width = room_width-64;
	}
}
#endregion