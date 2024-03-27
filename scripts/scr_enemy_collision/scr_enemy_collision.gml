// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_collision()
{	
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
		else{y = y-(y mod 64)-(bbox_top-y);};
		vsp = 0;
	};
	y += vsp;
	
	#endregion
}