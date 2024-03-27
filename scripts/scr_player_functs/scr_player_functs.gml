// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//Player Inputs -- returns key/mouse input
function scr_player_input()
{
	if(global.p_input)
	{
		#region KEYS
	
		key_up=keyboard_check(global.key_up);
		key_down=keyboard_check(global.key_down);
		key_right=keyboard_check(global.key_right);
		key_left=keyboard_check(global.key_left);
	
		key_action=mouse_check_button_pressed(global.key_action);
		key_roll=keyboard_check(global.key_roll);
	
		key_1=keyboard_check(global.key_1);
		key_2=keyboard_check(global.key_2);
		key_3=keyboard_check(global.key_3);
	
		#endregion
	
		#region ITEM SWITCH
	
		if(key_1){cur_equip="MELEE";};
	
		if(key_2){cur_equip="MAGIC";};
	
		if(key_3){cur_equip="ITEM";};
	
		#endregion
	
		#region MOUSE INPUT
	
		var spr_w = sprite_get_width(col_spr)*.5;
		var spr_h = sprite_get_height(col_spr)*.5
	
		//Mouse direction -- turns 360* to 8 angles
		switch(round(point_direction(x,y,mouse_x,mouse_y)/24))
		{
			case 0: 
				aim_dir=0; 
				dir_color=c_white;
				aim_x=x+(spr_w); 
				aim_y=y;
			break;
			case 1: 
				aim_dir=45;
				dir_color=c_yellow; 
				aim_x=x+(spr_w); 
				aim_y=y-(spr_h);
			break;
			case 2: 
				aim_dir=45;
				dir_color=c_yellow; 
				aim_x=x+(spr_w); 
				aim_y=y-(spr_h);
			break;
			case 3: 
				aim_dir=90;
				dir_color=c_red;
				aim_x=x; 
				aim_y=y-(spr_h);
			break;
			case 4: 
				aim_dir=90;
				dir_color=c_red; 
				aim_x=x; 
				aim_y=y-(spr_h);
			break;
			case 5: 
				aim_dir=135;
				dir_color=c_purple;
				aim_x=x-(spr_w); 
				aim_y=y-(spr_h);
			break;
			case 6: 
				aim_dir=135;
				dir_color=c_purple;
				aim_x=x-(spr_w); 
				aim_y=y-(spr_h);
			break;
			case 7: 
				aim_dir=180;
				dir_color=c_teal;
				aim_x=x-(spr_w); 
				aim_y=y;
			break;
			case 8: 
				aim_dir=180;
				dir_color=c_teal;
				aim_x=x-(spr_w); 
				aim_y=y;
			break;
			case 9: 
				aim_dir=225;
				dir_color=c_blue;
				aim_x=x-(spr_w); 
				aim_y=y+(spr_h);
			break;
			case 10: 
				aim_dir=225;
				dir_color=c_blue; 
				aim_x=x-(spr_w); 
				aim_y=y+(spr_h);
			break;
			case 11: 
				aim_dir=270;
				dir_color=c_green;
				aim_x=x; 
				aim_y=y+(spr_h);
			break;
			case 12: 
				aim_dir=270;
				dir_color=c_green;
				aim_x=x; 
				aim_y=y+(spr_h);
			break;
			case 13: 
				aim_dir=315;
				dir_color=c_fuchsia;
				aim_x=x+(spr_w); 
				aim_y=y+(spr_h);
			break;
			case 14: 
				aim_dir=315;
				dir_color=c_fuchsia;
				aim_x=x+(spr_w); 
				aim_y=y+(spr_h);
			break;
			case 15:
				aim_dir=0;
				dir_color=c_white;
				aim_x=x+(spr_w); 
				aim_y=y;
			break;
		};
		#endregion
	
		//Input Vector
		input_direction = point_direction(0,0, key_right - key_left, key_down - key_up);
		input_magnitude = (key_right - key_left != 0) || (key_down - key_up != 0);
	};
}

