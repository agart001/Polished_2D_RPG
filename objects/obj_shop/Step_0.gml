/// @description Insert description here
// You can write your code in this editor

if(!global.pause) exit;

var key_act = keyboard_check_pressed(global.key_interact);
m_input_up=keyboard_check_pressed(global.key_up);
m_input_down=keyboard_check_pressed(global.key_down);
m_input_enter=keyboard_check_pressed(global.key_enter)||mouse_check_button_pressed(global.key_m_enter);

if(place_meeting(x,y,obj_BC_player)&&key_act)
{
	show_message("active")
	with(obj_hud)
	{
		hud_active=false;
	};
	shop_active=true;
	global.p_input=false;
};

if(!shop_active) exit;

if(shop_active)
{
	var ds_grid,grid_h;
	ds_grid=pages[page];
	grid_h=ds_grid_height(ds_grid);

	//change variable
	var m_input;
	m_input=m_input_down-m_input_up;
	
	#region MOUSE INPUT
	if(mouse_wheel_up()){m_input= -1;};
	if(mouse_wheel_down()){m_input=1;};
	#endregion
	
	if(m_input!=0)
	{
	options[page]+=m_input;
	if(options[page]>grid_h-1){options[page]=0;};
	if(options[page]<0){options[page]=grid_h-1;};
	};



	//enter option
	if(m_input_enter)
	{
		switch(ds_grid[# 1, options[page]])
		{
			case menu_type.funct: script_execute(ds_grid[# 2, options[page]], ds_grid[# 3, options[page]]); break;
			case menu_type.transfer: page=ds_grid[# 2, options[page]]; break;
		};
	};
};
