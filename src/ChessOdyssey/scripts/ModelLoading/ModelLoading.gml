vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
global.vertex_format = vertex_format_end();

global.atlas_3D = sprite_add("Data/Images/texture_atlas_3d.png", 0, true, true, 0, 0);
global.skybox_texture = sprite_add("Data/Images/skybox.jpeg", 0, true, true, 0, 0);


///@function bufferAddPoint
///@param vbuffer
///@param xx
///@param yy
///@param zz
///@param nx
///@param ny
///@param nz
///@param textu
///@param textv
///@param vcolor
///@param valpha
function bufferAddPoint(vbuffer, xx, yy, zz, nx, ny, nz, textu, textv, vcolor, valpha){
	vertex_position_3d(vbuffer, xx, yy, zz);
	vertex_normal(vbuffer, nx, ny, nz);
	vertex_texcoord(vbuffer, textu, textv);
	vertex_color(vbuffer, vcolor, valpha);
}

///@function loadOBJModelFile
///@param filename
///@param special_color
///@param special_alpha
function loadOBJModelFile(filename, special_color = c_white, special_alpha = 1){
	var file = file_text_open_read(filename);
	var vertex_x = ds_list_create();
	var vertex_y = ds_list_create();
	var vertex_z = ds_list_create();
	
	var vertex_nx = ds_list_create();
	var vertex_ny = ds_list_create();
	var vertex_nz = ds_list_create();
	
	var vertex_u = ds_list_create();
	var vertex_v = ds_list_create();
	
	var vbuff = vertex_create_buffer();
	vertex_begin(vbuff, global.vertex_format);
	
	while(!file_text_eof(file))
	{
		var line = file_text_read_string(file);
		file_text_readln(file);
		
		var terms;
		var index = 0;
		terms[0] = "";
		terms[string_count(" ", line)] = "";
		for(var i = 1; i <= string_length(line); i++)
		{
			if(string_char_at(line, i) == " ")
			{
				index++;
				terms[index] = "";
			}
			else
			{
				terms[index] = terms[index] + string_char_at(line, i);
			}
		}
		switch(terms[0])
		{
			case "v":
				ds_list_add(vertex_x, real(terms[1]));
				ds_list_add(vertex_y, real(terms[2]));
				ds_list_add(vertex_z, real(terms[3]));
				break;
			case "vt":
				ds_list_add(vertex_u, real(terms[1]));
				ds_list_add(vertex_v, real(terms[2]));
				break;
			case "vn":
				ds_list_add(vertex_nx, real(terms[1]));
				ds_list_add(vertex_ny, real(terms[2]));
				ds_list_add(vertex_nz, real(terms[3]));
				break;
			case "f":
				for(var n = 1; n <= 3; n++)
				{
					var data, index;
					index = 0;
					data[0] = "";
					data[string_count("/", terms[n])] = "";
					for(var i = 1; i <= string_length(terms[n]); i++)
					{
						if(string_char_at(terms[n], i) == "/")
						{
							index++;
							data[index] = "";
						}
						else
						{
							data[index] = data[index] + string_char_at(terms[n], i);
						}
					}
					var xx = ds_list_find_value(vertex_x, real(data[0])-1);
					var yy = ds_list_find_value(vertex_y, real(data[0])-1);
					var zz = ds_list_find_value(vertex_z, real(data[0])-1);
					
					var uu = ds_list_find_value(vertex_u, real(data[1])-1);
					var vv = ds_list_find_value(vertex_v, real(data[1])-1);
					
					var nx = ds_list_find_value(vertex_nx, real(data[2])-1);
					var ny = ds_list_find_value(vertex_ny, real(data[2])-1);
					var nz = ds_list_find_value(vertex_nz, real(data[2])-1);
					bufferAddPoint(vbuff, xx, yy, zz, nx, ny, nz, uu, vv, special_color, special_alpha);
				}
				break;
			default : break; 
		}
	}
	vertex_end(vbuff);
	ds_list_destroy(vertex_x);
	ds_list_destroy(vertex_y);
	ds_list_destroy(vertex_z);
	
	ds_list_destroy(vertex_u);
	ds_list_destroy(vertex_v);
	
	ds_list_destroy(vertex_nx);
	ds_list_destroy(vertex_ny);
	ds_list_destroy(vertex_nz);
	file_text_close(file);
	
	return vbuff;
}



