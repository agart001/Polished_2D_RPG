// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_anim_spr()
{
	var card_dir=round(direction/45);
	var total_frames=sprite_get_number(sprite_index)/8; 
	
	image_index=local_frame+(card_dir*total_frames); 
	
	local_frame+=sprite_get_speed(sprite_index)/FRAME_RATE; 
	
	//if(input_magnitude==0&&direction==0){image_index=0};

	if(local_frame>=total_frames) 
	{ 
		anim_end=true; 
		local_frame-=total_frames;
	}else{anim_end=false;};
}