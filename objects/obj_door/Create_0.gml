 /// @description Door Variables/Direction Gen
 
//Generate Direction
door_dir = scr_door_dir();

//Room Variables
var cur_rm,total_rms,backward_dir,forward_dir;
cur_rm = obj_rm_gen.cur_rm;
total_rms = obj_rm_gen.total_rms;
backward_dir = obj_rm_gen.backward_dir;
forward_dir = obj_rm_gen.forward_dir;

//Door open check
if(cur_rm!=0&&cur_rm<total_rms)
{
	//door is closed -- not forward/backward direction
	if(door_dir!=forward_dir[cur_rm-1] && door_dir!=backward_dir[cur_rm-1])
	{
		//door unload/tile collision loaded
		
		instance_destroy(self);
		
		var tl_lay,tl_mp,tl;
		tl_lay = layer_get_id("col_tiles");
		tl_mp = layer_tilemap_get_id(tl_lay);
		tl = 5;
		tilemap_set_at_pixel(tl_mp,tl,x,y);
	};
};