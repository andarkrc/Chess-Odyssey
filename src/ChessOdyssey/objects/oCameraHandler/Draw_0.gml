draw_clear_alpha(c_white, 1);
var camera = camera_get_active();


var xlookat = x + cos(yaw_rotation)*cos(pitch_rotation);
var ylookat = y - sin(yaw_rotation)*cos(pitch_rotation);
var zlookat = z - sin(pitch_rotation);


//var xlookat = room_width/2 - 512*cos(yaw_rotation);
//var ylookat = room_height/2 - 512*sin(yaw_rotation);
//var zlookat = 0;

view_matrix = matrix_build_lookat(x, y, z, xlookat, ylookat, zlookat, 0, 0, 1);
proj_matrix = matrix_build_projection_perspective_fov(100, window_get_width()/window_get_height(), 1, 32000);


camera_set_view_mat(camera, view_matrix);
camera_set_proj_mat(camera, proj_matrix);
camera_apply(camera);


var grid_z = 192;

var uniform_light_position = shader_get_uniform(sh_point_light, "lightPosition");
var uniform_light_colour = shader_get_uniform(sh_point_light, "lightColour");
var uniform_light_range = shader_get_uniform(sh_point_light, "lightRange");
var uniform_custom_alpha = shader_get_uniform(sh_point_light, "customAlpha");

gpu_set_zwriteenable(false);
matrix_set(matrix_world, matrix_build(x, y, z, 90, 0, 0, 1, 1, -1));
vertex_submit(global.skybox, pr_trianglelist, sprite_get_texture(global.skybox_texture, 0));
gpu_set_zwriteenable(true);


shader_set(sh_point_light);
shader_set_uniform_f(uniform_light_position, x, y, z);
shader_set_uniform_f(uniform_light_colour, 1, 1, 1, 1);
shader_set_uniform_f(uniform_light_range, point_light_range);
shader_set_uniform_f(uniform_custom_alpha, -1);

