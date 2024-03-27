/// @description Insert description here
// You can write your code in this editor

if(!global.pause) exit;

m_input_up=keyboard_check_pressed(global.key_up);
m_input_down=keyboard_check_pressed(global.key_down);
m_input_enter=keyboard_check_pressed(global.key_enter)||mouse_check_button_pressed(global.key_m_enter);

var ds_grid,grid_h;
ds_grid=pages[page];
grid_h=ds_grid_height(ds_grid);

//change variable
if(input_active)
{
	switch(ds_grid[# 1, options[page]])
	{
		#region SHIFT
		case menu_type.shift:
		
		var m_input,k_R,k_L;
		k_R=keyboard_check_pressed(global.key_right);
		k_L=keyboard_check_pressed(global.key_left);
		m_input=k_R-k_L;
		
		#region MOUSE INPUT
		if(mouse_wheel_up()){m_input= -1;};
		if(mouse_wheel_down()){m_input=1;};
		#endregion
		
		if(m_input!=0)
		{
			//audio
			var opt_len;
			opt_len=array_length(ds_grid[# 4,options[page]])-1;
			
			ds_grid[# 3,options[page]]+=m_input;
			ds_grid[# 3,options[page]]=clamp(ds_grid[# 3,options[page]], 0, opt_len);
		};
		
		break;
		#endregion
		
		#region SLIDER
		case menu_type.slider:
		
		var m_input,k_R,k_L;
		k_R=keyboard_check(global.key_right);
		k_L=keyboard_check(global.key_left);
		m_input=k_R-k_L;
		
		#region MOUSE INPUT
		if(mouse_wheel_up()){m_input= -1;};
		if(mouse_wheel_down()){m_input=1;};
		#endregion
		
		if(m_input!=0)
		{
			//audio
			var opt_len;
			opt_len=array_length(ds_grid[# 4,options[page]])-1;
			
			ds_grid[# 3,options[page]]+=m_input*.01;
			ds_grid[# 3,options[page]]=clamp(ds_grid[# 3,options[page]], 0, opt_len);
		};
		
		break;
		#endregion
		
		#region TOGGLE
		case menu_type.toggle:
		
		var m_input,k_R,k_L;
		k_R=keyboard_check_pressed(global.key_right);
		k_L=keyboard_check_pressed(global.key_left);
		m_input=k_R-k_L;
		
		#region MOUSE INPUT
		if(mouse_wheel_up()){m_input= -1;};
		if(mouse_wheel_down()){m_input=1;};
		#endregion
		
		if(m_input!=0)
		{
			//audio
			var opt_len;
			opt_len=array_length(ds_grid[# 4,options[page]])-1;
			
			ds_grid[# 3,options[page]]+=m_input;
			ds_grid[# 3,options[page]]=clamp(ds_grid[# 3,options[page]], 0, opt_len);
		};
		
		break;
		#endregion
		
		#region INPUT
		case menu_type.input:
		
		var m_key;
		m_key=keyboard_lastkey;
		
		if(m_key!=vk_enter)
		{
			//if(m_key!=ds_grid[# 3,options[page]]){audio};
			
			ds_grid[# 3,options[page]]=m_key;
			variable_global_set(ds_grid[# 2,options[page]], m_key);
		};
		
		break;
		#endregion
	};
}
//change option
else
{
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
};


//enter option
if(m_input_enter)
{
	switch(ds_grid[# 1, options[page]])
	{
		case menu_type.funct: script_execute(ds_grid[# 2, options[page]]); break;
		case menu_type.transfer: page=ds_grid[# 2, options[page]]; break;
		case menu_type.shift: 
		case menu_type.slider: 
		case menu_type.toggle: 
		case menu_type.input:
		
			#region RUN SCRIPTS
			if(input_active){script_execute(ds_grid[# 2, options[page]], ds_grid[# 3, options[page]]);};
			#endregion
			input_active= !input_active;
			break;
	};
};