var controller_input_joy_h = gamepad_axis_value(0, gp_axislh);
var controller_input_joy_v = gamepad_axis_value(0, gp_axislv);
controller_input_joy_h = abs(controller_input_joy_h) > 0.2 ? controller_input_joy_h : 0;
controller_input_joy_v = abs(controller_input_joy_v) > 0.2 ? controller_input_joy_v : 0;
var default_dist = 5;
with(oCameraHandler) 
{
	if(can_move) 
	{
		default_dist = 1;
		controller_input_joy_h = sign(controller_input_joy_h);
		controller_input_joy_v = sign(controller_input_joy_v);
	}
}
var gp_ainput = controller_input_joy_h != 0 || controller_input_joy_v != 0;
if(gamepad_button_check(0, gp_shoulderlb)) default_dist = default_dist*2;
var newx = clamp(window_mouse_get_x() + default_dist*controller_input_joy_h, 0, window_get_width());
var newy = clamp(window_mouse_get_y() + default_dist*controller_input_joy_v, 0, window_get_height());
if(gp_ainput)
{
	window_mouse_set(newx, newy);
}

var space_key_pressed = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face4);

var isCooldown = false;
if(cooldown > 0)
{
	isCooldown = true;
}
canMovePiece = gameStarted*(!isCooldown)*(!gameEnded);

if(selectedGrid.row < 1)
{
	with(oButtonGeneral)
	{
		if(type == "Promote")
		{
			instance_destroy();
		}
	}
}

if(space_key_pressed)
{
	with(oButtonGeneral)
	{
		if(type == "Promote")
		{
			leftClickAction();
		}
	}
}

if(supplies > 100)
{
	supplies = 100;
}

if(supplies < 100)
{
	supplies += 0.01*gameStarted*(!gameEnded);
}

if(cooldown > 0)
{
	cooldown -= 0.005;
}

var existsLeave = false;
with(oButtonGeneral)
{
	if(type == "Leave")
	{
		existsLeave = true;
	}
}
if(!gameEnded && gameStarted && existsLeave)
{
	with(oButtonGeneral)
	{
		if(type == "Leave")
		{
			instance_destroy();
		}
	}
}

if(gameEnded == true && rematch_enemy == true && rematch_self == true)
{
	cooldown = 0;
	supplies = 10;
	gameStarted = false;
	gameEnded = false;
	starting = 3;
	rematch_enemy = false;
	rematch_self = false;
	time_source_stop(gameStarter);
	time_source_destroy(gameStarter);
	gameStarter = time_source_create(time_source_game, 1, time_source_units_seconds, gameStartingFunc, [], 4);
	time_source_start(gameStarter);
	for(var i=1;i<=10;i++)
	{
		for(var j=1;j<=10;j++)
		{
			global.gridTable[i][j].piece = "";
			global.gridTable[i][j].pieceType = "";
		}
	}
	loadMyFormation(global.selectedFormation);
	with(oGrid)
	{
		pieceUpdate();
	}
	time_source_start(resendFormation);
	with(oButtonGeneral)
	{
		if(type == "Rematch")
		{
			instance_destroy();
		}
	}
}

if(!gameStarted)
{
	var existsEnemy = false;
	with(oGrid)
	{
		if(pieceType == "Enemy")
		{
			existsEnemy = true;
		}
	}
	
	if(!existsLeave && !existsEnemy && !gameEnded && !gameStarted)
	{
		createLeaveButton(192, room_height/2 + 128*5);
	}
}

