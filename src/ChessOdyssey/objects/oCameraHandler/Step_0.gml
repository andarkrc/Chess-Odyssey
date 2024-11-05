mouse_ray_cast_hit_info.Clear();

var tab_key_pressed = keyboard_check_pressed(vk_tab) || gamepad_button_check_pressed(0, gp_face3);
var left_key_down = keyboard_check(ord("A")) || keyboard_check(vk_left) || gamepad_button_check(0,gp_padl);
var right_key_down = keyboard_check(ord("D")) || keyboard_check(vk_right) || gamepad_button_check(0,gp_padr);
var float_up_key_down = keyboard_check(ord("E")) || gamepad_button_check(0, gp_shoulderl);
var float_down_key_down = keyboard_check(ord("Q")) || gamepad_button_check(0, gp_shoulderr);
var forward_key_down = keyboard_check(ord("W")) || gamepad_button_check(0, gp_padu);
var backward_key_down = keyboard_check(ord("S")) || gamepad_button_check(0, gp_padd);
var shift_key_down = keyboard_check(vk_shift) || gamepad_button_check(0, gp_shoulderlb) || gamepad_button_check(0, gp_shoulderrb);


var controller_input_joy_h = gamepad_axis_value(0, gp_axislh);
var controller_input_joy_v = gamepad_axis_value(0, gp_axislv);
controller_input_joy_h = abs(controller_input_joy_h) > 0.2 ? controller_input_joy_h : 0;
controller_input_joy_v = abs(controller_input_joy_v) > 0.2 ? controller_input_joy_v : 0;
had_gp_ainput_last_frame = gp_ainput;
gp_ainput = controller_input_joy_h != 0 || controller_input_joy_v != 0;

if(!is_undefined(view_matrix) && !is_undefined(proj_matrix))
{
	if(0)
	{
		var xlookat = x + cos(yaw_rotation)*cos(pitch_rotation);
		var ylookat = y - sin(yaw_rotation)*cos(pitch_rotation);
		var zlookat = z - sin(pitch_rotation);
		mouse_ray_cast = NewColRayFromPoints(new Vector3(x, y, z), new Vector3(xlookat, ylookat, zlookat));
	}
	else
	{
		var ray_cast = ScreenToWorldCoords(clamp(mouse_x, 0, room_width), clamp(mouse_y, 0, room_height), view_matrix, proj_matrix);
		//var org = new Vector3(room_width/2, room_height/2, -1000);
		mouse_ray_cast = NewColRayFromPoints(ray_cast.v1, ray_cast.v2.Add(ray_cast.v1));
		//mouse_ray_cast = NewColRayFromPoints(org, ray_cast.v2.Add(org));
	}
}

if(can_move)
{
	var k_input_lr = right_key_down - left_key_down;
	var m_input_lr = -(window_mouse_get_x() - floor(window_get_width()/2))/100;
	var m_input_ud = -(window_mouse_get_y() - floor(window_get_height()/2))/100;
	var k_input_fb = forward_key_down - backward_key_down;
	var k_input_float = float_up_key_down - float_down_key_down;
	
	repeat(1 + shift_key_down)
	{
		x = clamp(x + move_speed*k_input_lr*cos(yaw_rotation - pi/2) - move_speed*k_input_fb*sin(yaw_rotation - pi/2), 0, room_width);
		y = clamp(y - move_speed*k_input_lr*sin(yaw_rotation - pi/2) - move_speed*k_input_fb*cos(yaw_rotation - pi/2), room_height/2 - room_width/2, room_height/2 + room_width/2);
	}
	
	window_mouse_set(floor(window_get_width()/2), floor(window_get_height()/2));

	yaw_rotation += (gp_ainput == 0) ? m_input_lr*(!had_gp_ainput_last_frame) : -controller_input_joy_h/50;
	pitch_rotation += (gp_ainput == 0) ? m_input_ud*(!had_gp_ainput_last_frame) : -controller_input_joy_v/50;
	pitch_rotation = clamp(pitch_rotation, -pi/2+0.01, pi/2-0.01);
	
	z = clamp(z - k_input_float*30, -1500, -500);
	

	if(yaw_rotation >= 2*pi)
	{
		yaw_rotation -= 2*pi;
	}

	if(yaw_rotation <= -2*pi)
	{
		yaw_rotation += 2*pi;
	}
}

if(tab_key_pressed)
{
	can_move = !can_move;
	window_mouse_set(floor(window_get_width()/2), floor(window_get_height()/2));
	window_set_cursor(cr_default);
	if(can_move)
	{
		window_set_cursor(cr_none);
	}
}

var is_ui_selected = false;
with(oButtonGeneral)
{
	if(selected)
	{
		is_ui_selected = true;
	}
}
with(oTextBox)
{
	if(selected)
	{
		is_ui_selected = true;
	}
}

//Grid Ray Casting
if(!is_undefined(mouse_ray_cast))
{
	with(oGrid)
	{
		mouseHover = false;
		model_data.CheckRay(other.mouse_ray_cast, other.mouse_ray_cast_hit_info);
	}
	if(!is_undefined(mouse_ray_cast_hit_info.shape) && !is_ui_selected)
	{
		if(!is_undefined(mouse_ray_cast_hit_info.shape.owner))
		{
			if(mouse_ray_cast_hit_info.shape.owner.object_index == oGrid)
			{
				mouse_ray_cast_hit_info.shape.owner.mouseHover = true;
			}
		}
	}
}