#region Raycast
/*
var matrix = matrix_build(0, 0, 0, 0, 0, 0, 1, 1, 1);
matrix_set(matrix_world, matrix);
if(!is_undefined(mouse_ray_cast))
{
	var large_number = 1000000;
	
	var orgx = x;
	var orgy = y;
	var orgz = z;
	
	var orgx = room_width/2;
	var orgy = room_height/2;
	var orgz = -1000;
	
	var xx = orgx+large_number*mouse_ray_cast.direction.x;
	var yy = orgy+large_number*mouse_ray_cast.direction.y;
	var zz = orgz+large_number*mouse_ray_cast.direction.z;
	
	if(!is_undefined(mouse_ray_cast_hit_info.shape))
	{
		xx = mouse_ray_cast_hit_info.point.x;
		yy = mouse_ray_cast_hit_info.point.y;
		zz = mouse_ray_cast_hit_info.point.z;
		show_debug_message(mouse_ray_cast_hit_info.point);
	}
	

	var mouse_cast = vertex_create_buffer();
	vertex_begin(mouse_cast, global.vertex_format);
	bufferAddPoint(mouse_cast, orgx, orgy, 1+orgz, 0, 0, 0, 1, 1, c_lime, 1);
	bufferAddPoint(mouse_cast, xx, yy, zz, 0, 0, 0, 1, 1, c_lime, 1);
	vertex_end(mouse_cast);
	vertex_submit(mouse_cast, pr_linelist, -1);
	vertex_delete_buffer(mouse_cast);
}
*/
#endregion
with(oGrid)
{
	var matrix = matrix_build(x, y + 192, grid_z, 90, 0, 0, 48, 48, 48);
	matrix_set(matrix_world, matrix);
	if(!selected && !validAttack && !validMove)
	{
		if((row+column) mod 2 == 1)
		{
			vertex_submit(global.chess_grid_model_black, pr_trianglelist, sprite_get_texture(global.atlas_3D, 0));
		}
		else
		{
			vertex_submit(global.chess_grid_model_white, pr_trianglelist, sprite_get_texture(global.atlas_3D, 0));
		}
	}
	else if(selected)
	{
		vertex_submit(global.chess_grid_model_yellow, pr_trianglelist, sprite_get_texture(global.atlas_3D, 0));
	}
	else
	{
		if(validAttack)
		{
			vertex_submit(global.chess_grid_model_red, pr_trianglelist, sprite_get_texture(global.atlas_3D, 0));
		}
		else
		{
			if(validMove)
			{
				vertex_submit(global.chess_grid_model_green, pr_trianglelist, sprite_get_texture(global.atlas_3D, 0));
			}
		}
	}
	if(mouseHover == true)
	{
		matrix = matrix_build(x-1, y + 193, grid_z+4, 90, 0, 0, 49, 49, 50);
		matrix_set(matrix_world, matrix);
		vertex_submit(global.chess_grid_model_select, pr_trianglelist, sprite_get_texture(global.atlas_3D, 0));
	}
	
	
	var mxx = 0;
	var myy = 192;
	var mzz = -1;
	if(piece == "Soldier" || (piece == "Jester" && pieceType == "Enemy"))
	{
		mxx = 96;
		myy = 192-96;
		mzz = -1-96;
	}
	matrix = matrix_build(x + mxx, y + myy, grid_z + mzz, 90, 0, 0, 48, 48, 48);
	matrix_set(matrix_world, matrix);

	if(piece != "")
	{
		vertex_submit(global.chess_pieces[? pieceType+piece], pr_trianglelist, sprite_get_texture(global.atlas_3D, 0));
	}
	
	#region BoundingBox
	/*
	var ofz = 96;
	var bbz = 5;
	var matrix = matrix_build(x, y, 0, 0, 0, 0, 1, 1, 1);
	matrix_set(matrix_world, matrix);
	var bb = vertex_create_buffer();
	vertex_begin(bb, global.vertex_format);
	#region
	//face down
	bufferAddPoint(bb, 0, 0, ofz, 0, 0, 0, 1, 1, c_yellow, 1);
	bufferAddPoint(bb, 192, 0, ofz, 0, 0, 0, 1, 1, c_yellow, 1);
	
	bufferAddPoint(bb, 0, 0, ofz, 0, 0, 0, 1, 1, c_yellow, 1);
	bufferAddPoint(bb, 0, 192, ofz, 0, 0, 0, 1, 1, c_yellow, 1);
	
	bufferAddPoint(bb, 0, 192, ofz, 0, 0, 0, 1, 1, c_yellow, 1);
	bufferAddPoint(bb, 192, 192, ofz, 0, 0, 0, 1, 1, c_yellow, 1);
	
	bufferAddPoint(bb, 192, 0, ofz, 0, 0, 0, 1, 1, c_yellow, 1);
	bufferAddPoint(bb, 192, 192, ofz, 0, 0, 0, 1, 1, c_yellow, 1);
	//face up
	bufferAddPoint(bb, 0, 0, ofz - bbz, 0, 0, 0, 1, 1, c_yellow, 1);
	bufferAddPoint(bb, 192, 0, ofz - bbz, 0, 0, 0, 1, 1, c_yellow, 1);
	
	bufferAddPoint(bb, 0, 0, ofz -bbz, 0, 0, 0, 1, 1, c_yellow, 1);
	bufferAddPoint(bb, 0, 192, ofz -bbz, 0, 0, 0, 1, 1, c_yellow, 1);
	
	bufferAddPoint(bb, 0, 192, ofz-bbz, 0, 0, 0, 1, 1, c_yellow, 1);
	bufferAddPoint(bb, 192, 192, ofz-bbz, 0, 0, 0, 1, 1, c_yellow, 1);
	
	bufferAddPoint(bb, 192, 0, ofz-bbz, 0, 0, 0, 1, 1, c_yellow, 1);
	bufferAddPoint(bb, 192, 192, ofz-bbz, 0, 0, 0, 1, 1, c_yellow, 1);
	//vertical lines
	bufferAddPoint(bb, 0, 0, ofz, 0, 0, 0, 1, 1, c_yellow, 1);
	bufferAddPoint(bb, 0, 0, ofz-bbz, 0, 0, 0, 1, 1, c_yellow, 1);
	
	bufferAddPoint(bb, 0, 192, ofz, 0, 0, 0, 1, 1, c_yellow, 1);
	bufferAddPoint(bb, 0, 192, ofz-bbz, 0, 0, 0, 1, 1, c_yellow, 1);
	
	bufferAddPoint(bb, 192, 0, ofz, 0, 0, 0, 1, 1, c_yellow, 1);
	bufferAddPoint(bb, 192, 0, ofz-bbz, 0, 0, 0, 1, 1, c_yellow, 1);
	
	bufferAddPoint(bb, 192, 192, ofz, 0, 0, 0, 1, 1, c_yellow, 1);
	bufferAddPoint(bb, 192, 192, ofz-bbz, 0, 0, 0, 1, 1, c_yellow, 1);
	#endregion
	vertex_end(bb);
	vertex_submit(bb, pr_linelist, -1);
	vertex_delete_buffer(bb);
	*/
	#endregion
}




matrix_set(matrix_world, matrix_build_identity());
shader_reset();