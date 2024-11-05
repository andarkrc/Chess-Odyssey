image_speed = 0;
image_index = 0;
row = 0;
column = 0;
piece = "";
pieceType = "";
mouseHover = false;
selected = false;
wasSelected = true;
mySound = -1;
validMove = false;
validAttack = false;
if(global.pieceArt != "3D")
{
	depth = -2;
}
else
{
	depth = 90;
}

if(global.pieceArt == "3D")
{
	model_data = NewColAABBFromMinMax(new Vector3(x, y, 96-5), new Vector3(x + 192, y + 192, 96), id);
}

letters = ["NULL", "A", "B", "C", "D", "E", "F", "G", "H", "I", "j"];

///@function generateOptions
function generateOptions(){
	var i=0;
	
	switch(piece)
	{
		case "Soldier" : generateSoldierOptions();break;
		case "Chariot" : for(i=0; i<4; i++){generateChariotOptions(i);}break;
		case "Paladin" : for(i=0; i<4; i++){generatePaladinOptions(i);}break;
		case "General" : for(i=0; i<8; i++){generateGeneralOptions(i);}break;
		case "Knight"  : for(i=0; i<8; i++){generateKnightOptions(i);}break;
		case "Archer"  : generateArcherOptions();break;
		case "Musketeer" : generateMusketeerOptions();break;
		case "Elephant" : generateElephantOptions();break;
		case "King" : for(i=0; i<8; i++){generateKingOptions(i);}break;
		case "Assassin" : for(i=0; i<5; i++){generateAssassinOptions(i, 3);}break;
		case "Jester" : for(i=0; i<4; i++){generateJesterOptions(i, 4);}break;
		default : break;
	}
}

///@function pieceUpdate
function pieceUpdate(){
	piece = global.gridTable[row][column].piece;
	pieceType = global.gridTable[row][column].pieceType;
}



