///@function generateFormationFile
function generateFormationFile(){
	var i=1;
	var j=1;
	for(i=1; i<=4; i++)
	{
		for(j=1; j<=6; j++)
		{
			ini_write_string(string(i), string(j), "");
		}
	}
}

///@function loadFormationIntoEditor
function loadFormationIntoEditor(){
	var formationName = "";
	with(oTextBox)
	{
		if(type == "FormationName")
		{
			formationName = text;
		}
	}
	if(formationName = "")
	{
		ini_open("Data/Localization/localization_"+global.gameLanguage+".ini");	
		formationName = ini_read_string("TextBox", type, "");
		ini_close();
	}
	if(file_exists("Data/Formations/formation_"+formationName+".ini"))
	{
		ini_open("Data/Formations/formation_"+formationName+".ini");
		for(var i=1; i<= 4; i++)
		{
			for(var j=1; j<=6; j++)
			{
				with(oFormationEditorGrid)
				{
					if(row == i && column == j)
					{
						piece = ini_read_string(string(i), string(j), "");
						with(oFormationEditorSelector)
						{
							if(piece == other.piece)
							{
								count--;
							}
						}
					}
				}
			}
		}
		ini_close();
	}
}

///@function saveFormationFromEditor
function saveFormationFromEditor(){
	var name = "";
	with(oTextBox)
	{
		if(type == "FormationName")
		{
			name = text;
		}
		if(name == "")
		{
			ini_open("Data/Localization/localization_"+global.gameLanguage+".ini");	
			name = ini_read_string("TextBox", type, "");
			ini_close();
		}
	}
	ini_open("Data/Formations/formation_"+name+".ini");
	with(oFormationEditorGrid)
	{
		ini_write_string(string(row), string(column), piece);
	}
	ini_close();
}

///@function clearFormationFromEditor
function clearFormationFromEditor(){
	for(var i=1; i<= 4; i++)
	{
		for(var j=1; j<=6; j++)
		{
			with(oFormationEditorGrid)
			{
				if(row == i && column == j)
				{
					with(oFormationEditorSelector)
					{
						if(piece == other.piece)
						{
							count++;
						}
					}
					piece = "";
				}
			}
		}
	}
}

///@function generateBaseFormation
function generateBaseFormation(){
	ini_open("Data/Formations/formation_base.ini");
	generateFormationFile();
	ini_write_string("3", "1", "Soldier");
	ini_write_string("3", "2", "Archer");
	ini_write_string("2", "3", "Soldier");
	ini_write_string("2", "4", "Soldier");
	ini_write_string("3", "5", "Archer");
	ini_write_string("3", "6", "Soldier");
	
	ini_write_string("2", "2", "Soldier");
	ini_write_string("2", "5", "Soldier");
	
	ini_write_string("4", "1", "Chariot");
	ini_write_string("4", "2", "Paladin");
	ini_write_string("4", "3", "General");
	ini_write_string("4", "4", "King");
	ini_write_string("4", "5", "Paladin");
	ini_write_string("4", "6", "Chariot");
	
	ini_write_string("3", "3", "Knight");
	ini_write_string("3", "4", "Knight");
	ini_close();
}

///@function loadMyFormation()
///@param {string} formation
function loadMyFormation(formation){
	ini_open("Data/Formations/formation_"+formation+".ini");
	var i=1;
	var j=1;
	
	for(i=1+6; i<=10; i++)
	{
		for(j=1+2; j<=10-2; j++)
		{
			global.gridTable[i][j].piece = ini_read_string(string(i-6), string(j-2), "");
			if(global.gridTable[i][j].piece != "")
			{
				global.gridTable[i][j].pieceType = "My";
			}
		}
	}
	ini_close();
}