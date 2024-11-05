selectedPiece = "";
errorMessage = "";

var func = function(){
	errorMessage = "";
}

formationError = time_source_create(time_source_game, 2, time_source_units_seconds, func);