var model_path = "Data/Models/";
global.chess_grid_model_black = loadOBJModelFile(model_path+"chess_grid_white.obj", c_black);
global.chess_grid_model_white = loadOBJModelFile(model_path+"chess_grid_white.obj");
global.chess_grid_model_green = loadOBJModelFile(model_path+"chess_grid_white.obj", c_lime, 1);
global.chess_grid_model_red   = loadOBJModelFile(model_path+"chess_grid_white.obj", c_red, 1);
global.chess_grid_model_yellow = loadOBJModelFile(model_path+"chess_grid_white.obj", c_yellow, 1);
global.chess_grid_model_select = loadOBJModelFile(model_path+"chess_grid_select.obj");
global.cube = loadOBJModelFile(model_path+"cube.obj", c_black);
global.skybox = loadOBJModelFile(model_path+"skybox.obj");
	
var ally_pieces_color = #F5DEB3;
//var ally_pieces_color = #CD853F;
var enemy_pieces_color = #CD853F;
	
global.chess_pieces = ds_map_create();
global.chess_pieces[? "MyArcher"] = loadOBJModelFile(model_path+"piece_archer_ally.obj", ally_pieces_color);
global.chess_pieces[? "MyAssassin"] = loadOBJModelFile(model_path+"piece_assassin.obj", ally_pieces_color);
global.chess_pieces[? "MyChariot"] = loadOBJModelFile(model_path+"piece_chariot.obj", ally_pieces_color);
global.chess_pieces[? "MyElephant"] = loadOBJModelFile(model_path+"piece_elephant_ally.obj", ally_pieces_color);
global.chess_pieces[? "MyGeneral"] = loadOBJModelFile(model_path+"piece_general.obj", ally_pieces_color);
global.chess_pieces[? "MyJester"] = loadOBJModelFile(model_path+"piece_jester_ally.obj", ally_pieces_color);
global.chess_pieces[? "MyKing"] = loadOBJModelFile(model_path+"piece_king.obj", ally_pieces_color);
global.chess_pieces[? "MyKnight"] = loadOBJModelFile(model_path+"piece_knight_ally.obj", ally_pieces_color);
global.chess_pieces[? "MyMusketeer"] = loadOBJModelFile(model_path+"piece_musketeer_ally.obj", ally_pieces_color);
global.chess_pieces[? "MyPaladin"] = loadOBJModelFile(model_path+"piece_paladin.obj", ally_pieces_color);
global.chess_pieces[? "MySoldier"] = loadOBJModelFile(model_path+"piece_soldier.obj", ally_pieces_color);

global.chess_pieces[? "EnemyArcher"] = loadOBJModelFile(model_path+"piece_archer_enemy.obj", enemy_pieces_color);
global.chess_pieces[? "EnemyAssassin"] = loadOBJModelFile(model_path+"piece_assassin.obj", enemy_pieces_color);
global.chess_pieces[? "EnemyChariot"] = loadOBJModelFile(model_path+"piece_chariot.obj", enemy_pieces_color);
global.chess_pieces[? "EnemyElephant"] = loadOBJModelFile(model_path+"piece_elephant_enemy.obj", enemy_pieces_color);
global.chess_pieces[? "EnemyGeneral"] = loadOBJModelFile(model_path+"piece_general.obj", enemy_pieces_color);
global.chess_pieces[? "EnemyJester"] = loadOBJModelFile(model_path+"piece_jester_enemy.obj", enemy_pieces_color);
global.chess_pieces[? "EnemyKing"] = loadOBJModelFile(model_path+"piece_king.obj", enemy_pieces_color);
global.chess_pieces[? "EnemyKnight"] = loadOBJModelFile(model_path+"piece_knight_enemy.obj", enemy_pieces_color);
global.chess_pieces[? "EnemyMusketeer"] = loadOBJModelFile(model_path+"piece_musketeer_enemy.obj", enemy_pieces_color);
global.chess_pieces[? "EnemyPaladin"] = loadOBJModelFile(model_path+"piece_paladin.obj", enemy_pieces_color);
global.chess_pieces[? "EnemySoldier"] = loadOBJModelFile(model_path+"piece_soldier.obj", enemy_pieces_color);