///@generateLocalizationFileEng
function generateLocalizationFileEng(){
	{//Buttons
		ini_open("Data/Localization/localization_english.ini");
		ini_write_string("Main", "Play", "To Battle");
		ini_write_string("Main", "FormationEditor", "War Room");
		ini_write_string("Main", "Settings", "Customization");
		ini_write_string("Main", "Info", "Advisors");
		ini_write_string("Main", "Back", "Back");
		ini_write_string("Main", "Direct", "Direct");
		ini_write_string("Main", "Local", "Local");
		ini_write_string("Main", "Online", "Online");
		ini_write_string("Main", "Host", "Host");
		ini_write_string("Main", "Connect", "Connect");
		ini_write_string("Main", "HostConnect", "Host");
		ini_write_string("Main", "Save", "Save");
		ini_write_string("Main", "Load", "Load");
		ini_write_string("Main", "InfoAbout", "About Game");
		ini_write_string("Main", "InfoCredits", "Credits");
		ini_write_string("Main", "InfoTutorial", "Tutorial");
		ini_write_string("Main", "PublicTickBox", "Visible");
		ini_write_string("Main", "OnlineTickBox", "Online");
		ini_write_string("Main", "Leave", "Leave");
		ini_write_string("Main", "Refresh", "");
		ini_write_string("Main", "Promote", "Promote");
		ini_write_string("Main", "Language", "");
		ini_write_string("Main", "VolumeChange", "");
		ini_write_string("Main", "Rematch", "Rematch");
		ini_write_string("Main", "RoomCode", "Code");
		ini_write_string("Main", "TutorialGeneralSection", "General");
		ini_write_string("Main", "TutorialPiecesSection", "Pieces");
		ini_write_string("Main", "FormationAutoSelect", "Auto select formation");
		ini_write_string("Main", "LanguageChange", "Language");
		ini_write_string("Main", "VolumeChange", "Sounds");
		ini_write_string("Main", "ChangeArtStyle", "Piece art style");
		ini_write_string("Main", "QuickMatch", "Quick Match");
		ini_write_string("Main", "DiscordInvite", "");
		ini_write_string("Main", "PatreonInvite", "");
		ini_write_string("Main", "TutorialControlsSection", "Controls");
		ini_write_string("Main", "ShowChat", "");
		ini_write_string("Main", "FormationCycle", "");
	
		ini_write_string("Extra", "Play", "Fight in real time battles with your enemies.");
		ini_write_string("Extra", "FormationEditor", "Edit your starting formation here to match your playstyle.");
		ini_write_string("Extra", "Settings", "Edit the game settings as you see fit.");
		ini_write_string("Extra", "Info", "Learn everything you need to know to assert your dominance.");
		ini_write_string("Extra", "Back", "");
		ini_write_string("Extra", "Direct", "");
		ini_write_string("Extra", "Local", "");
		ini_write_string("Extra", "Online", "");
		ini_write_string("Extra", "Host", "");
		ini_write_string("Extra", "Connect", "");
		ini_write_string("Extra", "HostConnect", "");
		ini_write_string("Extra", "Save", "");
		ini_write_string("Extra", "Load", "");
		ini_write_string("Extra", "InfoAbout", "");
		ini_write_string("Extra", "InfoCredits", "");
		ini_write_string("Extra", "InfoTutorial", "");
		ini_write_string("Extra", "PublicTickBox", "");
		ini_write_string("Extra", "OnlineTickBox", "");
		ini_write_string("Extra", "Leave", "");
		ini_write_string("Extra", "Refresh", "");
		ini_write_string("Extra", "Promote", "");
		ini_write_string("Extra", "Language", "");
		ini_write_string("Extra", "VolumeChange", "");
		ini_write_string("Extra", "Rematch", "");
		ini_write_string("Extra", "RoomCode", "");
		ini_write_string("Extra", "TutorialGeneralSection", "");
		ini_write_string("Extra", "TutorialPiecesSection", "");
		ini_write_string("Extra", "FormationAutoSelect", "");
		ini_write_string("Extra", "LanguageChange", "");
		ini_write_string("Extra", "VolumeChange", "");
		ini_write_string("Extra", "ChangeArtStyle", "");
		ini_write_string("Extra", "QuickMatch", "");
		ini_write_string("Extra", "DiscordInvite", "");
		ini_write_string("Extra", "PatreonInvite", "");
		ini_write_string("Extra", "TutorialControlsSection", "");
		ini_write_string("Extra", "ShowChat", "");
		ini_write_string("Extra", "FormationCycle", "");
	
		ini_write_string("TextBox", "FormationName", "Formation Name");
		ini_write_string("TextBox", "ServerIP", "Server IP");
		ini_write_string("TextBox", "ServerPort", "Server Port");
		ini_write_string("TextBox", "PlayerName", "Player");
		ini_write_string("TextBox", "RoomCode", "Room Code");
		ini_write_string("TextBox", "ChatMessage", "Your Message");
	
		ini_write_string("MiscText", "SelectedFormation", "Selected formation:");
		ini_write_string("MiscText", "FormationErrorNotExist", "This formation doesn't exist!");
		ini_write_string("MiscText", "FormationErrorPiecesLeft", "Use all the pieces before saving!");
		ini_write_string("MiscText", "CooldownText", "Attack cooldown:");
		ini_write_string("MiscText", "PlayerName", "Your name:");
		ini_write_string("MiscText", "ConnectionFailed", "Connection to the relay server failed.");
		ini_write_string("MiscText", "ConnectionResolved", "Connected to the relay server.");
		ini_write_string("MiscText", "ConnectionWaiting","Connecting to the relay server...");
		ini_write_string("MiscText", "SuppliesText", "Supplies:");
		ini_write_string("MiscText", "On", "On");
		ini_write_string("MiscText", "Off", "Off");
		ini_write_string("MiscText", "WaitingOpponent", "Waiting for opponent...");
		ini_write_string("MiscText", "StartingIn", "Starting in ");
		ini_write_string("MiscText", "ConnectionRejected", "Connection rejected!");
		ini_write_string("MiscText", "Port", "Port: ");
		ini_write_string("MiscText", "RoomCode", "Room Code: ");
		ini_write_string("MiscText", "WinnerIs", "Winner is ");
		ini_write_string("MiscText", "Score", "Score: ");
		ini_write_string("MiscText", "ServersOpen", "Online servers are open between 14:00 - 19:00 CEST.");
		ini_write_string("MiscText", "NoServersFound", "No online matches found :(");
		ini_close();
	}
	{//About Game	
		var file = file_text_open_write("Data/Localization/localization_english_AboutGame.txt");
		file_text_write_string(file,"   "+global.gameNameDisplay+" is a 2 player real time strategy game, similar to");
		file_text_writeln(file);
		file_text_write_string(file, "chess, in which the primary objective is capturing the enemy king.");
		file_text_writeln(file);
		file_text_write_string(file, "To do that, you command an army which you can move whenever");
		file_text_writeln(file);
		file_text_write_string(file, "you please.");
		file_text_writeln(file);
		file_text_write_string(file, "   This game was created as a Programming class project. It may");
		file_text_writeln(file);
		file_text_write_string(file, "(or may not) receive updates in the future. :)");
		file_text_close(file);
	}
	{//Credits
		file = file_text_open_write("Data/Localization/localization_english_Credits.txt");
		file_text_write_string(file, "Design & Programming");
		file_text_writeln(file);
		file_text_write_string(file, "Testing");
		file_text_writeln(file);
		file_text_write_string(file, "Programs Used");
		file_text_close(file);
	}
	{//Tutorial - General
		file = file_text_open_write("Data/Localization/localization_english_Tutorial.txt");
		file_text_write_string(file, "   The basic rule is the same as in normal chess : capture the");
		file_text_writeln(file);
		file_text_write_string(file, "enemy king, but there is no concept of \"turns\" and such, both you");
		file_text_writeln(file);
		file_text_write_string(file, "and your opponent are moving your pieces at the same time.");
		file_text_writeln(file);
		file_text_write_string(file, "   When selecting a piece, the game will show the valid movement");
		file_text_writeln(file);
		file_text_write_string(file, "and attack patterns of that piece.");
		file_text_writeln(file);
		file_text_write_string(file, "   Whenever a piece is selected, the promote button will appear. By");
		file_text_writeln(file);
		file_text_write_string(file, "pressing it, the selected piece will be changed into a new one, 50%");
		file_text_writeln(file);
		file_text_write_string(file, "of your supplies will be consumed, and the cooldown will charge");
		file_text_writeln(file);
		file_text_write_string(file, "up.");
		file_text_writeln(file);
		file_text_write_string(file, "   You gain supplies pasively, but you also gain 10% supplies when");
		file_text_writeln(file);
		file_text_write_string(file, "you capture an enemy piece. Experiment, conquer and have fun.");
		file_text_writeln(file);
		file_text_close(file);
	}
	{//Tutorial - Pieces
		ini_open("Data/Localization/localization_english_TutorialPieces.ini");
		ini_write_string("Misc", "LastLine1", "Red Square = possible attack");
		ini_write_string("Misc", "LastLine2", "Green Square = possible movement");
		
		ini_write_string("Archer", "FirstLine1", "The Archer");
		ini_write_string("Archer", "FirstLine2", "Can be promoted to Musketeer");
		ini_write_string("Archer", "FirstLine3", "Possible promotion of the Soldier");
		ini_write_string("Archer", "Note", "Note: The Archer won't move after attacking.");
	
		ini_write_string("Assassin", "FirstLine1", "The Assassin");
		ini_write_string("Assassin", "FirstLine2", "Can't be further promoted");
		ini_write_string("Assassin", "FirstLine3", "Promotion of the Paladin");
		ini_write_string("Assassin", "Note", "");
	
		ini_write_string("Chariot", "FirstLine1", "The Chariot");
		ini_write_string("Chariot", "FirstLine2", "Can be promoted to Jester");
		ini_write_string("Chariot", "FirstLine3", "Possible promotion of the Soldier");
		ini_write_string("Chariot", "Note", "");
	
		ini_write_string("Elephant", "FirstLine1", "The Elephant");
		ini_write_string("Elephant", "FirstLine2", "Can't be further promoted");
		ini_write_string("Elephant", "FirstLine3", "Promotion of the Knight");
		ini_write_string("Elephant", "Note", "");
		
		ini_write_string("General", "FirstLine1", "The General");
		ini_write_string("General", "FirstLine2", "Can't be further promoted");
		ini_write_string("General", "FirstLine3", "Unobtainable from promotion");
		ini_write_string("General", "Note", "");
		
		ini_write_string("Jester", "FirstLine1", "The Jester");
		ini_write_string("Jester", "FirstLine2", "Can't be further promoted");
		ini_write_string("Jester", "FirstLine3", "Promotion of the Chariot");
		ini_write_string("Jester", "Note", "Note: The Jester can't be blocked by any piece.");
		
		ini_write_string("King", "FirstLine1", "The King");
		ini_write_string("King", "FirstLine2", "Can't be further promoted");
		ini_write_string("King", "FirstLine3", "Unobtainable from promotion");
		ini_write_string("King", "Note", "Note: If you lose your King, you lose the game.");
		
		ini_write_string("Knight", "FirstLine1", "The Knight");
		ini_write_string("Knight", "FirstLine2", "Can be promoted to Elephant");
		ini_write_string("Knight", "FirstLine3", "Possible promotion of the Soldier");
		ini_write_string("Knight", "Note", "");
		
		ini_write_string("Musketeer", "FirstLine1", "The Musketeer");
		ini_write_string("Musketeer", "FirstLine2", "Can't be further promoted");
		ini_write_string("Musketeer", "FirstLine3", "Promotion of the Archer");
		ini_write_string("Musketeer", "Note", "Note: The Musketeer won't move after attacking.");
		
		ini_write_string("Paladin", "FirstLine1", "The Paladin");
		ini_write_string("Paladin", "FirstLine2", "Can be promoted to Assassin");
		ini_write_string("Paladin", "FirstLine3", "Possible promotion of the Soldier");
		ini_write_string("Paladin", "Note", "");
		
		ini_write_string("Soldier", "FirstLine1", "The Soldier");
		ini_write_string("Soldier", "FirstLine2", "Can be promoted to either: Archer, Chariot, Knight or Paladin");
		ini_write_string("Soldier", "FirstLine3", "Unobtainable from promotion");
		ini_write_string("Soldier", "Note", "Note: To change the Soldier's promotion, click it again.");
	}
	{//Tutorial - Controls
		file = file_text_open_write("Data/Localization/localization_english_TutorialControls.txt");
		file_text_write_string(file, "Interact with the game:");
		file_text_writeln(file);
		file_text_write_string(file, "->  Left mouse click or Simple tap on screen");
		file_text_writeln(file);
		file_text_write_string(file, "->  Down 'Face' button on Gamepad");
		file_text_writeln(file);
		file_text_write_string(file, "Remove a piece from the Formation Editor:");
		file_text_writeln(file);
		file_text_write_string(file, "->  Right mouse click or Double tap on screen");
		file_text_writeln(file);
		file_text_write_string(file, "->  Right 'Face' button on Gamepad");
		file_text_writeln(file);
		file_text_write_string(file, "Quick promotions:");
		file_text_writeln(file);
		file_text_write_string(file, "->  Space key on keyboard");
		file_text_writeln(file);
		file_text_write_string(file, "->  Top 'Face' button on Gamepad");
		file_text_writeln(file);
		file_text_write_string(file, "Change 3D camera mode:");
		file_text_writeln(file);
		file_text_write_string(file, "->  Tab key on keyboard");
		file_text_writeln(file);
		file_text_write_string(file, "->  Left 'Face' button on Gamepad");
		file_text_writeln(file);
		file_text_write_string(file, "3D camera controls:");
		file_text_writeln(file);
		file_text_write_string(file, "->  W,A,S,D; Q,E; Shift key on keyboard");
		file_text_writeln(file);
		file_text_write_string(file, "->  DPad, Left and Right Bumper, Left or Right Trigger on Gamepad");
		file_text_writeln(file);
		file_text_write_string(file, "The 'Gamepad' refers to a X input type gamepad.");
		file_text_close(file);
	}
}

