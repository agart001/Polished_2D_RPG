/// @description Insert description here
// You can write your code in this editor

if(!global.pause) exit;

var g_w,g_h;
g_w=global.view_width;
g_h=global.view_height;

var ds_grid,grid_h;
ds_grid=pages[page];
grid_h=ds_grid_height(ds_grid);

var x_buf,y_buf;
x_buf=32;
y_buf=48;

var x_s,y_s;
y_s=(g_h/2)-(((grid_h-1)/2)*y_buf);
x_s=(g_w/2);

//draw back
draw_rectangle_color(0,0,g_w,g_h,c_black,c_black,c_black,c_black,false);

//draw title
draw_set_valign(fa_top);
draw_set_halign(fa_middle);
draw_set_font(fnt_title);

draw_text_color(g_w/2,y_buf,"Dungeon Crawl!",c_aqua,c_aqua,c_aqua,c_aqua,1);

draw_set_font(fnt_menu);

//draw left
draw_set_valign(fa_middle);
draw_set_halign(fa_right);

var x_lt,y_lt
x_lt=x_s-x_buf;

var col,offset;

for (var _y=0; _y<grid_h; ++_y) 
{
	y_lt=y_s+(_y*y_buf);
	
	col=c_white;
	offset=0;
	
	if(_y==options[page]){col=c_aqua; offset= -(x_buf/2);};
	
	draw_text_color(x_lt+offset, y_lt, ds_grid[# 0, _y], col, col, col, col, 1);
};

//draw divider
draw_line(x_s, y_s-y_buf, x_s, y_lt+y_buf);
//draw_rectangle(x_s-x_buf*7.5, y_s-y_buf, x_s+x_buf*2.5, y_lt+y_buf,true);

//draw right
draw_set_halign(fa_left);

var x_rt,y_rt
x_rt=x_s+x_buf;

for (var _y=0; _y<grid_h; ++_y) 
{
	y_rt=y_s+(_y*y_buf);
	
	//menu types
	switch(ds_grid[# 1, _y])
	{
		#region SHIFT
		case menu_type.shift: 
		
		var cur_val,cur_array;
		cur_val=ds_grid[# 3, _y];
		cur_array=ds_grid[# 4, _y];
		
		var shift_lt,shift_rt;
		shift_lt="<< ";
		shift_rt=" >>";
		
		if(cur_val==0){shift_lt="";};
		if(cur_val==array_length(ds_grid[# 4, _y])-1){shift_rt="";};
		
		col=c_white
		
		if(input_active&&_y=options[page]){col=c_aqua;};
		
		draw_text_color(x_rt, y_rt, shift_lt+cur_array[cur_val]+shift_rt, col, col, col, col, 1);
		
		break;
		#endregion
		
		#region SLIDER
		case menu_type.slider:
		
		var cur_val,cur_array;
		cur_val=ds_grid[# 3, _y];
		cur_array=ds_grid[# 4, _y];
		
		var len,pos;
		len=64;
		pos=((cur_val-cur_array[0])/(cur_array[1]-cur_array[0]))
		
		col=c_white;
		draw_line_width_color(x_rt, y_rt, x_rt+len, y_rt, 2, col, col)
		
		if(input_active&&_y=options[page]){col=c_aqua;};
		draw_circle_color(x_rt+(pos*len), y_rt, 4, col, col, false);
		draw_text_color(x_rt+(len*1.2), y_rt, string(floor(pos*100))+"%", col, col, col, col,1);
		
		break;
		#endregion
		
		#region TOGGLE
		case menu_type.toggle:
		
		var cur_val;
		cur_val=ds_grid[# 3, _y];
		
		var c_on,c_off;
		col=c_white;
		if(input_active&&_y=options[page]){col=c_aqua;};
		
		
		if(cur_val==0){c_on=col; c_off=c_dkgray;}
		else{c_on=c_dkgray; c_off=col;};
		
		draw_text_color(x_rt,y_rt,"ON",c_on,c_on,c_on,c_on,1);
		draw_text_color(x_rt+x_buf,y_rt,"OFF",c_off,c_off,c_off,c_off,1);
		
		break;
		#endregion
		
		#region INPUT
		case menu_type.input:
		
		var cur_val,str_val;
		cur_val=ds_grid[# 3,_y];

		switch(cur_val)
		{
			#region KEYBOARD
			case vk_up: str_val="UP ARROW"; break;
			case vk_down: str_val="DOWN ARROW"; break;
			case vk_right: str_val="RIGHT ARROW"; break;
			case vk_left: str_val="LEFT ARROW"; break;
			case vk_space: str_val="SPACE"; break;
			#endregion
			
			#region MOUSE
			case mb_left: str_val="LEFT MOUSE"; break;
			case mb_right: str_val="RIGHT MOUSE"; break;
			#endregion
			
			default: str_val=chr(cur_val); break;
		};
		
		col=c_white;
		if(input_active&&_y=options[page]){col=c_aqua;};
		draw_text_color(x_rt, y_rt, str_val, col, col, col, col, 1);
		
		break;
		#endregion
	};
};



draw_set_valign(fa_top);
