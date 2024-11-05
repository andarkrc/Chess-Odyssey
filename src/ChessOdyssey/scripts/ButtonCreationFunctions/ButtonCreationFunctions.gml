{///General Use Buttons
	///@function createBackButton
	///@param xx
	///@param yy
	function createBackButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 144;
			height = 96;
			type = "Back";
		
			leftClickAction = function(){
				if(global.orientation == "landscape")
				{
					room_goto(rMainMenu);
				} 
				else if(global.orientation == "portrait")
				{
					room_goto(rMainMenuP);
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}


}

{///Text boxes
	///@function createFormationNameTextBox
	///@param xx
	///@param yy
	function createFormationNameTextBox(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "ReplaceableButtons", oTextBox))
		{
			type = "FormationName";
			ini_open("Data/Localization/localization_"+global.gameLanguage+".ini");
			ghostText = ini_read_string("TextBox", type, "");
			ini_close();
			width = 800-32;
			height = 64;
			ButtonID = id;
		}
		return ButtonID;
	}
	///@function createPlayerNameTextBox
	///@param xx
	///@param yy
	function createPlayerNameTextBox(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "ReplaceableButtons", oTextBox))
		{
			type = "PlayerName";
			text = global.playerName;
			width = 800-32;
			height = 64;
			ButtonID = id;
		}
		return ButtonID;
	}
	///@function createServerIPTextBox
	///@param xx
	///@param yy
	function createServerIPTextBox(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "ReplaceableButtons", oTextBox))
		{
			type = "ServerIP";
			ini_open("Data/Localization/localization_"+global.gameLanguage+".ini");
			ghostText = ini_read_string("TextBox", type, "");
			ini_close();
			width = 416;
			height = 64;
			ButtonID = id;
		}
		return ButtonID;
	}
	///@function createServerPortTextBox
	///@param xx
	///@param yy
	function createServerPortTextBox(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "ReplaceableButtons", oTextBox))
		{
			type = "ServerPort";
			ini_open("Data/Localization/localization_"+global.gameLanguage+".ini");
			ghostText = ini_read_string("TextBox", type, "");
			ini_close();
			width = 416;
			height = 64;
			ButtonID = id;
		}
		return ButtonID;
	}
	///@function createRoomCodeTextBox
	///@param xx
	///@param yy
	function createRoomCodeTextBox(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "ReplaceableButtons", oTextBox))
		{
			type = "RoomCode";
			ini_open("Data/Localization/localization_"+global.gameLanguage+".ini");
			ghostText = ini_read_string("TextBox", type, "");
			ini_close();
			width = 416;
			height = 64;
			ButtonID = id;
		}
		return ButtonID;
	}
	///@function createChatMessageTextBox
	///@param xx
	///@param yy
	function createChatMessageTextBox(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oTextBox))
		{
			type = "ChatMessage";
			ini_open("Data/Localization/localization_"+global.gameLanguage+".ini");
			ghostText = ini_read_string("TextBox", type, "");
			ini_close();
			width = 896 - 64 - 48;
			height = 64;
			ButtonID = id;
			
			enterAction = function(){
				var temp_text = text;
				with(oChatHandler)
				{
					addMessageInChat(temp_text, global.playerName, "self");
				}
				text = "";
				with(oNetworkingHandler)
				{
					var packet1 = buffer_create(256, buffer_grow, 1);
					buffer_seek(packet1, buffer_seek_start, 0);
					buffer_write(packet1, buffer_string, global.gameName);
					buffer_write(packet1, buffer_string, "chat_message");
					buffer_write(packet1, buffer_string, global.playerName);
					buffer_write(packet1, buffer_string, temp_text);
					if(global.connectionMode == "server")
					{
						network_send_packet(enemy.clientID, packet1, buffer_tell(packet1));
					}
					else
					{
						network_send_packet(client, packet1, buffer_tell(packet1));
					}
					buffer_delete(packet1);
				}
			}
		}
		return ButtonID;
	}
}

