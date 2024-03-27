// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_en_b_range_action()
{
	//stop movement
	var frc = global.frc;
	hsp=lerp(hsp,0,frc);
	vsp=lerp(vsp,0,frc);
	
	//check collisions
	scr_enemy_collision();
	
	//get player direction and distance
	var p_dir,p_dist;
	p_dir = point_direction(x,y,obj_BC_player.x,obj_BC_player.y);
	p_dist = point_distance(x,y,obj_BC_player.x,obj_BC_player.y);
	direction=p_dir;
	
	//check player distance
	if(p_dist>action_dist){if(alarm[1]<0){alarm[1]=30;}}
	
	//setup aim variables
	var aim_dir,aim_x,aim_y;
	var spr_h,spr_w;
	spr_w = sprite_get_width(enemy_sprite)*.5;
	spr_h = sprite_get_height(enemy_sprite)*.5;
	
	//player direction determines the aim variables
	switch(round(p_dir/24))
	{
		case 0: 
			aim_dir=0; 
			aim_x=x+(spr_w); 
			aim_y=y;
		break;
		case 1: 
			aim_dir=45;
			aim_x=x+(spr_w); 
			aim_y=y-(spr_h);
		break;
		case 2: 
			aim_dir=45;
			aim_x=x+(spr_w); 
			aim_y=y-(spr_h);
		break;
		case 3: 
			aim_dir=90;
			aim_x=x; 
			aim_y=y-(spr_h);
		break;
		case 4: 
			aim_dir=90;
			aim_x=x; 
			aim_y=y-(spr_h);
		break;
		case 5: 
			aim_dir=135;
			aim_x=x-(spr_w); 
			aim_y=y-(spr_h);
		break;
		case 6: 
			aim_dir=135;
			aim_x=x-(spr_w); 
			aim_y=y-(spr_h);
		break;
		case 7: 
			aim_dir=180;
			aim_x=x-(spr_w); 
			aim_y=y;
		break;
		case 8: 
			aim_dir=180;
			aim_x=x-(spr_w); 
			aim_y=y;
		break;
		case 9: 
			aim_dir=225;
			aim_x=x-(spr_w); 
			aim_y=y+(spr_h);
		break;
		case 10: 
			aim_dir=225;
			aim_x=x-(spr_w); 
			aim_y=y+(spr_h);
		break;
		case 11: 
			aim_dir=270;
			aim_x=x; 
			aim_y=y+(spr_h);
		break;
		case 12: 
			aim_dir=270;
			aim_x=x; 
			aim_y=y+(spr_h);
		break;
		case 13: 
			aim_dir=315;
			aim_x=x+(spr_w); 
			aim_y=y+(spr_h);
		break;
		case 14: 
			aim_dir=315;
			aim_x=x+(spr_w); 
			aim_y=y+(spr_h);
		break;
		case 15:
			aim_dir=0;
			aim_x=x+(spr_w); 
			aim_y=y;
		break;
	};
	
	damage_dir=aim_dir;
	
	//distance of attack collision
	var dist_x,dist_y;
	dist_x=lengthdir_x(spr_w,aim_dir);
	dist_y=lengthdir_y(spr_h,aim_dir);
	
	//ready action
	if(alarm[2]<0&&new_attack){alarm[2]=dam_win;}
	if(alarm[2]<0&&!new_attack){alarm[2]=dam_win*1.5;};
	
	//create attack instance
	var inst_action=noone;
	if(inst_action==noone&&action_ready)
	{
		inst_action=instance_create_layer(aim_x,aim_y,"Instances",obj_en_arrow);
		new_attack=false;
		action_ready=false;
	}
}