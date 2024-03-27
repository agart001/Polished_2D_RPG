// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#region MAIN MENU
function scr_menu_create_id()
{
	var arg;
	for (var i=0; i<argument_count; ++i) {arg[i]=argument[i];};
	
	
	var ds_grid_id;
	ds_grid_id=ds_grid_create(5,argument_count);
	for (var i=0; i<argument_count; ++i) 
	{
		var array, len;
		array=arg[i];
		len=array_length(array);
		
		for (var k=0; k<len; ++k) {ds_grid_id[# k, i]=array[k];};
	};
	
	return ds_grid_id;
}

function scr_new_game()
{
	room_goto(rm_test);
};

function scr_exit_game()
{
	game_end();
};

function scr_change_vol()
{
};

function scr_change_diff()
{
};

function scr_change_res(arg)
{
	switch (arg) 
	{
	    case 0: window_set_size(720,360); break;
		case 1: window_set_size(1080,720); break;
		case 2: window_set_size(1920,1080); break;
	};
};

function scr_change_win(arg)
{
	switch (arg) 
	{
	    case 0: window_set_fullscreen(true); break;
		case 1: window_set_fullscreen(false); break;
	};
};
#endregion

#region SHOP MENU
function scr_exit_menu()
{
	with(obj_hud)
	{
		hud_active=true;
	};
	shop_active=false;
	global.p_input=true;
};

function scr_add_melee(struct)
{
	var cost;
	cost=struct.cost;
	
	var len;
	len=array_length(global.melee_inv);
	for (var i=0; i<len; i++) 
	{
	    if(global.melee_inv[i]==struct)
		{
			show_message("already have")
			exit;
		};
	};
	
	show_message(string(global.p_coins))
	if(cost>global.p_coins)
	{
		show_message("failed")
		exit;
	}
	else
	{
		global.p_coins-=cost;
		with(obj_BC_player)
		{
			cur_melee=struct;
			array_push(global.melee_inv, struct);
			show_message(string(cur_melee))
		};
	};
};

function scr_add_magic(struct)
{
	var cost;
	cost=struct.cost;
	
	var len;
	len=array_length(global.magic_inv);
	for (var i=0; i<len; i++) 
	{
	    if(global.magic_inv[i]==struct)
		{
			show_message("already have")
			exit;
		};
	};
	
	show_message(string(global.p_coins))
	if(cost>global.p_coins)
	{
		show_message("failed")
		exit;
	}
	else
	{
		global.p_coins-=cost;
		with(obj_BC_player)
		{
			cur_magic=struct;
			array_push(global.magic_inv, struct);
			show_message(string(cur_magic))
		};
	};
};

function scr_add_item(struct)
{
	var cost;
	cost=struct.cost;
	
	var len,item;
	len=array_length(global.item_inv);
	item=false;
	for (var i=0; i<len; i++) 
	{
		if(global.item_inv[i]==struct)
		{
			item = true;
			break;
		};
	};
	
	show_message(string(global.p_coins))
	if(cost>global.p_coins)
	{
		show_message("failed")
		exit;
	}
	else
	{
		if(item)
		{
			show_message("more added")
			global.p_coins-=cost;
			global.item_inv[i].count+=3;
		}
		else
		{
			global.p_coins-=cost;
			with(obj_BC_player)
			{
				show_message("item added")
				cur_item=struct;
				array_push(global.item_inv, struct);
			};
		};
		
	};
};
#endregion
