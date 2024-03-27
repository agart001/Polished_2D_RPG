/// @description Spawn Tile
// You can write your code in this editor
var tl_lay,tl_mp,tl;
tl_lay = layer_get_id("floor_tiles");
tl_mp = layer_tilemap_get_id(tl_lay);
tl = irandom_range(1,4);
tilemap_set_at_pixel(tl_mp,tl,x,y);