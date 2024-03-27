/// @description Insert description here
// You can write your code in this editor
#region Tile Collision
var bbox_side;
	
//Horizontal Collision
if(speed > 0){bbox_side=bbox_right;}else{bbox_side=bbox_left;};
if( tilemap_get_at_pixel(col_tm,bbox_side+speed,bbox_top)!=0 || 
	tilemap_get_at_pixel(col_tm,bbox_side+speed,bbox_bottom)!=0)
{
	instance_destroy(self);
};
	
	
//Vertical Collision
if(speed < 0){bbox_side=bbox_bottom;}else{bbox_side=bbox_top;};
if( tilemap_get_at_pixel(col_tm,bbox_left,bbox_side+speed)!=0 || 
	tilemap_get_at_pixel(col_tm,bbox_right,bbox_side+speed)!=0)
{
	instance_destroy(self);
};
#endregion