//Player Collision -- handle map/damage collisions
function scr_player_collision()
{
	//Damage Collision
	if(state!=player_state.damage&&state!=player_state.roll)
	{
		if(place_meeting(x,y,obj_BC_damage))
		{
			damage_inst = instance_place(x,y,obj_BC_damage)
			state = player_state.damage;
		};
	};
	
	//Coin Collision
	var inst_coin = instance_place(x,y,obj_coin)
	if(inst_coin!=noone)
	{
		global.p_coins++;
		instance_destroy(inst_coin);
	};
	
	#region Tile Collision
	var bbox_side;
	
	//Horizontal Collision
	if(hsp > 0){bbox_side=bbox_right;}else{bbox_side=bbox_left;};
	if( tilemap_get_at_pixel(col_tm,bbox_side+hsp,bbox_top)!=0 || 
		tilemap_get_at_pixel(col_tm,bbox_side+hsp,bbox_bottom)!=0)
	{
		if(hsp>0){x = x-(x mod 64)+(63)-(bbox_right-x);}
		else{x = x-(x mod 64)-(bbox_left-x);};
		hsp = 0;
	};
	x += hsp;
	
	
	//Vertical Collision
	if(vsp > 0){bbox_side=bbox_bottom;}else{bbox_side=bbox_top;};
	if( tilemap_get_at_pixel(col_tm,bbox_left,bbox_side+vsp)!=0 || 
		tilemap_get_at_pixel(col_tm,bbox_right,bbox_side+vsp)!=0)
	{
		if(vsp>0){y = y-(y mod 64)+(63)-(bbox_bottom-y);}
		else
		{y = y-(y mod 64)-(bbox_top-y);};
		vsp = 0;
	};
	y += vsp;
	
	#endregion
	
}

//Player Stats -- handles stat checks
function scr_player_stats()
{
	#region APPLY STAT REDUCT
	
	if(key_roll&&roll){if(stam>=dec_roll){stam-=dec_roll}else{state=player_state.idle;}; };
	
	if(key_action&&cur_equip=="MELEE"){if(stam>=cur_melee.stam){stam-=cur_melee.stam}else{state=player_state.idle;}; };
	
	if(key_action&&cur_equip=="MAGIC"){if(mana>=cur_magic.mana){mana-=cur_magic.mana}else{state=player_state.idle;}; };
	
	#endregion
};

//Player Melee -- hanlde melee attacks
function scr_player_melee(hitbox)
{
	var hits,cur_hit_list,hit_ID;
	var dam_val,dam_dir,dam_hsp,dam_vsp;
	
	mask_index=hitbox;
	
	dam_dir=aim_dir;
	dam_val=cur_melee.dam;
	
	cur_hit_list=ds_list_create();
	hits=instance_place_list(x,y,obj_BC_enemy,cur_hit_list,false);
	
	if(hits>0)
	{
		for(var i=0;i<hits;i++) 
		{
		    hit_ID=cur_hit_list[| i];
			
			if(ds_list_find_index(hit_list,hit_ID)== -1)
			{
				ds_list_add(hit_list,hit_ID);
				cur_melee.funct(hit_ID);
				with(hit_ID)
				{
					//cur_melee.funct();
					if(moveable)
					{
						dam_hsp=lengthdir_x(dam_val,dam_dir);//_dam_val*cos(_dam_dir);
						dam_vsp=lengthdir_y(dam_val,dam_dir);//_dam_val*sin(_dam_dir);
						
						image_blend=c_red;
						
						hsp=dam_hsp;
						vsp=dam_vsp;
						hp-=dam_val;
						state=enemy_state.stun;
					}
					else{hp-=dam_val;};
				};
			};
		}
	};
	
	mask_index=spr_player;
};

//Player Magic -- handle magic attacks
function scr_player_magic()
{
	var inst_magic;
	inst_magic=noone;
	
	if(inst_magic==noone)
	{
		inst_magic=instance_create_layer(aim_x,aim_y,"Player",obj_BC_p_magic);
		
		#region LOCAL VARS
		var _spr,_spd,_dam,_dam_dir,_rand,_limit;
		_spr=cur_magic.spr;
		_spd=cur_magic.spd;
		_dam=cur_magic.dam;
		_dam_dir=aim_dir;
		_rand=cur_magic.rand;
		_limit=cur_magic.limit;
		#endregion

		with(inst_magic)
		{
			sprite_index=_spr;
			speed=_spd;
			damage_value=_dam;
			damage_dir=_dam_dir;
			rand_dir=_rand;
			time_limit=_limit;
			
			direction = damage_dir+rand_dir;
			image_angle = direction;

			alarm[0]=time_limit;
		};
	};
};

