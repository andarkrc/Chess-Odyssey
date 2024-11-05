z = -1000;
x = room_width/2;
y = room_height;
move_speed = 24;
if(global.orientation == "portrait") z = -1300;
can_move = false;
yaw_rotation = pi/2; // Side to Side
pitch_rotation = -pi/4; // Up to Down
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
gpu_set_alphatestenable(true);
gpu_set_alphatestref(10);
point_light_range = 2048*2;
if(global.orientation == "portrait") point_light_range = 2048*4+1024;

had_gp_ainput_last_frame = false;
gp_ainput = false;

view_matrix = undefined;
proj_matrix = undefined;

mouse_ray_cast = undefined;
mouse_ray_cast_hit_info = new RayCastHitInformation();