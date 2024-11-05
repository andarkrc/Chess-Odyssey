function NewColAABBFromMinMax(point_min, point_max, owner = undefined){
	var center_position = point_min.Add(point_max).Div(2);
	var half_size = point_max.Sub(point_min).Div(2).Abs();
	return new ColAABB(center_position, half_size, owner);
}

function NewColRayFromPoints(start, finish, owner = undefined){
	var dir = finish.Sub(start).Normalize();
	return new ColRay(start, dir, owner);
}



function ScreenToWorldCoords(x_, y_, v, p){
	/*
		Scripted by TheSnidr - math stuff
		Sligthly modified by @dragonitespam - works with the Vector3 'Library'
		Sligthly modified by me(and_ark#8921) - the return is a Vector3Pair
	*/
	
	var mx = 2 * (x_ / room_width - 0.5) / p[0];
	var my = 2 * (y_ / room_height - 0.5) / p[5];
	var camX = - (v[12] * v[0] + v[13] * v[1] + v[14] * v[2]);
	var camY = - (v[12] * v[4] + v[13] * v[5] + v[14] * v[6]);
	var camZ = - (v[12] * v[8] + v[13] * v[9] + v[14] * v[10]);

	var origin = new Vector3(camX, camY, camZ);
	var dir;
	
	if(p[15] == 0)
	{
		dir = new Vector3(v[2] + mx * v[0] + my * v[1], v[6] + mx * v[4] + my * v[5], v[10] + mx * v[8] + my * v[9]);
	}
	else
	{
		dir = new Vector3(v[2], v[6], v[10]);
	}
	
	return new Vector3Pair(origin, dir);
}

function RayCastHitInformation() constructor{
	self.shape = undefined;
	self.point = undefined;
	self.distance = infinity;
	self.normal = undefined;
	
	static Update = function(distance, shape, point, normal){
		if(distance <= self.distance)
		{
			self.distance = distance;
			self.shape = shape;
			self.point = point;
			self.normal = normal;
		}
	};
	
	static Clear = function(){
		self.shape = undefined;
		self.point = undefined;
		self.distance = infinity;
		self.normal = undefined;
	};
}