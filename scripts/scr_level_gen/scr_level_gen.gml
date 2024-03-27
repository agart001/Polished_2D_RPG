// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//Load Room -- takes room sprite, use sprite to generate level
function scr_load_rm(sprite)
{
	//sprite variables
	var spr_w = sprite_get_width(sprite);
	var spr_h = sprite_get_height(sprite);
	
	//tile variables
	var c_w = 64; 
	var c_h = 64; 
	
	//create surface
	var surf = surface_create(spr_w,spr_h);
	surface_set_target(surf);
	draw_clear_alpha(c_black,0);
	draw_sprite(sprite,0,0,0);
	surface_reset_target();
	
	//create buffer
	var buffer = buffer_create(4*spr_w*spr_h,buffer_fixed,1);
	buffer_get_surface(buffer,surf,0);
	
	//check sprite pixels
	for(var i = 0; i < spr_w; i++)
	{
		for(var j = 0; j < spr_h; j++)
		{
			//pixel
			
			var offset = 4*(i+(j*spr_w));
			
			//pixel RGB
			var r,g,b;
			r=buffer_peek(buffer,offset,buffer_u8);
			g=buffer_peek(buffer,offset+1,buffer_u8);
			b=buffer_peek(buffer,offset+2,buffer_u8);
			
			//pixel color
			var col = make_color_rgb(r,g,b);
			
			//pixel data
			var data = scr_color_return(col);	
			
			if(data==undefined) continue;
			
			//create pixel data
			scr_create_data(data,i,j,c_w,c_h);
		};
	};
	
	//clear surface/buffer
	surface_free(surf);
	buffer_delete(buffer);
	
	return true;
};

//Destroy Room -- unloads current room
function scr_destroy_rm()
{	
	var tl_lay,tl_mp;
	
	//objects
	layer_destroy_instances("Instances");
	
	//floor tiles
	tl_lay = layer_get_id("floor_tiles");
	tl_mp = layer_tilemap_get_id(tl_lay);
	tilemap_clear(tl_mp,0);
	
	//col tiles --- MUST BE LAST
	tl_lay = layer_get_id("col_tiles")
	tl_mp = layer_tilemap_get_id(tl_lay);
	tilemap_clear(tl_mp,0);
}

//Color Return -- takes color, returns associated data
function scr_color_return(color)
{
	switch(color)
	{
		#region Tiles
		
		case $CA9383://floor
		return "floor";
		
		case $4AB539://wall
		return "wall";
		
		#endregion
		
		#region Objects
		
		case $8F2792://door
		return obj_door;
		
		//9E0B0F
		case $0F0B9E://shop
		return obj_shop;
		
		case $241CEE://dam:
		return obj_damage;
		
		case $AA6EF1://finish
		return obj_finish;
		
		case $4F6CF3://enemy basic:
		return obj_enemy_basic;
		
		//ACD473
		case $73D4AC://enemy basic:
		return obj_enemy_b_range;
		
		case $A95C60://enemy basic:
		return obj_enemy_turret;
		
		case $00F2FF://player:
		return obj_player;
		
		#endregion
		
		default:
		return undefined;
	};
}

//Create Data -- takes data/position, loads data at position
function scr_create_data(data,i,j,c_w,c_h)
{
	var tl_lay,tl_mp,tl;
	
	switch(data)
	{
		#region Tiles
		
		case "floor"://floor --- TILE LAYER AND MAP MUST CHANGE
		tl_lay = layer_get_id("floor_tiles");
		tl_mp = layer_tilemap_get_id(tl_lay);
		tl = irandom_range(2,4);
		tilemap_set_at_pixel(tl_mp,tl,i*c_w,j*c_h);
		break;
		
		case "wall"://wall --- TILEMAP REMAINS SAME
		tl_lay = layer_get_id("col_tiles");
		tl_mp = layer_tilemap_get_id(tl_lay);
		tl = irandom_range(1,4);
		tilemap_set_at_pixel(tl_mp,tl,i*c_w,j*c_h);
		break;
		
		#endregion
		
		#region Objects
		
		case obj_door://door:
		instance_create_layer(i*c_w,j*c_h,"Instances",data);
		break;
		
		case obj_shop://shop:
		instance_create_layer(i*c_w,j*c_h,"Instances",data);
		break;
		
		case obj_damage://dam:
		instance_create_layer(i*c_w,j*c_h,"Instances",data);
		break;
		
		case obj_finish://finish:
		instance_create_layer(i*c_w,j*c_h,"Instances",data);
		break;
		
		case obj_enemy_basic://enemy:
		instance_create_layer(i*c_w,j*c_h,"Instances",data);
		break;
		
		case obj_enemy_b_range://enemy:
		instance_create_layer(i*c_w,j*c_h,"Instances",data);
		break;
		
		case obj_enemy_turret://enemy:
		instance_create_layer(i*c_w,j*c_h,"Instances",data);
		break;
		
		case obj_player://player:
		instance_create_layer(i*c_w,j*c_h,"Player",data);
		break;
		
		#endregion
	};

}

//Door Direction -- generates door direction based on door position
function scr_door_dir()
{
	var spr_h,spr_w;
	spr_h = sprite_height*1.5;
	spr_w = sprite_width*1.5;
	
	//UP -- space above empty
	if(y-spr_h<0)
	{
		return "UP";
	};
	
	//DOWN -- space below empty
	if(y+spr_h>room_height) 
	{
	    return "DOWN";
	}
	
	//RIGHT -- space right empty
	if(x+spr_w>room_width) 
	{
	    return "RIGHT";
	}
	
	//LEFT -- spcae left empty
	if(x-spr_w<0)
	{
		return "LEFT";
	};
	
}