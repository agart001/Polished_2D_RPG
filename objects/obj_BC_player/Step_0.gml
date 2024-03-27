/// @description Run Current Script

//Run current script in state array
if(p_scr[state]!= -1){script_execute(p_scr[state]);};

#region PLAYER ANIMATION

switch (cur_equip) 
{
	case "MELEE": p_spr[player_state.action]=cur_melee.anim; break;
	case "MAGIC": p_spr[player_state.action]=cur_magic.anim; break;
	case "ITEM": p_spr[player_state.action]=cur_item.anim; break;
};


var prev_spr = sprite_index;
if(input_magnitude!=0){direction=input_direction;}else{direction=aim_dir};
if(p_spr[state]!= -1){sprite_index=p_spr[state];};

if(prev_spr!=sprite_index){local_frame=0;};

scr_anim_spr();

#endregion