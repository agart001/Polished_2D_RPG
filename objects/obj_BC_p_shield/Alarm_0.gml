/// @description Insert description here
// You can write your code in this editor
var p_x,p_y,cur_dir,cur_dist;
p_x=obj_BC_player.x;
p_y=obj_BC_player.y;
cur_dir=obj_BC_player.aim_dir;
cur_dist=point_distance(x,y,p_x,p_y)


if(gen_dir!=cur_dir||cur_dist>sprite_width)
{
	instance_destroy(self);
}
else{alarm[0]=limit};
