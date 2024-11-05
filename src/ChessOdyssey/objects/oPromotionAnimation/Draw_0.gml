if(global.pieceArt != "3D")
{
	drawSetup(alpha);
	draw_sprite(asset_get_index("sPromotionAnimation"+type), 0, x, y);
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
	shader_set_uniform_f(uniform_custom_alpha, alpha);
	with(oCameraHandler)
	{
		var matrix = matrix_build(other.x, other.y + 192, grid_z - 1, 90, 0, 0, 48, 48, 48);
		matrix_set(matrix_world, matrix);
		vertex_submit(global.cube, pr_trianglelist, sprite_get_texture(global.atlas_3D, 0));
		matrix_set(matrix_world, matrix_build_identity());
	}
	shader_reset();
}