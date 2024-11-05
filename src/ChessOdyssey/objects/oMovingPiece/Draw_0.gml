if(global.pieceArt != "3D")
{
	drawSetup(0.5);
	draw_sprite(asset_get_index("s"+pieceType+piece+global.pieceArt), 0, x, y);
}
else
{
	
	var grid_z = 200-10;
	
	var uniform_light_position = shader_get_uniform(sh_point_light, "lightPosition");
	var uniform_light_colour = shader_get_uniform(sh_point_light, "lightColour");
	var uniform_light_range = shader_get_uniform(sh_point_light, "lightRange");
	var uniform_custom_alpha = shader_get_uniform(sh_point_light, "customAlpha");

	
	shader_set(sh_point_light);
	shader_set_uniform_f(uniform_light_position, oCameraHandler.x, oCameraHandler.y, oCameraHandler.z);
	shader_set_uniform_f(uniform_light_colour, 1, 1, 1, 1);
	shader_set_uniform_f(uniform_light_range, oCameraHandler.point_light_range);
	shader_set_uniform_f(uniform_custom_alpha, 0.5);
	with(oCameraHandler)
	{
		var mxx = 0;
		var myy = 192;
		var mzz = -1;
		if(other.piece == "Soldier" || (other.piece == "Jester" && other.pieceType == "Enemy"))
		{
			mxx = 96;
			myy = 192-96;
			mzz = -1-96;
		}
		var matrix = matrix_build(other.x + mxx, other.y + myy, grid_z + mzz, 90, 0, 0, 48, 48, 48);
		matrix_set(matrix_world, matrix);

		if(other.piece != "")
		{
			vertex_submit(global.chess_pieces[? other.pieceType+other.piece], pr_trianglelist, sprite_get_texture(global.atlas_3D, 0));
		}
	
		matrix_set(matrix_world, matrix_build_identity());
		
	}
	shader_reset();
}