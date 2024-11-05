formationError = false;

var func = function(){
	formationError = false;
}

formationErrorReset = time_source_create(time_source_game, 2, time_source_units_seconds, func);