/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
col_tm = layer_tilemap_get_id("col_tiles");

var p_x,p_y,p_dir;
p_x=obj_BC_player.x;
p_y=obj_BC_player.y;
p_dir=point_direction(x,y,p_x,p_y);

inac=random_range(-8,8);
damage_dir=p_dir+inac;

speed = 10+random_range(-2,2);
direction = damage_dir+random_range(-5,5);
image_angle = direction;

damage_value=20;

alarm[0]=60;

