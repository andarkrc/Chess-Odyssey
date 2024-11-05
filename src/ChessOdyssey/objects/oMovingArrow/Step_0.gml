move_towards_point(targetX, targetY, spd);
if(distance_to_point(targetX, targetY) <= spd)
{
	instance_destroy();
}