///@function generateLocalizationFileRou
function generateLocalizationFileRou(){
	{//Buttons
		ini_open("Data/Localization/localization_romana.ini");
		ini_write_string("Main", "Play", "La Luptă");
		ini_write_string("Main", "FormationEditor", "Cameră de Război");
		ini_write_string("Main", "Settings", "Customizare");
		ini_write_string("Main", "Info", "Sfetnici");
		ini_write_string("Main", "Back", "Înapoi");
		ini_write_string("Main", "Direct", "Direct");
		ini_write_string("Main", "Local", "Local");
		ini_write_string("Main", "Online", "Online");
		ini_write_string("Main", "Host", "Host");
		ini_write_string("Main", "Connect", "Conectare");
		ini_write_string("Main", "HostConnect", "Host");
		ini_write_string("Main", "Save", "Salvează");
		ini_write_string("Main", "Load", "Încarcă");
		ini_write_string("Main", "InfoAbout", "Despre Joc");
		ini_write_string("Main", "InfoCredits", "Credite");
		ini_write_string("Main", "InfoTutorial", "Tutorial");
		ini_write_string("Main", "PublicTickBox", "Vizibil");
		ini_write_string("Main", "OnlineTickBox", "Online");
		ini_write_string("Main", "Leave", "Ieși");
		ini_write_string("Main", "Refresh", "");
		ini_write_string("Main", "Promote", "Promovează");
		ini_write_string("Main", "Language", "");
		ini_write_string("Main", "VolumeChange", "");
		ini_write_string("Main", "Rematch", "Joacă Iar");
		ini_write_string("Main", "RoomCode", "Cod");
		ini_write_string("Main", "TutorialGeneralSection", "General");
		ini_write_string("Main", "TutorialPiecesSection", "Piese");
		ini_write_string("Main", "FormationAutoSelect", "Selectează automat formația");
		ini_write_string("Main", "LanguageChange", "Limbă");
		ini_write_string("Main", "VolumeChange", "Sunete");
		ini_write_string("Main", "ChangeArtStyle", "Stilul pieselor");
		ini_write_string("Main", "QuickMatch", "Meci Rapid");
		ini_write_string("Main", "DiscordInvite", "");
		ini_write_string("Main", "PatreonInvite", "");
		ini_write_string("Main", "TutorialControlsSection", "Controale");
		ini_write_string("Main", "ShowChat", "");
		ini_write_string("Main", "FormationCycle", "");
	
		ini_write_string("Extra", "Play", "Poartă bătălii în timp real cu inamicii.");
		ini_write_string("Extra", "FormationEditor", "Schimbă-ți formația de început pentru a o comanda ușor.");
		ini_write_string("Extra", "Settings", "Schimbă setările jocului așa cum vrei.");
		ini_write_string("Extra", "Info", "Învață tot ce trebuie să știi pentru a-ți afirma dominanța.");
		ini_write_string("Extra", "Back", "");
		ini_write_string("Extra", "Direct", "");
		ini_write_string("Extra", "Local", "");
		ini_write_string("Extra", "Online", "");
		ini_write_string("Extra", "Host", "");
		ini_write_string("Extra", "Connect", "");
		ini_write_string("Extra", "HostConnect", "");
		ini_write_string("Extra", "Save", "");
		ini_write_string("Extra", "Load", "");
		ini_write_string("Extra", "InfoAbout", "");
		ini_write_string("Extra", "InfoCredits", "");
		ini_write_string("Extra", "InfoTutorial", "");
		ini_write_string("Extra", "PublicTickBox", "");
		ini_write_string("Extra", "OnlineTickBox", "");
		ini_write_string("Extra", "Leave", "");
		ini_write_string("Extra", "Refresh", "");
		ini_write_string("Extra", "Promote", "");
		ini_write_string("Extra", "Language", "");
		ini_write_string("Extra", "VolumeChange", "");
		ini_write_string("Extra", "Rematch", "");
		ini_write_string("Extra", "RoomCode", "");
		ini_write_string("Extra", "TutorialGeneralSection", "");
		ini_write_string("Extra", "TutorialPiecesSection", "");
		ini_write_string("Extra", "FormationAutoSelect", "");
		ini_write_string("Extra", "LanguageChange", "");
		ini_write_string("Extra", "VolumeChange", "");
		ini_write_string("Extra", "ChangeArtStyle", "");
		ini_write_string("Extra", "QuickMatch", "");
		ini_write_string("Extra", "DiscordInvite", "");
		ini_write_string("Extra", "PatreonInvite", "");
		ini_write_string("Extra", "TutorialControlsSection", "");
		ini_write_string("Extra", "ShowChat", "");
		ini_write_string("Extra", "FormationCycle", "");
	
		ini_write_string("TextBox", "FormationName", "Numele Formației");
		ini_write_string("TextBox", "ServerIP", "Server IP");
		ini_write_string("TextBox", "ServerPort", "Server Port");
		ini_write_string("TextBox", "PlayerName", "Player");
		ini_write_string("TextBox", "RoomCode", "Codul Camerei");
		ini_write_string("TextBox", "ChatMessage", "Mesajul Tău");
	
		ini_write_string("MiscText", "SelectedFormation", "Formație selectată:");
		ini_write_string("MiscText", "FormationErrorNotExist", "Această formație nu există!");
		ini_write_string("MiscText", "FormationErrorPiecesLeft", "Folosește toate piesele înainte de a salva!");
		ini_write_string("MiscText", "CooldownText", "Cooldown de atac:");
		ini_write_string("MiscText", "PlayerName", "Numele tău:");
		ini_write_string("MiscText", "ConnectionFailed", "Conexiunea la serverul intermediar a eșuat.");
		ini_write_string("MiscText", "ConnectionResolved", "Conectat la serverul intermediar.");
		ini_write_string("MiscText", "ConnectionWaiting", "Se conectează la serverul intermediar...");
		ini_write_string("MiscText", "SuppliesText", "Provizii:");
		ini_write_string("MiscText", "On", "Pornit");
		ini_write_string("MiscText", "Off", "Oprit");
		ini_write_string("MiscText", "WaitingOpponent", "Se așteaptă inamicul...");
		ini_write_string("MiscText", "StartingIn", "Începe în ");
		ini_write_string("MiscText", "ConnectionRejected", "Conexiune respinsă!");
		ini_write_string("MiscText", "Port", "Port: ");
		ini_write_string("MiscText", "RoomCode", "Codul Camerei: ");
		ini_write_string("MiscText", "WinnerIs", "Câștigătorul este ");
		ini_write_string("MiscText", "Score", "Scor: ");
		ini_write_string("MiscText", "ServersOpen", "Servere on-line sunt deschise între 14:00 - 19:00 CEST.");
		ini_write_string("MiscText", "NoServersFound", "Nu s-au găsit meciuri on-line :(");
		ini_close();
	}
	{//About Game
		var file = file_text_open_write("Data/Localization/localization_romana_AboutGame.txt");
		file_text_write_string(file,"   " + global.gameNameDisplay+" este un joc de strategie în timp real, asemănător");
		file_text_writeln(file);
		file_text_write_string(file, "cu șahul, în care obiectivul principal este să capturezi regele");
		file_text_writeln(file);
		file_text_write_string(file, "inamic. Pentru a realiza asta ai acces la o armată pe care o poți");
		file_text_writeln(file);
		file_text_write_string(file, "controla cum vrei.");
		file_text_writeln(file);
		file_text_write_string(file, "   Acest joc a fost creat ca un proiect pentru ora de programare.");
		file_text_writeln(file);
		file_text_write_string(file, "Ar mai putea (sau nu) să primească actualizări în viitor. :)");
		file_text_close(file);
	}
	{//Credits
		file = file_text_open_write("Data/Localization/localization_romana_Credits.txt");
		file_text_write_string(file, "Design & Programare");
		file_text_writeln(file);
		file_text_write_string(file, "Testare");
		file_text_writeln(file);
		file_text_write_string(file, "Programe Folosite");
		file_text_close(file);
	}
	{//Tutorial - General
		file = file_text_open_write("Data/Localization/localization_romana_Tutorial.txt");
		file_text_write_string(file, "   Regulile de bază sunt la fel ca în șahul normal: capturează");
		file_text_writeln(file);
		file_text_write_string(file, "regele inamic, dar nu există conceptul de \"ture\", așa că atât tu, cât");
		file_text_writeln(file);
		file_text_write_string(file, "și adversarul tău veți muta piesele în același timp.");
		file_text_writeln(file);
		file_text_write_string(file, "   Când o piesă este selectată, jocul va indica locurile valide pentru");
		file_text_writeln(file);
		file_text_write_string(file, "a muta acea piesă.");
		file_text_writeln(file);
		file_text_write_string(file, "   Atunci când o piesă este selectată, buttonul de promoție va");
		file_text_writeln(file);
		file_text_write_string(file, "apărea. Apăsându-l, piesa selectată se va schimba într-o piesă");
		file_text_writeln(file);
		file_text_write_string(file, "nouă, 50% din provizii vor fi consumate, iar indicatorul pentru");
		file_text_writeln(file);
		file_text_write_string(file, "\"Cooldown de atac\" se va reîncărca.");
		file_text_writeln(file);
		file_text_write_string(file, "   Obții provizii pasiv, dar și atunci când capturezi o piesă inamică");
		file_text_writeln(file);
		file_text_write_string(file, "vei primi 10% provizii. Experimentează, cucerește și distrează-te.");
		file_text_writeln(file);
		file_text_close(file);
	}
	{//Tutorial - Pieces
		ini_open("Data/Localization/localization_romana_TutorialPieces.ini");
		ini_write_string("Misc", "LastLine1", "Pătrat Roșu = atac posibil");
		ini_write_string("Misc", "LastLine2", "Pătrat Verde = mișcare posibilă");
		
		ini_write_string("Archer", "FirstLine1", "Arcașul");
		ini_write_string("Archer", "FirstLine2", "Poate fi promovat în Mușchetar");
		ini_write_string("Archer", "FirstLine3", "Promoție posibilă a Soldatului");
		ini_write_string("Archer", "Note", "Notă: Arcașul nu se va mișca după ce atacă.");
	
		ini_write_string("Assassin", "FirstLine1", "Asasinul");
		ini_write_string("Assassin", "FirstLine2", "Nu mai poate fi promovat");
		ini_write_string("Assassin", "FirstLine3", "Promoție a Paladinului");
		ini_write_string("Assassin", "Note", "");
	
		ini_write_string("Chariot", "FirstLine1", "Carul de Război");
		ini_write_string("Chariot", "FirstLine2", "Poate fi promovat în Bufon");
		ini_write_string("Chariot", "FirstLine3", "Promoție posibilă a Soldatului");
		ini_write_string("Chariot", "Note", "");
	
		ini_write_string("Elephant", "FirstLine1", "Elefantul");
		ini_write_string("Elephant", "FirstLine2", "Nu mai poate fi promovat");
		ini_write_string("Elephant", "FirstLine3", "Promoție a Cavalerului");
		ini_write_string("Elephant", "Note", "");
		
		ini_write_string("General", "FirstLine1", "Generalul");
		ini_write_string("General", "FirstLine2", "Nu mai poate fi promovat");
		ini_write_string("General", "FirstLine3", "Nu se poate obține prin promovare");
		ini_write_string("General", "Note", "");
		
		ini_write_string("Jester", "FirstLine1", "Bufonul");
		ini_write_string("Jester", "FirstLine2", "Nu mai poate fi promovat");
		ini_write_string("Jester", "FirstLine3", "Promoție a Carului de Război");
		ini_write_string("Jester", "Note", "Notă: Bufonul nu poate fi blocat de nicio piesă.");
		
		ini_write_string("King", "FirstLine1", "Regele");
		ini_write_string("King", "FirstLine2", "Nu mai poate fi promovat");
		ini_write_string("King", "FirstLine3", "Nu se poate obține prin promovare");
		ini_write_string("King", "Note", "Notă: Dacă îți pierzi Regele, vei pierde jocul.");
		
		ini_write_string("Knight", "FirstLine1", "Cavalerul");
		ini_write_string("Knight", "FirstLine2", "Poate fi promovat în Elefant");
		ini_write_string("Knight", "FirstLine3", "Promoție posibilă a Soldatului");
		ini_write_string("Knight", "Note", "");
		
		ini_write_string("Musketeer", "FirstLine1", "Mușchetarul");
		ini_write_string("Musketeer", "FirstLine2", "Nu mai poate fi promovat");
		ini_write_string("Musketeer", "FirstLine3", "Promoție a Arcașului");
		ini_write_string("Musketeer", "Note", "Notă: Mușchetarul nu se va mișca după ce atacă.");
		
		ini_write_string("Paladin", "FirstLine1", "Paladinul");
		ini_write_string("Paladin", "FirstLine2", "Poate fi promovat în Asasin");
		ini_write_string("Paladin", "FirstLine3", "Promoție posibilă a Soldatului");
		ini_write_string("Paladin", "Note", "");
		
		ini_write_string("Soldier", "FirstLine1", "Soldatul");
		ini_write_string("Soldier", "FirstLine2", "Poate fi promovat în: Arcaș, Car de Război, Cavaler sau Paladin");
		ini_write_string("Soldier", "FirstLine3", "Nu se poate obține prin promovare");
		ini_write_string("Soldier", "Note", "Notă: Pentru a schimba promoția Soldatului, apasă iar pe acesta.");
	}
	{//Tutorial - Controls
		file = file_text_open_write("Data/Localization/localization_romana_TutorialControls.txt");
		file_text_write_string(file, "Interacționează cu jocul:");
		file_text_writeln(file);
		file_text_write_string(file, "->  Click stânga sau Apăsare simplă pe ecran");
		file_text_writeln(file);
		file_text_write_string(file, "->  Butonul 'Face' jos pe Gamepad");
		file_text_writeln(file);
		file_text_write_string(file, "Scoate o piesă din editorul de formații:");
		file_text_writeln(file);
		file_text_write_string(file, "->  Click dreapta sau Apăsare dublă pe ecran");
		file_text_writeln(file);
		file_text_write_string(file, "->  Butonul 'Face' dreapta pe Gamepad");
		file_text_writeln(file);
		file_text_write_string(file, "Promoții rapide:");
		file_text_writeln(file);
		file_text_write_string(file, "->  Tasta 'Space' pe tastatură");
		file_text_writeln(file);
		file_text_write_string(file, "->  Butonul 'Face' sus pe Gamepad");
		file_text_writeln(file);
		file_text_write_string(file, "Schimbă modul camerei 3D:");
		file_text_writeln(file);
		file_text_write_string(file, "->  Tasta 'Tab' pe tastatură");
		file_text_writeln(file);
		file_text_write_string(file, "->  Butonul 'Face' stânga pe Gamepad");
		file_text_writeln(file);
		file_text_write_string(file, "Controlare cameră 3D:");
		file_text_writeln(file);
		file_text_write_string(file, "->  W,A,S,D; Q,E pe tastatură");
		file_text_writeln(file);
		file_text_write_string(file, "->  DPad, Bumper stânga și dreapta pe Gamepad");
		file_text_writeln(file);
		file_text_write_string(file, "'Gamepad' se referă la un gamepad cu input de tip X.");
		file_text_close(file);
	}
}
