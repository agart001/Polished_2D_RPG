// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//Player Action -- handles player item action
function scr_player_action()
{
	//create attack list
	if(!ds_exists(hit_list, ds_type_list)){hit_list=ds_list_create();};
	ds_list_clear(hit_list);
	
	switch (cur_equip) 
	{
		#region MELEE
	    case "MELEE": scr_player_melee(cur_melee.hitbox); break;
		#endregion
		
		#region MAGIC
	    case "MAGIC": scr_player_magic(); break;
		#endregion
		
		#region SHIELD
	    case "ITEM": 
		cur_item.funct(cur_item); 
		break;
		#endregion
	};
	
	//check collisions
	scr_player_collision();
	
	if(anim_end){state=player_state.idle};
}

//Player Damage -- handles knockback and damage to player
function scr_player_damage()
{

	//damage variables -- calc damage vector
	var dam_val,dam_dir,dam_hsp,dam_vsp;
	dam_val=damage_inst.damage_value;
	dam_dir=point_direction(damage_inst.x,damage_inst.y,x,y);
	dam_hsp=lengthdir_x(dam_val,dam_dir);//_dam_val*cos(_dam_dir);
	dam_vsp=lengthdir_y(dam_val,dam_dir);//_dam_val*sin(_dam_dir);
	
	//apply damage vector
	hsp=dam_hsp;
	vsp=dam_vsp;
	hp-=dam_val;
	
	//change state/clear damage inst
	instance_destroy(damage_inst);
	state=player_state.idle;
	damage_inst=noone;
}

//Player Idle -- player default state
function scr_player_idle()
{
	//check inputs/change state
	scr_player_input();
	if(input_magnitude!=0){state=player_state.run;};
	if(key_action){state=player_state.action;};
	if(key_roll&&roll){state=player_state.roll;};
	scr_player_stats();
	
	//friction variable
	var frc = global.frc;
	
	//apply friction
	hsp=lerp(hsp,0,frc);
	vsp=lerp(vsp,0,frc);
	
	//check collisions
	scr_player_collision();
}

//Player Run -- handles player movement
function scr_player_run()
{
	//check input/change state
	scr_player_input();
	if(input_magnitude==0){state=player_state.idle;};
	if(key_action){state=player_state.action;};
	if(key_roll&&roll){state=player_state.roll;};
	scr_player_stats();
	
	//friction variable
	var frc = global.frc;
	
	//apply movement vector and friction
	hsp=lerp(hsp,lengthdir_x(input_magnitude * sp_run,input_direction),frc);
	vsp=lerp(vsp,lengthdir_y(input_magnitude * sp_run,input_direction),frc);

	//check collisions
	scr_player_collision();
}

//Player Roll -- handles roll
function scr_player_roll()
{
	//friction variable
	var frc = global.frc;
	
	//apply movement vector and friction
	hsp=lerp(hsp,lengthdir_x(sp_roll,aim_dir),frc);
	vsp=lerp(vsp,lengthdir_y(sp_roll,aim_dir),frc);

	//check collisions
	scr_player_collision();
	
	if(anim_end){roll=false; alarm[1]=al_roll; state=player_state.idle;};
};
