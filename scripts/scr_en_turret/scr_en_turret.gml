// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//tracks player when within range
function scr_en_turret_track()
{
	var p_dist,p_dir;
	p_dist=point_distance(x,y,obj_BC_player.x,obj_BC_player.y);
	p_dir=point_direction(x,y,obj_BC_player.x,obj_BC_player.y);
	
	
	if(p_dist<=vis_dist)
	{
		image_angle+=sin(degtorad(p_dir-image_angle))*spd;
		
		var diff,offset;
		offset=4;
		diff=p_dir-image_angle;
		if(diff>=360){diff=diff mod 360;};
		
		if(diff<offset||diff>360-offset)
		{
			locked=true; 
			if(alarm[2]<0){alarm[2]=90;}
		}
		else{locked=false;};
	}
	else{state=enemy_state.patrol; locked=false;};
};

//searches random directions
function scr_en_turret_search()
{
	var p_dist;
	p_dist=point_distance(x,y,obj_BC_player.x,obj_BC_player.y);
	if(p_dist<=vis_dist){state=enemy_state.chase};
	
	if(alarm[1]<0){alarm[1]=120;}
	
	image_angle += sin(degtorad(rand_dir-image_angle))*(spd*.5);
};

//shoots projectile at player
function scr_en_turret_action()
{
	var inst_arrow=noone;
	if(inst_arrow==noone)
	{
		inst_arrow=instance_create_layer(x,y,"Instances",obj_en_arrow);
		inst_arrow.direction=image_angle;
	};
	
	state=enemy_state.chase;
};