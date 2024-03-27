/// @description Insert description here
// You can write your code in this editor

var p_equip;
p_equip=obj_BC_player.cur_equip;

inv_inc=keyboard_check_pressed(global.key_inv_inc);
inv_dec=keyboard_check_pressed(global.key_inv_dec);


switch(p_equip)
{
	case "MELEE": 
	#region MELEE INV CONTROL
	var mel_len;
	mel_len=array_length(global.melee_inv); 
	if(inv_inc)
	{
		if(global.melee_inv_ind+1>mel_len-1){global.melee_inv_ind=0;}else{global.melee_inv_ind+=1;};
		obj_BC_player.cur_melee=array_get(global.melee_inv,global.melee_inv_ind);
	};
		
	if(inv_dec)
	{
		if(global.melee_inv_ind-1<0){global.melee_inv_ind=mel_len-1;}else{global.melee_inv_ind-=1;};
		obj_BC_player.cur_melee=array_get(global.melee_inv,global.melee_inv_ind);
	};
	#endregion
	break;
	
	case "MAGIC":
	#region MAGIC INV CONTROL
	var mag_len;
	mag_len=array_length(global.magic_inv); 
	if(inv_inc)
	{
		if(global.magic_inv_ind+1>mag_len-1){global.magic_inv_ind=0;}else{global.magic_inv_ind+=1;};
		obj_BC_player.cur_magic=array_get(global.magic_inv,global.magic_inv_ind);
	};
		
	if(inv_dec)
	{
		if(global.magic_inv_ind-1<0){global.magic_inv_ind=mag_len-1;}else{global.magic_inv_ind-=1;};
		obj_BC_player.cur_magic=array_get(global.magic_inv,global.magic_inv_ind);
	};
	#endregion
	break;
	
	case "ITEM":
	#region ITEM INV CONTROL
	var itm_len;
	itm_len=array_length(global.item_inv); 
	if(inv_inc)
	{
		if(global.item_inv_ind+1>itm_len-1){global.item_inv_ind=0;}else{global.item_inv_ind+=1;};
		obj_BC_player.cur_item=array_get(global.item_inv,global.item_inv_ind);
	};
		
	if(inv_dec)
	{
		if(global.item_inv_ind-1<0){global.item_inv_ind=itm_len-1;}else{global.item_inv_ind-=1;};
		obj_BC_player.cur_item=array_get(global.item_inv,global.item_inv_ind);
	};
	#endregion
	break;
};
