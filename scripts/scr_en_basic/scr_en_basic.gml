// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_en_basic_chase()
{
	var p_dist;
	p_dist = point_distance(x,y,obj_BC_player.x,obj_BC_player.y);
	
	if(p_dist>vis_dist){state=enemy_state._return;}
	else if(p_dist<action_dist){state=enemy_state.action;};
	
	
	var ch_x,ch_y,ch_hsp,ch_vsp,ch_dir;
	ch_dir = point_direction(x,y,obj_BC_player.x,obj_BC_player.y);
	ch_x = spd * cos(degtorad(ch_dir))
	ch_y = spd * sin(degtorad(ch_dir))
	ch_hsp = sign(obj_BC_player.x-x)*abs(ch_x);
	ch_vsp = sign(obj_BC_player.y-y)*abs(ch_y);
	
	direction=ch_dir;
	hsp = ch_hsp;
	vsp = ch_vsp;
	
	scr_enemy_collision();

}

function scr_en_basic_patrol()
{
	var p_x,p_y,p_dist;
	p_x = obj_BC_player.x;
	p_y = obj_BC_player.y;
	p_dist = point_distance(x,y,obj_BC_player.x,obj_BC_player.y);

	var dist_2_go,spd_at_frame;
	
	if(p_dist<=vis_dist){state=enemy_state.chase;};
	
	
	if((x==pat_x&&y==pat_y)||(used_time>max_dist/spd))
	{
		hsp=0;
		vsp=0;
		
		sprite_index=en_spr[enemy_state.stun];
		
		if(++secs>=wait_time)
		{
			secs=0;
			used_time=0;
			pat_dir=point_direction(x,y,xstart,ystart)+pat_off;
			pat_x=x+lengthdir_x(max_dist,pat_dir);
			pat_y=y+lengthdir_y(max_dist,pat_dir);
		};
		
	}
	else
	{
		sprite_index=en_spr[enemy_state.chase];
		used_time++;
		
		dist_2_go=point_distance(x,y,pat_x,pat_y);
		spd_at_frame=spd;
		if(dist_2_go<spd){spd_at_frame=dist_2_go;};
		
		pat_dir=point_direction(x,y,pat_x,pat_y);
		
		hsp = lengthdir_x(spd_at_frame,pat_dir);
		vsp = lengthdir_y(spd_at_frame,pat_dir);
	};
	
	direction=pat_dir;
	
	scr_enemy_collision();
}

function scr_en_basic_return()
{
	var p_dist;
	p_dist = point_distance(x,y,obj_BC_player.x,obj_BC_player.y);
	
	if(p_dist<=vis_dist){state=enemy_state.chase;};
	
	if(collision_rectangle(xstart-sprite_width,ystart-sprite_height,xstart+sprite_width,ystart+sprite_height,self,false,false))
	{state=enemy_state.patrol;}
	
	var rt_x,rt_y,rt_hsp,rt_vsp,rt_dir;
	rt_dir = point_direction(x,y,xstart,ystart);
	rt_x = spd * cos(degtorad(rt_dir))
	rt_y = spd * sin(degtorad(rt_dir))
	rt_hsp = sign(xstart-x)*abs(rt_x);
	rt_vsp = sign(ystart-y)*abs(rt_y);
	
	direction=rt_dir;
	hsp = rt_hsp;
	vsp = rt_vsp;
	
	scr_enemy_collision();
}

function scr_en_basic_action()
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
		inst_action=instance_create_layer(aim_x+dist_x,aim_y+dist_y,"Instances",obj_en_sword);
		new_attack=false;
		action_ready=false;
	}
}

function scr_en_basic_stun()
{
	var frc = global.frc;
	
	hsp=lerp(hsp,0,frc);
	vsp=lerp(vsp,0,frc);
	direction=point_direction(hsp,vsp,x,y);
	
	scr_enemy_collision();
	
	if(alarm[1]<0){alarm[1]=30;}
};