/// @description Insert description here
// You can write your code in this editor

#macro view view_camera[0]
camera_set_view_size(view,view_width,view_height);

if(instance_exists(obj_BC_player))
{
	var cam_x=clamp(obj_BC_player.x-(view_width/2),0,room_width-view_width);
	var cam_y=clamp(obj_BC_player.y-(view_height/2),0,room_height-view_height);
	camera_set_view_pos(view_camera[1],cam_x,cam_y);
	
	var curCam_x=camera_get_view_x(view);
	var curCam_y=camera_get_view_y(view);
	
	var cam_speed=.2;
	//if(key_dash){cam_speed=.4;};
	
	camera_set_view_pos(view,lerp(curCam_x,cam_x,cam_speed),lerp(curCam_y,cam_y,cam_speed));
};