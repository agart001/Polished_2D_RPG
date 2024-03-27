/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
var p_dist;
p_dist=point_distance(x,y,obj_BC_player.x,obj_BC_player.y);
	
if(p_dist<=vis_dist)
{
	draw_circle(x,y,vis_dist,true);
	if(locked){draw_line_color(x,y,obj_BC_player.x,obj_BC_player.y,c_red,c_red);}
	else{draw_line_color(x,y,obj_BC_player.x,obj_BC_player.y,c_white,c_white);};
};
event_inherited();