{///Main Menu Buttons
	///@function createPlayButton
	///@param xx
	///@param yy
	function createPlayButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 320;
			height = 96;
			type = "Play";
		
			leftClickAction = function(){
				if(global.orientation == "landscape")
				{
					room_goto(rServerSelect);
				} else if(global.orientation == "portrait")
				{
					room_goto(rServerSelectP);
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}

	///@function createFormationEditorButton
	///@param xx
	///@param yy
	function createFormationEditorButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 320;
			height = 96;
			type = "FormationEditor";
		
			leftClickAction = function(){
				if(global.orientation == "landscape")
				{
					room_goto(rFormationEditor);
				}else if(global.orientation == "portrait")
				{
					room_goto(rFormationEditorP);
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}

	///@function createCustomizationButton
	///@param xx
	///@param yy
	function createCustomizationButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 320;
			height = 96;
			type = "Settings";
		
			leftClickAction = function(){
				if(global.orientation == "landscape")
				{
					room_goto(rSettingsMenu);
				}else if(global.orientation == "portrait")
				{
					room_goto(rSettingsMenuP);
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}

	///@function createInfoButton
	///@param xx
	///@param yy
	function createInfoButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 320;
			height = 96;
			type = "Info";
		
			leftClickAction = function(){
				if(global.orientation == "landscape")
				{
					room_goto(rInfoMenu);
				}else if(global.orientation == "portrait")
				{
					room_goto(rInfoMenuP);
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}

}

{///Formation Editor Buttons
	///@function createSaveButton
	///@param xx
	///@param yy
	function createSaveButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 144;
			height = 96;
			type = "Save";
		
			leftClickAction = function(){
				var canSave = true;
				with(oFormationEditorSelector)
				{
					if(count != 0)
					{
						canSave = false;
					}
				}
				if(canSave)
				{
					saveFormationFromEditor();
					if(global.formationAutoSelect)
					{
						with(oTextBox)
						{
							if(global.selectedFormation != text && file_exists("Data/Formations/formation_"+text+".ini"))
							{
								global.selectedFormation = text;
								ini_open("Data/settings.ini");
								ini_write_string("Settings", "selectedFormation", text);
								ini_close();
							}
						}
					}
				}
				else
				{
					with(oFormationEditorHandler)
					{
						ini_open("Data/Localization/localization_"+global.gameLanguage+".ini");
						errorMessage = ini_read_string("MiscText", "FormationErrorPiecesLeft", "");
						time_source_start(formationError);
						ini_close();
					}
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
	///@function createLoadButton
	///@param xx
	///@param yy
	function createLoadButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 144;
			height = 96;
			type = "Load";
		
			leftClickAction = function(){
				var tempText = "";
				with(oTextBox)
				{
					if(type == "FormationName")
					{
						tempText = text;
					}
				}
				if(file_exists("Data/Formations/formation_"+tempText+".ini"))
				{
					clearFormationFromEditor();
					loadFormationIntoEditor();
				}
				else
				{
					with(oFormationEditorHandler)
					{
						ini_open("Data/Localization/localization_"+global.gameLanguage+".ini");
						errorMessage = ini_read_string("MiscText", "FormationErrorNotExist", "");
						time_source_start(formationError);
						ini_close();
					}
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}

	///@function createFormationCycleButton
	///@param xx
	///@param yy
	function createFormationCycleButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 64;
			height = 64;
			type = "FormationCycle";
			specialIcon = "sCycleButtonIcon";
			formationNameFromPath = "";
		
			leftClickAction = function(){
				var formationPath = "Data/Formations/";
				if(formationNameFromPath == "")
				{
					formationNameFromPath = file_find_first(formationPath+"*.ini", 0);
					formationNameFromPath = string_copy(formationNameFromPath, string_length("formation_")+1, string_length(formationNameFromPath) - string_length("formation_")-string_length(".ini"));
				}
				else
				{
					formationNameFromPath = file_find_next();
					if(formationNameFromPath == "")
					{
						leftClickAction();
						return;
					}
					formationNameFromPath = string_copy(formationNameFromPath, string_length("formation_")+1, string_length(formationNameFromPath) - string_length("formation_")-string_length(".ini"));
				}
				
				with(oTextBox)
				{
					if(type == "FormationName")
					{
						text = other.formationNameFromPath;
					}
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
	
}

{///Info Menu Buttons
	///@function createAboutButton
	///@param xx
	///@param yy
	function createAboutButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 288;
			height = 96;
			type = "InfoAbout";
		
			leftClickAction = function(){
				with(oInfoHandler)
				{
					infoTab = "AboutGame";
				}
				with(oButtonGeneral)
				{
					if(replaceable)
					{
						instance_destroy();
					}
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
	
	///@function createCreditsButton
	///@param xx
	///@param yy
	function createCreditsButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 288;
			height = 96;
			type = "InfoCredits";
		
			leftClickAction = function(){
				with(oInfoHandler)
				{
					infoTab = "Credits";
				}
				with(oButtonGeneral)
				{
					if(replaceable)
					{
						instance_destroy();
					}
				}
				if(global.orientation == "landscape")
				{
					createDiscordInviteButton(room_width -112, room_height -128);
					createPatreonInviteButton(room_width -224, room_height -128);
				}else if(global.orientation == "portrait")
				{
					createDiscordInviteButton(room_width -160, room_height -256-96);
					createPatreonInviteButton(96, room_height -256-96);
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
	
	///@function createTutorialButton
	///@param xx
	///@param yy
	function createTutorialButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 288;
			height = 96;
			type = "InfoTutorial";
		
			leftClickAction = function(){
				with(oInfoHandler)
				{
					infoTab = "Tutorial";
					tutorialTab = "General";
					tutorialMaxLevel = 1;
					tutorialLevel = 1;
				}
				with(oButtonGeneral)
				{
					if(replaceable)
					{
						instance_destroy();
					}
				}
				if(global.orientation == "landscape")
				{
					createTutorialGeneralSectionButton(288+128, 15);
					createTutorialPiecesSectionButton(288+128+16+160, 15);
					createTutorialControlsSectionButton(288+128+32+320, 15);
				}else if(global.orientation == "portrait")
				{
					with(createTutorialGeneralSectionButton(64, room_height-256))
					{
						width = 186;
					}
					with(createTutorialPiecesSectionButton(64+186+16, room_height-256))
					{
						width = 186;
					}
					with(createTutorialControlsSectionButton(64+186*2+32, room_height-256))
					{
						width = 186;
					}
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}

	///@function createTutorialGeneralSectionButton
	///@param xx
	///@param yy
	function createTutorialGeneralSectionButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 160;
			height = 48;
			type = "TutorialGeneralSection";
			replaceable = true;
			mainFont = fnSmall;
		
			leftClickAction = function(){
				with(oButtonGeneral)
				{
					if(type == "TutorialScroll")
					{
						instance_destroy();
					}
				}
				with(oInfoHandler)
				{
					tutorialTab = "General";
					tutorialMaxLevel = 1;
					tutorialLevel = 1;
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
	
	///@function createTutorialPiecesSectionButton
	///@param xx
	///@param yy
	function createTutorialPiecesSectionButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 160;
			height = 48;
			type = "TutorialPiecesSection";
			replaceable = true;
			mainFont = fnSmall;
		
			leftClickAction = function(){
				with(oButtonGeneral)
				{
					if(type == "TutorialScroll")
					{
						instance_destroy();
					}
				}
				with(oInfoHandler)
				{
					tutorialTab = "Pieces";
					tutorialMaxLevel = 11;
					tutorialLevel = 1;
				}
				if(global.orientation == "landscape")
				{
					createTutorialScrollButton(128+288+16, room_height-128+16, "<");
					createTutorialScrollButton(room_width-96, room_height-128+16, ">");
				}else if(global.orientation == "portrait")
				{
					createTutorialScrollButton(96, room_height -256-96, "<");
					createTutorialScrollButton(room_width -160, room_height -256-96, ">");
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
		
	///@function createTutorialScrollButton
	///@param xx
	///@param yy
	///@param direction_scroll
	function createTutorialScrollButton(xx, yy, direction_scroll){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "ReplaceableButtons", oButtonGeneral))
		{
			width = 48;
			height = 48;
			type = "TutorialScroll";
			mainText = direction_scroll;
			replaceable = true;
		
			leftClickAction = function(){
				with(oInfoHandler)
				{
					if(infoTab == "Tutorial")
					{
						if(tutorialLevel > 1 && other.mainText == "<")
						{
							tutorialLevel--;
						}
						if(tutorialLevel < tutorialMaxLevel && other.mainText == ">")
						{
							tutorialLevel++;
						}
					}
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}

	///@function createDiscordInviteButton
	///@param xx
	///@param yy
	function createDiscordInviteButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "ReplaceableButtons", oButtonGeneral))
		{
			width = 64;
			height = 64;
			type = "DiscordInvite";
			replaceable = true;
			specialIcon = "sDiscordLogo";
			
			leftClickAction = function(){
				url_open("https://discord.gg/9KzuJqK42h");
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
	
	///@function createPatreonInviteButton
	///@param xx
	///@param yy
	function createPatreonInviteButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "ReplaceableButtons", oButtonGeneral))
		{
			width = 64;
			height = 64;
			type = "PatreonInvite";
			replaceable = true;
			specialIcon = "sPatreonLogo";
			
			leftClickAction = function(){
				url_open("https://www.patreon.com/and_ark");
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}

	///@function createTutorialControlsSectionButton
	///@param xx
	///@param yy
	function createTutorialControlsSectionButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 160;
			height = 48;
			type = "TutorialControlsSection";
			replaceable = true;
			mainFont = fnSmall;
		
			leftClickAction = function(){
				with(oButtonGeneral)
				{
					if(type == "TutorialScroll")
					{
						instance_destroy();
					}
				}
				with(oInfoHandler)
				{
					tutorialTab = "Controls";
					tutorialMaxLevel = 1;
					tutorialLevel = 1;
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
	
}

{///Server Selection Buttons
	///@function createDirectConnectButton
	///@param xx
	///@param yy
	function createDirectConnectButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 160;
			height = 80;
			type = "Direct";
		
			leftClickAction = function(){
				if(oMenuHandler.connectionType != type)
				{
					with(oButtonGeneral)
					{
						if(replaceable)
						{
							instance_destroy();
						}
					}
					with(oTextBox)
					{
						instance_destroy();
					}
					if(global.orientation == "landscape")
					{
						createServerIPTextBox(80, 192);
						createServerPortTextBox(80+416+128, 192);
						createQuickMatchButton(80+416-40, 448);
					}
					else if(global.orientation == "portrait")
					{
						createServerIPTextBox(room_width/2 - 416/2, 224);
						createServerPortTextBox(room_width/2 - 416/2, 336);
						createQuickMatchButton(room_width/2 - 240/2, room_height - 288);
					}
					oMenuHandler.connectionType = "Direct";
				}	
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
				
	///@function createQuickMatchButton
	///@param xx
	///@param yy
	function createQuickMatchButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "ReplaceableButtons", oButtonGeneral))
		{
			width = 240;
			height = 80;
			type = "QuickMatch";
			replaceable = true;
		
			leftClickAction = function(){
				global.serverIP = global.autServerIP;
				global.serverPort = global.autServerPort;
				if(oAutServerHandler.total_servers != 0)
				{
					var position = irandom(oAutServerHandler.total_servers);
					if(position == 0)
					{
						position = 1;
					}
					global.connectionTo = oAutServerHandler.servers[position].clientID;
					global.connectionMode = "client";
				}
				else
				{
					global.connectionTo = -1;
					global.connectionMode = "client_host";
					global.visibility = 1;
				}
				with(oAutServerHandler)
				{
					network_destroy(client);
				}
				if(global.orientation == "landscape")
				{
					room_goto(rGameTime);
				}else if(global.orientation == "portrait")
				{
					room_goto(rGameTimeP);
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
		
	///@function createOnlineConnectButton
	///@param xx
	///@param yy
	function createOnlineConnectButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 160;
			height = 80;
			type = "Online";
		
			leftClickAction = function(){
				if(oMenuHandler.connectionType != type)
				{
					with(oButtonGeneral)
					{
						if(replaceable)
						{
							instance_destroy();
						}
					}
					with(oTextBox)
					{
						instance_destroy();
					}
					oMenuHandler.connectionType = "Online";
					oAutServerHandler.server_level = 0;
					if(global.orientation == "landscape")
					{
						GenerateOnlineServerList();
					}else if(global.orientation == "portrait")
					{
						GenerateOnlineServerListP();
					}
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
	
	///@function createRoomCodeConnectButton
	///@param xx
	///@param yy
	function createRoomCodeConnectButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 160;
			height = 80;
			type = "RoomCode";
		
			leftClickAction = function(){
				if(oMenuHandler.connectionType != type)
				{
					with(oButtonGeneral)
					{
						if(replaceable)
						{
							instance_destroy();
						}
					}
					with(oTextBox)
					{
						instance_destroy();
					}
					if(global.orientation == "landscape")
					{
						createRoomCodeTextBox(80, 192);
					}else if(global.orientation == "portrait")
					{
						createRoomCodeTextBox(room_width/2 - 416/2, 224);
					}
					oMenuHandler.connectionType = "Code";
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
	
	///@function createPublicTickButton
	///@param xx
	///@param yy
	function createPublicTickButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "ReplaceableButtons", oButtonGeneral))
		{
			width = 192;
			height = 80;
			type = "PublicTickBox";
			ticked = true;
			replaceable = true;
		
			leftClickAction = function(){
				ticked = !ticked;
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
	
	///@function createOnlineTickButton
	///@param xx
	///@param yy
	function createOnlineTickButton(xx, yy){
		var ButtonID = -1;

		with(instance_create_layer(xx, yy, "ReplaceableButtons", oButtonGeneral))
		{
			
			width = 192;
			height = 80;
			type = "OnlineTickBox";
			ticked = false;
			replaceable = true;
		
			
			leftClickAction = function(){
				ticked = !ticked;
				if(ticked)
				{
					if(global.orientation == "landscape")
					{
						createPublicTickButton(x + width+192,  y);
					}else if(global.orientation == "portrait")
					{
						createPublicTickButton(x,  y + height + 64);
					}
				}
				else
				{
					with(oButtonGeneral)
					{
						if(type == "PublicTickBox")
						{
							instance_destroy();
						}
					}
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
		
	///@function createRefreshButton
	///@param xx
	///@param yy
	function createRefreshButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 80;
			height = 80;
			type = "Refresh";
			specialIcon = "sRefreshButtonIcon";
			
		
			leftClickAction = function(){
				if(oAutServerHandler.isConnected >= 0)
				{
					with(oAutServerHandler)
					{
						for(var i = 1; i <= total_servers; i++)
						{
							servers[i] = {
								clientID : -1,
								clientName : ""
							};
						}
						total_servers = 0;
						server_level = 0;
						var packet = buffer_create(256, buffer_grow, 1);
						buffer_seek(packet, buffer_seek_start, 0);
						buffer_write(packet, buffer_string, global.gameName);
						buffer_write(packet, buffer_string, "aut_request_servers");
						network_send_packet(client, packet, buffer_tell(packet));
						buffer_delete(packet);
					}
					if(oMenuHandler.connectionType == "Online")
					{
						with(oButtonGeneral)
						{
							if(replaceable)
							{
								instance_destroy();
							}
						}
						with(oAutServerHandler)
						{
							time_source_start(onlineServerListLoading);
						}
					}
				}
				else
				{
					with(oAutServerHandler)
					{
						waitingForResponse = true;
						isConnected = network_connect_async(client, global.autServerIP, real(global.autServerPort));
						stillConnected = true;
						time_source_start(connectionVerify);
					}
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
	
	///@function createHostConnectButton
	///@param xx
	///@param yy
	function createHostConnectButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 160;
			height = 80;
			type = "Host";
		
			leftClickAction = function(){
				if(oMenuHandler.connectionType != type)
				{
					with(oButtonGeneral)
					{
						if(replaceable)
						{
							instance_destroy();
						}
					}
					with(oTextBox)
					{
						instance_destroy();
					}
					if(global.orientation == "landscape")
					{
						createOnlineTickButton(80, 192);
					}else if(global.orientation == "portrait")
					{
						createOnlineTickButton(room_width/2 - 192/2, 256);
					}
					oMenuHandler.connectionType = "Host";
				}	
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
		
	///@function createConnectButton
	///@param xx
	///@param yy
	function createConnectButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 240;
			height = 96;
			type = "Connect";
		
			leftClickAction = function(){
				if(oMenuHandler.connectionType != "Host")
				{
					global.connectionMode = "client";
					if(oMenuHandler.connectionType == "Direct")
					{
						with(oTextBox)
						{
							if(type == "ServerIP")
							{
								global.serverIP = text;
							}
							if(type == "ServerPort")
							{
								var PORT = string_digits(text);
								if(PORT == "")
								{
									PORT = "0";
								}
								global.serverPort = real(PORT);
							}
						}
						if(global.orientation == "landscape")
						{
							room_goto(rGameTime);
						}else if(global.orientation == "portrait")
						{
							room_goto(rGameTimeP);
						}
						
					}
					else if(oMenuHandler.connectionType == "Online")
					{
						global.connectionTo = -2;
						with(oButtonGeneral)
						{
							if(type == "OnlineServerList")
							{
								if(targeted)
								{
									global.connectionTo = myTarget;
								}
							}
						}
						if(global.connectionTo != -2)
						{
							with(oAutServerHandler)
							{
								network_destroy(client);
							}
							global.serverIP = global.autServerIP;
							global.serverPort = real(global.autServerPort);
							if(global.orientation == "landscape")
							{
								room_goto(rGameTime);
							}else if(global.orientation == "portrait")
							{
								room_goto(rGameTimeP);
							}	
						}
					}
					else if(oMenuHandler.connectionType == "Code")
					{
						global.connectionTo = -2;
						with(oTextBox)
						{
							if(type == "RoomCode") 
							{
								if(string_digits(text) != "")
								{
									global.connectionTo = real(string_digits(text));
								}
								else
								{
									global.connectionTo = -2;
								}
							}
						}
						if(global.connectionTo != -2)
						{
							with(oAutServerHandler)
							{
								network_destroy(client);
							}
							global.serverIP = global.autServerIP;
							global.serverPort = real(global.autServerPort);
							if(global.orientation == "landscape")
							{
								room_goto(rGameTime);
							}else if(global.orientation == "portrait")
							{
								room_goto(rGameTimeP);
							}	
						}
					}
				}
				else
				{
					var isOnline = false;
					with(oButtonGeneral)
					{
						if(type == "OnlineTickBox")
						{
							isOnline = ticked;
						}
					}
					if(isOnline)
					{
						global.connectionMode = "client_host";
						global.serverIP = global.autServerIP;
						global.serverPort = global.autServerPort;
						global.connectionTo = -1;
						with(oButtonGeneral)
						{
							if(type == "PublicTickBox")
							{
								global.visibility = ticked;
							}
						}
						with(oAutServerHandler)
						{
							network_destroy(client);
						}
					}
					else
					{
						global.connectionMode = "server";
					}
					if(global.orientation == "landscape")
					{
						room_goto(rGameTime);
					}else if(global.orientation == "portrait")
					{
						room_goto(rGameTimeP);
					}
				} 
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
	
	///@function createOnlineServerListButton
	///@param xx
	///@param yy
	///@param position_in_server_array
	function createOnlineServerListButton(xx, yy, position_in_server_array){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "ReplaceableButtons", oButtonGeneral))
		{
			width = 512;
			height = 96;
			type = "OnlineServerList";
			mainText = oAutServerHandler.servers[3*oAutServerHandler.server_level+position_in_server_array].clientName + "'s room";
			myTarget = oAutServerHandler.servers[3*oAutServerHandler.server_level+position_in_server_array].clientID;
			replaceable = true;
			scrollAffected = true;
		
			leftClickAction = function(){
				switch(targeted)
				{
					case true : 
						with(oButtonGeneral)
						{
							if(type == "Connect")
							{
								leftClickAction();
							}
						}
						break;
					case false :
						with(oButtonGeneral)
						{
							if(type == "OnlineServerList")
							{
								targeted = false;
							}
						}
						targeted = true;
						break;
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
		
	///@function createOnlineServerListScrollButton
	///@param xx
	///@param yy
	///@param direction_type
	function createOnlineServerListScrollButton(xx, yy, direction_type){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "ReplaceableButtons", oButtonGeneral))
		{
			width = 96;
			height = 96;
			type = "OnlineServerListScroll";
			replaceable = true;
			mainText = direction_type;
		
			leftClickAction = function(){
				if(mainText == "<")
				{
					oAutServerHandler.server_level--;
				}
				else
				{
					oAutServerHandler.server_level++;
				}
				if(global.orientation == "landscape")
				{
					GenerateOnlineServerList();
				}else if(global.orientation == "portrait")
				{
					GenerateOnlineServerListP();
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
	
}
	
{///Settings Buttons
	///@function createLanguageButton
	///@param xx
	///@param yy
	function createLanguageButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 400-16;
			height = 64;
			type = "LanguageChange";
			ini_open("Data/Localization/localization_"+global.gameLanguage+".ini");
			if(global.gameLanguage == "english")
			{
				extraText = "English";
			}
			else if(global.gameLanguage == "romana")
			{
				extraText = "Română";
			}
			ini_close();
		
			leftClickAction = function(){
				switch(global.gameLanguage)
				{
					case "english" :
						global.gameLanguage = "romana";
						break;
					case "romana" :
						global.gameLanguage = "english";
						break;
					default :
						global.gameLanguage = "english";
						break;
				}
				ini_open("Data/settings.ini");
				ini_write_string("Settings", "gameLanguage", global.gameLanguage);
				ini_close();
				room_restart();
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
	///@function createPieceArtButton
	///@param xx
	///@param yy
	function createPieceArtButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 400-16;
			height = 64;
			type = "ChangeArtStyle";
			ini_open("Data/Localization/localization_"+global.gameLanguage+".ini");
			extraText = global.pieceArt;
			ini_close();
		
			leftClickAction = function(){
				switch(global.pieceArt)
				{
					case "Classic" :
						global.pieceArt = "Shogi";
						break;
					case "Shogi" :
						global.pieceArt = "3D";
						break;
					case "3D" :
						global.pieceArt = "Classic";
						break;
				}
				extraText = global.pieceArt;
				ini_open("Data/settings.ini");
				ini_write_string("Settings", "pieceArt", global.pieceArt);
				ini_close();
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
	///@function createSoundVolumeButton
	///@param xx
	///@param yy
	function createSoundVolumeButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 400-16;
			height = 64;
			type = "VolumeChange";
			ini_open("Data/Localization/localization_"+global.gameLanguage+".ini");
			if(global.soundVolume == 1)
			{
				extraText = ini_read_string("MiscText", "On", "On");
			}
			else
			{
				extraText = ini_read_string("MiscText", "Off", "Off");
			}
			ini_close();
		
			leftClickAction = function(){
				global.soundVolume = !global.soundVolume;
				ini_open("Data/Localization/localization_"+global.gameLanguage+".ini");
				if(global.soundVolume == 1)
				{
					extraText = ini_read_string("MiscText", "On", "On");
				}
				else
				{
					extraText = ini_read_string("MiscText", "Off", "Off");
				}
				ini_close();
				ini_open("Data/settings.ini");
				ini_write_string("Settings", "soundVolume", global.soundVolume);
				ini_close();
				audio_group_set_gain(audiogroup_default, global.soundVolume/10, 0);
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
	///@function createFormationAutoSelectButton
	///@param xx
	///@param yy
	function createFormationAutoSelectButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 400-16;
			height = 64;
			type = "FormationAutoSelect";
			ini_open("Data/Localization/localization_"+global.gameLanguage+".ini");
			if(global.formationAutoSelect == 1)
			{
				extraText = ini_read_string("MiscText", "On", "On");
			}
			else
			{
				extraText = ini_read_string("MiscText", "Off", "Off");
			}
			ini_close();
		
			leftClickAction = function(){
				global.formationAutoSelect = !global.formationAutoSelect;
				ini_open("Data/Localization/localization_"+global.gameLanguage+".ini");
				if(global.formationAutoSelect == 1)
				{
					extraText = ini_read_string("MiscText", "On", "On");
				}
				else
				{
					extraText = ini_read_string("MiscText", "Off", "Off");
				}
				ini_close();
				ini_open("Data/settings.ini");
				ini_write_string("Settings", "formationAutoSelect", global.formationAutoSelect);
				ini_close();
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
}
	
{///Gameplay Buttons
	///@function createLeaveButton
	///@param xx
	///@param yy
	function createLeaveButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 320;
			height = 96;
			type = "Leave";
		
			leftClickAction = function(){
				if(global.orientation == "landscape")
				{
					room_goto(rServerSelect);
				}else if(global.orientation == "portrait")
				{
					room_goto(rServerSelectP);
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
	///@function createPromotionButton
	///@param xx
	///@param yy
	function createPromotionButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			x = room_width - 320 - 192;
			y = room_height/2 + 128*5;
			width = 320;
			height = 96;
			type = "Promote";
		
			leftClickAction = function(){
				if(oGameHandler.cooldown == 0 && oGameHandler.supplies > 50)
				{
					if(global.connectionMode == "client")
					{
						var selpiece = global.gridTable[oGameHandler.selectedGrid.row][oGameHandler.selectedGrid.column].piece;
						var selpiecetype = global.gridTable[oGameHandler.selectedGrid.row][oGameHandler.selectedGrid.column].pieceType;
						if((selpiece == "Soldier" || selpiece == "Knight" || selpiece == "Chariot" || selpiece == "Paladin" || selpiece == "Archer") && selpiecetype == "My")
						{
							oGameHandler.cooldown = 1;
							oGameHandler.supplies -= 50;
							with(oNetworkingHandler)
							{
								requestPromotion(oGameHandler.selectedGrid.row, oGameHandler.selectedGrid.column, oGameHandler.promotingTo);
							}
						}
					}
					else
					{
						var selpiece = global.gridTable[oGameHandler.selectedGrid.row][oGameHandler.selectedGrid.column].piece;
						var selpiecetype = global.gridTable[oGameHandler.selectedGrid.row][oGameHandler.selectedGrid.column].pieceType;
						if((selpiece == "Soldier" || selpiece == "Knight" || selpiece == "Chariot" || selpiece == "Paladin" || selpiece == "Archer") && selpiecetype == "My")
						{
							oGameHandler.cooldown = 1;
							oGameHandler.supplies -= 50;
							animationPromotePiece(oGameHandler.selectedGrid.row, oGameHandler.selectedGrid.column, "My");
							mySound2 = audio_play_sound(sndPiecePromotion, 1, false);
							global.gridTable[oGameHandler.selectedGrid.row][oGameHandler.selectedGrid.column].piece = oGameHandler.promotingTo;
							with(oNetworkingHandler)
							{
								var packet = buffer_create(256, buffer_grow, 1);
								buffer_seek(packet, buffer_seek_start, 0);
								buffer_write(packet, buffer_string, global.gameName);
								buffer_write(packet, buffer_string, "animate_promotion");
								buffer_write(packet, buffer_s8, 11 - oGameHandler.selectedGrid.row);
								buffer_write(packet, buffer_s8, 11 - oGameHandler.selectedGrid.column);
								buffer_write(packet, buffer_string, "Enemy");
								network_send_packet(enemy.clientID, packet, buffer_tell(packet));
								buffer_delete(packet);
							
								sendGridUpdateToSocket(enemy.clientID, 11 - oGameHandler.selectedGrid.row, 11 - oGameHandler.selectedGrid.column, oGameHandler.promotingTo, "Enemy");
							}
							with(oGrid)
							{
								pieceUpdate();
								validMove = false;
								validAttack = false;
								if(selected)
								{
									generateOptions();
								}
							}
						}
					}
					//oGameHandler.promotingTo = "";
					switch(oGameHandler.promotingTo)
					{
						case "Soldier" :
							oGameHandler.promotingTo = "Knight";
							break;
						case "Knight" :
							oGameHandler.promotingTo = "Elephant";
							break;
						case "Chariot" :
							oGameHandler.promotingTo = "Jester";
							break;
						case "Paladin" :
							oGameHandler.promotingTo = "Assassin";
							break;
						case "Archer" :
							oGameHandler.promotingTo = "Musketeer";
							break;
						default : 
							oGameHandler.promotingTo = "";
							break;
					}
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
	///@function createRematchButton
	///@param xx
	///@param yy
	function createRematchButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			x = room_width - 320 - 192;
			y = room_height/2 + 128*5;
			width = 320;
			height = 96;
			type = "Rematch";
		
			leftClickAction = function(){
				if(!cooldown)
				{
					cooldown = true;
					time_source_start(buttonCooldownReset);
					switch(oGameHandler.rematch_self)
					{
						case true :
							oGameHandler.rematch_self = false;
							break;
						case false :
							oGameHandler.rematch_self = true;
							break;
						default :
							oGameHandler.rematch_self = true;
							break;
					}
					with(oNetworkingHandler)
					{
						var packet = buffer_create(256, buffer_grow, 1);
						buffer_seek(packet, buffer_seek_start, 0);
						buffer_write(packet, buffer_string, global.gameName);
						buffer_write(packet, buffer_string, "game_rematch");
						if(global.connectionMode == "client")
						{
							network_send_packet(client, packet, buffer_tell(packet));
						}
						else
						{
							network_send_packet(enemy.clientID, packet, buffer_tell(packet));
						}
						buffer_delete(packet);
					}
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}

	///@function createShowChatButton
	///@param xx
	///@param yy
	function createShowChatButton(xx, yy){
		var ButtonID = -1;
		with(instance_create_layer(xx, yy, "Instances", oButtonGeneral))
		{
			width = 128;
			height = 128;
			type = "ShowChat";
		
			leftClickAction = function(){
				with(oChatHandler)
				{
					can_display_chat = !can_display_chat;
					new_unseen_message = false;
				}
			}
			ButtonID = id;
		}
	
		return ButtonID;
	}
}
