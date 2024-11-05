if(global.orientation == "landscape")
{
	drawSetup(0.5, c_white);
	draw_rectangle(64 + 288 + 64, 64, room_width-32, room_height-48, false);
	drawSetup(1, c_black);
	draw_rectangle(64 + 288 + 64, 64, room_width-32, room_height-48, true);
}else if(global.orientation == "portrait")
{
	drawSetup(0.5, c_white);
	draw_rectangle(64, 112, room_width-64, room_height-272, false);
	drawSetup(1, c_black);
	draw_rectangle(64, 112, room_width-64, room_height-272, true);
}
var cc_yellow = make_color_rgb(160, 160, 0);
if(global.orientation == "landscape")
{
	switch(infoTab)
	{
		case "AboutGame" :
			var file = file_text_open_read("Data/Localization/localization_"+global.gameLanguage+"_AboutGame.txt");
			drawSetup(1, c_black, fnSmall);
			draw_text(64+288+64+16, 96, file_text_read_string(file));
			file_text_readln(file);
			draw_text(64+288+64+16, 96 + 48, file_text_read_string(file));
			file_text_readln(file);
			draw_text(64+288+64+16, 96 + 48*2, file_text_read_string(file));
			file_text_readln(file);
			draw_text(64+288+64+16, 96 + 48*3, file_text_read_string(file));
			file_text_readln(file);
			draw_text(64+288+64+16, 96 + 48*4, file_text_read_string(file));
			file_text_readln(file);
			draw_text(64+288+64+16, 96 + 48*5, file_text_read_string(file));
			file_text_close(file);
			break;
		case "Credits" :
			var file = file_text_open_read("Data/Localization/localization_"+global.gameLanguage+"_Credits.txt");
			drawSetup(1, c_teal, fnNotSoSmall);
			draw_text(64+288+64+16, 96, file_text_read_string(file));//Coloana din stanga
			drawSetup(1, c_black, fnSmall);
			draw_text(64+288+64+16, 96 + 32, "Popa Andrei");
			file_text_readln(file);
			
			drawSetup(1, cc_yellow, fnNotSoSmall);
			draw_text(64+288+64+16, 96+96, file_text_read_string(file));
			drawSetup(1, c_black, fnSmall);
			draw_text(64+288+64+16, 96+96+32, "Dorobăț Alexandru");
			draw_text(64+288+64+16, 96+96+32*2, "Nedelcu Răzvan");
			draw_text(64+288+64+16, 96+96+32*3, "Petrescu Sorin");
			draw_text(64+288+64+16, 96+96+32*4, "Rusu Andrei");
			draw_text(64+288+64+16, 96+96+32*5, "Ursescu Sebastian");
			draw_text(64+288+64+16, 96+96+32*6, "Vidrașc Sabin");
			file_text_readln(file);
			
			drawSetup(1, c_purple, fnNotSoSmall);
			draw_text(64+288+64+16, 96+96+32*6+64, file_text_read_string(file));
			drawSetup(1, c_black, fnNotSoTiny);
			draw_text(64+288+64+16, 96+96+32*7+64, "GameMaker Studio");
			draw_text(64+288+64+16, 96+96+32*8+64, "Magica Voxel");
			draw_text(64+288+64+16, 96+96+32*9+64, "Blender");
			
			
		
			drawSetup(1, c_maroon, fnNotSoSmall);
			draw_text(16+288+64+64+512, 96, "Freesound.org");//Coloana din dreapta
			drawSetup(1, c_black, fnSmall);
			draw_text(16+288+64+64+512, 96 + 32, "BenjaminNelan");
			draw_text(16+288+64+64+512, 96 + 32*2, "ChaosEntertainment");
			draw_text(16+288+64+64+512, 96 + 32*3, "GameDevC");
			draw_text(16+288+64+64+512, 96 + 32*4, "nezuai");
			draw_text(16+288+64+64+512, 96 + 32*5, "PearceWilsonKing");
			
			drawSetup(1, c_green, fnNotSoSmall);
			draw_text(16+288+64+64+512, 96+32*5+64, "flaticon.com");
			drawSetup(1, c_black, fnSmall);
			draw_text(16+288+64+64+512, 96+32*5+64+32, "Freepik");
			drawSetup(1, c_blue, fnNotSoSmall);
			draw_text(16+288+64+64+512, 96+32*5+128+32, "freepik.com");
			drawSetup(1, c_black, fnSmall);
			draw_text(16+288+64+64+512, 96+32*5+128+64, "freepik");
			drawSetup(1, #00B7EB, fnNotSoSmall);
			draw_text(16+288+64+64+512, 96+32*5+128+128, "sketchfab.com");
			drawSetup(1, c_black, fnSmall);
			draw_text(16+288+64+64+512, 96+32*5+128+128+32, "skybox3dArchitect");
			file_text_close(file);
			break;
		case "Tutorial" :
			if(tutorialTab = "General")
			{
				var file = file_text_open_read("Data/Localization/localization_"+global.gameLanguage+"_Tutorial.txt");
				drawSetup(1, c_black, fnSmall);
				draw_text(64+288+64+16, 96, file_text_read_string(file));
				file_text_readln(file);
				draw_text(64+288+64+16, 96 + 48, file_text_read_string(file));
				file_text_readln(file);
				draw_text(64+288+64+16, 96 + 48*2, file_text_read_string(file));
				file_text_readln(file);
				draw_text(64+288+64+16, 96 + 48*3, file_text_read_string(file));
				file_text_readln(file);
				draw_text(64+288+64+16, 96 + 48*4, file_text_read_string(file));
				file_text_readln(file);
				draw_text(64+288+64+16, 96 + 48*5, file_text_read_string(file));
				file_text_readln(file);
				draw_text(64+288+64+16, 96 + 48*6, file_text_read_string(file));
				file_text_readln(file);
				draw_text(64+288+64+16, 96 + 48*7, file_text_read_string(file));
				file_text_readln(file);
				draw_text(64+288+64+16, 96 + 48*8, file_text_read_string(file));
				file_text_readln(file);
				draw_text(64+288+64+16, 96 + 48*9, file_text_read_string(file));
				file_text_readln(file);
				draw_text(64+288+64+16, 96 + 48*10, file_text_read_string(file));
				file_text_close(file);
			}
			else if(tutorialTab == "Pieces")
			{
				var file_key = "";
				var tutorial_key = "";
				drawSetup(1, c_black, fnSmall, fa_center, fa_middle);
				draw_text((128+288+room_width-32)/2, room_height-88, string(tutorialLevel)+"/"+string(tutorialMaxLevel));
				switch(tutorialLevel)
				{
					case 1  : file_key = "Soldier";   tutorial_key = sTutorialSoldier;   break;
					case 2  : file_key = "Archer";    tutorial_key = sTutorialArcher;    break;
					case 3  : file_key = "Chariot";   tutorial_key = sTutorialChariot;   break;
					case 4  : file_key = "Knight";    tutorial_key = sTutorialKnight;    break;
					case 5  : file_key = "Paladin";   tutorial_key = sTutorialPaladin;   break;
					case 6  : file_key = "Musketeer"; tutorial_key = sTutorialMusketeer; break;
					case 7  : file_key = "Jester";    tutorial_key = sTutorialJester;    break;
					case 8  : file_key = "Elephant";  tutorial_key = sTutorialElephant;  break;
					case 9  : file_key = "Assassin";  tutorial_key = sTutorialAssassin;  break;
					case 10 : file_key = "General";   tutorial_key = sTutorialGeneral;   break;
					case 11 : file_key = "King";      tutorial_key = sTutorialKing;      break;
					default : file_key = "King";      tutorial_key = sTutorialKing;      break;
				}
			
				draw_sprite_stretched(tutorial_key, 0, 160+288, 96, 668/2, 668/2);
				draw_sprite_stretched(asset_get_index("sMy"+file_key+global.pieceArt), 0, 288+288+7, 96+128+6, 32, 32);
				draw_sprite(asset_get_index("sMy"+file_key+global.pieceArt), 0, 128+288+668/2+32, 96+96+64);
				if(tutorialLevel == 7)
				{
					draw_sprite_stretched(asset_get_index("sEnemySoldier"+global.pieceArt), 0, 288+288+7, 96+128+6-32-32-1, 32, 32);
				}
				ini_open("Data/Localization/localization_"+global.gameLanguage+"_TutorialPieces.ini");
				drawSetup(1, c_black, fnMedium, fa_left, fa_middle);
				draw_text(160+288+668/2+32, 96+32, ini_read_string(file_key, "FirstLine1", ""));
				drawSetup(1, c_black, fnSmall, fa_left, fa_middle);
				if(tutorialLevel == 1)
				{
					drawSetup(1, c_black, fnTiny, fa_left, fa_middle);
				}
				draw_text(160+288+668/2+32, 96+96, ini_read_string(file_key, "FirstLine2", ""));
				drawSetup(1, c_black, fnSmall, fa_left, fa_middle);
				draw_text(160+288+668/2+32, 96+96+48, ini_read_string(file_key, "FirstLine3", ""));
			
				drawSetup(1, c_maroon, fnSmall);
				draw_text(160+288, 96*5, ini_read_string("Misc", "LastLine1", ""));
				drawSetup(1, c_green, fnSmall);
				draw_text(160+288, 96*5 + 48, ini_read_string("Misc", "LastLine2", ""));
				drawSetup(1, c_black, fnSmall);
				draw_text(160+288, 96*6, ini_read_string(file_key, "Note", ""));
			}
			else if(tutorialTab == "Controls")
			{
				var file = file_text_open_read("Data/Localization/localization_"+global.gameLanguage+"_TutorialControls.txt");
				drawSetup(1, c_navy, fnNotSoTiny, fa_left, fa_middle);
				draw_text(128+16+288, 96, file_text_read_string(file));
				file_text_readln(file);
				drawSetup(1, c_black, fnKindaTiny)
				draw_text(128+16+288, 96+32, file_text_read_string(file));
				file_text_readln(file);
				draw_text(128+16+288, 96+32*2, file_text_read_string(file));
				file_text_readln(file);
				drawSetup(1, c_navy, fnNotSoTiny)
				draw_text(128+16+288, 96+32*3, file_text_read_string(file));
				file_text_readln(file);
				drawSetup(1, c_black, fnKindaTiny)
				draw_text(128+16+288, 96+32*4, file_text_read_string(file));
				file_text_readln(file);
				draw_text(128+16+288, 96+32*5, file_text_read_string(file));
				file_text_readln(file);
				drawSetup(1, c_navy, fnNotSoTiny)
				draw_text(128+16+288, 96+32*6, file_text_read_string(file));
				file_text_readln(file);
				drawSetup(1, c_black, fnKindaTiny)
				draw_text(128+16+288, 96+32*7, file_text_read_string(file));
				file_text_readln(file);
				draw_text(128+16+288, 96+32*8, file_text_read_string(file));
				file_text_readln(file);
				drawSetup(1, c_navy, fnNotSoTiny)
				draw_text(128+16+288, 96+32*9, file_text_read_string(file));
				file_text_readln(file);
				drawSetup(1, c_black, fnKindaTiny)
				draw_text(128+16+288, 96+32*10, file_text_read_string(file));
				file_text_readln(file);
				draw_text(128+16+288, 96+32*11, file_text_read_string(file));
				file_text_readln(file);
				drawSetup(1, c_navy, fnNotSoTiny)
				draw_text(128+16+288, 96+32*12, file_text_read_string(file));
				file_text_readln(file);
				drawSetup(1, c_black, fnKindaTiny)
				draw_text(128+16+288, 96+32*13, file_text_read_string(file));
				file_text_readln(file);
				draw_text(128+16+288, 96+32*14, file_text_read_string(file));
				file_text_readln(file);
				draw_text(128+16+288, 96+32*16, file_text_read_string(file));
				file_text_close(file);
			}
			break;
		default : break;
	}
}
else if(global.orientation == "portrait")
{
	switch(infoTab)
	{
		case "AboutGame" :
			var file = file_text_open_read("Data/Localization/localization_"+global.gameLanguage+"_AboutGame.txt");
			drawSetup(1, c_black, fnKindaTiny);
			draw_text(72, 96 + 48, file_text_read_string(file));
			file_text_readln(file);
			draw_text(72, 96 + 32 + 48, file_text_read_string(file));
			file_text_readln(file);
			draw_text(72, 96 + 32*2 + 48, file_text_read_string(file));
			file_text_readln(file);
			draw_text(72, 96 + 32*3 + 48, file_text_read_string(file));
			file_text_readln(file);
			draw_text(72, 96 + 32*4 + 48, file_text_read_string(file));
			file_text_readln(file);
			draw_text(72, 96 + 32*5 + 48, file_text_read_string(file));
			file_text_close(file);
			break;
		case "Credits" :
			var file = file_text_open_read("Data/Localization/localization_"+global.gameLanguage+"_Credits.txt");
			drawSetup(1, c_teal, fnNotSoSmall);
			draw_text(72, 96 + 48, file_text_read_string(file));//Coloana din stanga
			drawSetup(1, c_black, fnNotSoTiny);
			draw_text(72, 96 + 48+32, "Popa Andrei");
			file_text_readln(file);
			
			drawSetup(1, cc_yellow, fnNotSoSmall);
			draw_text(72, 96+96+48, file_text_read_string(file));
			drawSetup(1, c_black, fnNotSoTiny);
			draw_text(72, 96+96+48+32, "Dorobăț Alexandru");
			draw_text(72, 96+96+48+32*2, "Nedelcu Răzvan");
			draw_text(72, 96+96+48+32*3, "Petrescu Sorin");
			draw_text(72, 96+96+48+32*4, "Rusu Andrei");
			draw_text(72, 96+96+48+32*5, "Ursescu Sebastian");
			draw_text(72, 96+96+48+32*6, "Vidrașc Sabin");
			file_text_readln(file);
			
			drawSetup(1, c_purple, fnNotSoSmall);
			draw_text(384, 96+96+48, file_text_read_string(file));
			drawSetup(1, c_black, fnNotSoTiny)
			draw_text(384, 96+96+48+32, "GameMaker Studio");
			draw_text(384, 96+96+48+32*2, "Magica Voxel");
			draw_text(384, 96+96+48+32*3, "Blender");
			
			drawSetup(1, #00B7EB, fnNotSoSmall);
			draw_text(384, 96+96+48+32*3+64, "sketchfab.com");
			drawSetup(1, c_black, fnNotSoTiny);
			draw_text(384, 96+96+48+32*3+64+32, "skybox3dArchitect");
		
			drawSetup(1, c_maroon, fnNotSoSmall);
			draw_text(72, 96+96+48+32*6 + 64, "Freesound.org");
			drawSetup(1, c_black, fnSmall);
			draw_text(72, 96+96+48+32*6 + 64 + 32, "BenjaminNelan");
			draw_text(72, 96+96+48+32*6 + 64 + 32*2, "ChaosEntertainment");
			draw_text(72, 96+96+48+32*6 + 64 + 32*3, "GameDevC");
			draw_text(72, 96+96+48+32*6 + 64 + 32*4, "nezuai");
			draw_text(72, 96+96+48+32*6 + 64 + 32*5, "PearceWilsonKing");
			
			drawSetup(1, c_green, fnNotSoSmall);
			draw_text(72, 96+96+48+32*6+64+32*5+64, "flaticon.com");
			drawSetup(1, c_black, fnSmall);
			draw_text(72, 96+96+48+32*6+64+32*5+64+32, "Freepik");
			drawSetup(1, c_blue, fnNotSoSmall);
			draw_text(72, 96+96+48+32*6+64+32*5+64+32+48, "freepik.com");
			drawSetup(1, c_black, fnSmall);
			draw_text(72, 96+96+48+32*6+64+32*5+64+32+48+32, "freepik");
			file_text_close(file);
			break;
		case "Tutorial" :
			if(tutorialTab = "General")
			{
				var file = file_text_open_read("Data/Localization/localization_"+global.gameLanguage+"_Tutorial.txt");
				drawSetup(1, c_black, fnKindaTiny);
				draw_text(72, 96 + 48, file_text_read_string(file));
				file_text_readln(file);
				draw_text(72, 96 + 48 + 32, file_text_read_string(file));
				file_text_readln(file);
				draw_text(72, 96 + 48 + 32*2, file_text_read_string(file));
				file_text_readln(file);
				draw_text(72, 96 + 48 + 32*3, file_text_read_string(file));
				file_text_readln(file);
				draw_text(72, 96 + 48 + 32*4, file_text_read_string(file));
				file_text_readln(file);
				draw_text(72, 96 + 48 + 32*5, file_text_read_string(file));
				file_text_readln(file);
				draw_text(72, 96 + 48 + 32*6, file_text_read_string(file));
				file_text_readln(file);
				draw_text(72, 96 + 48 + 32*7, file_text_read_string(file));
				file_text_readln(file);
				draw_text(72, 96 + 48 + 32*8, file_text_read_string(file));
				file_text_readln(file);
				draw_text(72, 96 + 48 + 32*9, file_text_read_string(file));
				file_text_readln(file);
				draw_text(72, 96 + 48 + 32*10, file_text_read_string(file));
				file_text_close(file);
			}
			else if(tutorialTab == "Pieces")
			{
				var file_key = "";
				var tutorial_key = "";
				drawSetup(1, c_black, fnSmall, fa_center, fa_middle);
				draw_text(room_width/2, room_height-320, string(tutorialLevel)+"/"+string(tutorialMaxLevel));
				switch(tutorialLevel)
				{
					case 1  : file_key = "Soldier";   tutorial_key = sTutorialSoldier;   break;
					case 2  : file_key = "Archer";    tutorial_key = sTutorialArcher;    break;
					case 3  : file_key = "Chariot";   tutorial_key = sTutorialChariot;   break;
					case 4  : file_key = "Knight";    tutorial_key = sTutorialKnight;    break;
					case 5  : file_key = "Paladin";   tutorial_key = sTutorialPaladin;   break;
					case 6  : file_key = "Musketeer"; tutorial_key = sTutorialMusketeer; break;
					case 7  : file_key = "Jester";    tutorial_key = sTutorialJester;    break;
					case 8  : file_key = "Elephant";  tutorial_key = sTutorialElephant;  break;
					case 9  : file_key = "Assassin";  tutorial_key = sTutorialAssassin;  break;
					case 10 : file_key = "General";   tutorial_key = sTutorialGeneral;   break;
					case 11 : file_key = "King";      tutorial_key = sTutorialKing;      break;
					default : file_key = "King";      tutorial_key = sTutorialKing;      break;
				}
			
				draw_sprite_stretched(tutorial_key, 0, room_width/2-668/2 + 48, 128, 668/2, 668/2);
				draw_sprite_stretched(asset_get_index("sMy"+file_key+global.pieceArt), 0, room_width/2-668/2+128+7 + 48, 128+128+6, 32, 32);
				draw_sprite(asset_get_index("sMy"+file_key+global.pieceArt), 0, room_width/2 + 80, 192);
				if(tutorialLevel == 7)
				{
					draw_sprite_stretched(asset_get_index("sEnemySoldier"+global.pieceArt), 0, room_width/2-668/2+128+7 + 48, 128+128+6-32-32-1, 32, 32);
				}
				ini_open("Data/Localization/localization_"+global.gameLanguage+"_TutorialPieces.ini");
				drawSetup(1, c_black, fnNotSoSmall, fa_left, fa_middle);
				draw_text(72, 96*5+64, ini_read_string(file_key, "FirstLine1", ""));
				drawSetup(1, c_black, fnKindaTiny, fa_left, fa_middle);
				draw_text(72, 96*5+32+64, ini_read_string(file_key, "FirstLine2", ""));
				drawSetup(1, c_black, fnKindaTiny, fa_left, fa_middle);
				draw_text(72, 96*5+64+64, ini_read_string(file_key, "FirstLine3", ""));
			
				drawSetup(1, c_maroon, fnKindaTiny);
				draw_text(72, 96*7+64, ini_read_string("Misc", "LastLine1", ""));
				drawSetup(1, c_green, fnKindaTiny);
				draw_text(72, 96*7 + 32+64, ini_read_string("Misc", "LastLine2", ""));
				drawSetup(1, c_black, fnKindaTiny);
				draw_text(72, 96*7 + 64+64, ini_read_string(file_key, "Note", ""));
			}
			else if(tutorialTab == "Controls")
			{
				var file = file_text_open_read("Data/Localization/localization_"+global.gameLanguage+"_TutorialControls.txt");
				drawSetup(1, c_navy, fnNotSoTiny, fa_left, fa_middle);
				draw_text(72, 96+32, file_text_read_string(file));
				file_text_readln(file);
				drawSetup(1, c_black, fnKindaTiny);
				draw_text(72, 96+32*2, file_text_read_string(file));
				file_text_readln(file);
				draw_text(72, 96+32*3, file_text_read_string(file));
				file_text_readln(file);
				drawSetup(1, c_navy, fnNotSoTiny);
				draw_text(72, 96+32*4, file_text_read_string(file));
				file_text_readln(file);
				drawSetup(1, c_black, fnKindaTiny);
				draw_text(72, 96+32*5, file_text_read_string(file));
				file_text_readln(file);
				draw_text(72, 96+32*6, file_text_read_string(file));
				file_text_readln(file);
				drawSetup(1, c_navy, fnNotSoTiny);
				draw_text(72, 96+32*7, file_text_read_string(file));
				file_text_readln(file);
				drawSetup(1, c_black, fnKindaTiny);
				draw_text(72, 96+32*8, file_text_read_string(file));
				file_text_readln(file);
				draw_text(72, 96+32*9, file_text_read_string(file));
				file_text_readln(file);
				drawSetup(1, c_navy, fnNotSoTiny);
				draw_text(72, 96+32*10, file_text_read_string(file));
				file_text_readln(file);
				drawSetup(1, c_black, fnKindaTiny);
				draw_text(72, 96+32*11, file_text_read_string(file));
				file_text_readln(file);
				draw_text(72, 96+32*12, file_text_read_string(file));
				file_text_readln(file);
				drawSetup(1, c_navy, fnNotSoTiny);
				draw_text(72, 96+32*13, file_text_read_string(file));
				file_text_readln(file);
				drawSetup(1, c_black, fnKindaTiny);
				draw_text(72, 96+32*14, file_text_read_string(file));
				file_text_readln(file);
				draw_text(72, 96+32*15, file_text_read_string(file));
				file_text_readln(file);
				draw_text(72, 96+32*17, file_text_read_string(file));
				file_text_close(file);
			}
			break;
		default : break;
	}
}