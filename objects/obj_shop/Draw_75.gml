/// @description Insert description here
// You can write your code in this editor

if(!global.pause) exit;

if(!shop_active) exit;

if(shop_active)
{
	var g_w,g_h;
	g_w=global.view_width;
	g_h=global.view_height;

	var ds_grid,grid_h;
	ds_grid=pages[page];
	grid_h=ds_grid_height(ds_grid);

	var x_buf,y_buf;
	x_buf=50;
	y_buf=100;

	var x_s,y_s;
	y_s=(g_h/4)-(((grid_h-1)/4)*y_buf);
	x_s=(g_w/4);

	//draw back
	draw_set_alpha(.5)
	draw_rectangle_color(0,0,g_w,g_h,c_black,c_black,c_black,c_black,false);
	

	//draw left
	draw_set_valign(fa_middle);
	draw_set_halign(fa_right);

	var x_lt,y_lt
	x_lt=x_s-x_buf;

	var col,offset;

	for (var _y=0; _y<grid_h; ++_y) 
	{
		y_lt=y_s+((_y*1.5)*y_buf);
	
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
	x_rt=x_s+(x_buf*2);

	for (var _y=0; _y<grid_h; ++_y) 
	{
		y_rt=y_s+((_y*1.5)*y_buf);
	
		//menu types
		switch(ds_grid[# 4, _y])
		{
			#region MELEE
			case "MELEE":
		
			var cur_struct, cost, str, desc, spr, dam, stam;
			cur_struct=ds_grid[# 3, _y];
			cost=cur_struct.cost;
			str=cur_struct.str;
			desc=cur_struct.desc;
			spr=cur_struct.spr;
			dam=cur_struct.dam;
			stam=cur_struct.stam;
		
			col=c_white;
			if(_y=options[page]){col=c_aqua;x_rt+=x_buf*1.5;}else{x_rt=x_s+(x_buf*2);};
			
			draw_rectangle_color(x_rt-(x_buf*1.25),y_rt-(y_buf*.5),x_rt+(x_buf*4),y_rt+(y_buf*.75),col,col,col,col,true);
			draw_rectangle_color(x_rt-(x_buf*1.25),y_rt-(y_buf*.5),x_rt+(x_buf*1.45),y_rt+(y_buf*.45),col,col,col,col,true);
			draw_sprite_ext(spr,0,x_rt+(x_buf*.2),y_rt-(y_buf*.05),3,3,-45,c_white,1);
			draw_text_color(x_rt-(x_buf), y_rt+(y_buf*.6),"desc: "+ string(desc), col, col, col, col, 1);
			draw_text_color(x_rt+(x_buf*1.75), y_rt-(y_buf*.35),"dam: "+ string(dam), col, col, col, col, 1);
			draw_text_color(x_rt+(x_buf*1.75), y_rt-(y_buf*.175),"stam: "+ string(stam), col, col, col, col, 1);
			draw_text_color(x_rt+(x_buf*1.75), y_rt,"cost: "+ string(cost), col, col, col, col, 1);
		
			break;
			#endregion
			
			#region MAGIC
			case "MAGIC":
		
			var cur_struct, cost, str, desc, spr, dam, mana;
			cur_struct=ds_grid[# 3, _y];
			cost=cur_struct.cost;
			str=cur_struct.str;
			desc=cur_struct.desc;
			spr=cur_struct.spr;
			dam=cur_struct.dam;
			mana=cur_struct.mana;
		
			col=c_white;
			if(_y=options[page]){col=c_aqua;x_rt+=x_buf*1.5;}else{x_rt=x_s+(x_buf*2);};
		
			draw_rectangle_color(x_rt-(x_buf*1.25),y_rt-(y_buf*.5),x_rt+(x_buf*4),y_rt+(y_buf*.75),col,col,col,col,true);
			draw_rectangle_color(x_rt-(x_buf*1.25),y_rt-(y_buf*.5),x_rt+(x_buf*1.45),y_rt+(y_buf*.45),col,col,col,col,true);
			draw_sprite_ext(spr,0,x_rt+(x_buf*.2),y_rt+(y_buf*.05),3,3,-45,c_white,1);
			draw_text_color(x_rt-(x_buf), y_rt+(y_buf*.6),"desc: "+ string(desc), col, col, col, col, 1);
			draw_text_color(x_rt+(x_buf*1.75), y_rt-(y_buf*.35),"dam: "+ string(dam), col, col, col, col, 1);
			draw_text_color(x_rt+(x_buf*1.75), y_rt-(y_buf*.175),"mana: "+ string(mana), col, col, col, col, 1);
			draw_text_color(x_rt+(x_buf*1.75), y_rt,"cost: "+ string(cost), col, col, col, col, 1);
			
			break;
			#endregion
			
			#region ITEM
			case "ITEM":
		
			var cur_struct, cost, str, desc, spr, count;
			cur_struct=ds_grid[# 3, _y];
			cost=cur_struct.cost;
			str=cur_struct.str;
			desc=cur_struct.desc;
			spr=cur_struct.spr;
			count=cur_struct.count
			
		
			col=c_white;
			if(_y=options[page]){col=c_aqua;x_rt+=x_buf*1.5;}else{x_rt=x_s+(x_buf*2);};
		
			draw_rectangle_color(x_rt-(x_buf*1.25),y_rt-(y_buf*.5),x_rt+(x_buf*4),y_rt+(y_buf*.75),col,col,col,col,true);
			draw_rectangle_color(x_rt-(x_buf*1.25),y_rt-(y_buf*.5),x_rt+(x_buf*1.45),y_rt+(y_buf*.45),col,col,col,col,true);
			draw_sprite_ext(spr,0,x_rt+(x_buf*.2),y_rt-(y_buf*.05),3,3,-45,c_white,1);
			draw_text_color(x_rt-(x_buf), y_rt+(y_buf*.6),"desc: "+ string(desc), col, col, col, col, 1);
			draw_text_color(x_rt+(x_buf*1.75), y_rt-(y_buf*.35),"count: "+ string(count), col, col, col, col, 1);
			draw_text_color(x_rt+(x_buf*1.75), y_rt-(y_buf*.175),"cost: "+ string(cost), col, col, col, col, 1);
		
			break;
			#endregion
		
		};
	};



	draw_set_valign(fa_top);
};

