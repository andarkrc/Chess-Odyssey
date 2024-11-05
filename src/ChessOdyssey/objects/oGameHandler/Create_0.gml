selectedGrid = {
	row : 0,
	column : 0
};
canMovePiece = true;
gameStarted = false;
gameEnded = false;
winner = "";
starting = 15;
cooldown = 0;

supplies = 10;
promotingTo = "";

rematch_self = false;
rematch_enemy = false;

generateGrid();
loadMyFormation(global.selectedFormation);

if(global.pieceArt == "3D")
{
	instance_create_layer(room_width/2, room_height/2, "Instances", oCameraHandler);
}

//Start game
gameStartingFunc = function(){
	if(starting > 1)
	{
		starting--;
	}
	else
	{
		gameStarted = true;
	}
}
gameStarter = time_source_create(time_source_game, 1, time_source_units_seconds, gameStartingFunc, [], 15);

//Resend formation
resendFormationFunc = function(){
	with(oNetworkingHandler)
	{
		winner = "";
		if(global.connectionMode == "server" || global.connectionMode == "client_host")
		{
			sendFormationToSocket(enemy.clientID);
		}
		else
		{
			sendFormationToSocket(client);
		}
	}
}
resendFormation = time_source_create(time_source_game, 1, time_source_units_seconds, resendFormationFunc);