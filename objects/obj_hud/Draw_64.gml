/// @description Insert description here
// You can write your code in this editor
var hud_x,hud_y,hud_diff;

if(!hud_active) exit;

if(hud_active)
{
#region LOCAL VARS
var p_hp,p_max_hp;
p_hp=obj_BC_player.hp;
p_max_hp=obj_BC_player.max_hp;

var p_stam,p_max_stam;
p_stam=obj_BC_player.stam;
p_max_stam=obj_BC_player.max_stam;

var p_mana,p_max_mana;
p_mana=obj_BC_player.mana;
p_max_mana=obj_BC_player.max_mana;

var p_melee,p_magic,p_item,p_equip;
p_melee=obj_BC_player.cur_melee;
p_magic=obj_BC_player.cur_magic;
p_item=obj_BC_player.cur_item;
p_equip=obj_BC_player.cur_equip;
#endregion

#region STAT BARS
var bar_w;
hud_x=25;
hud_y=25;
hud_diff=25;
bar_w=16;

#region HEALTH

draw_text(hud_x+(p_max_hp+hud_diff),hud_y,string(p_hp));

draw_sprite_stretched
(
spr_hp,
0,		
hud_x,
hud_y,
(p_hp/p_max_hp)*p_max_hp,
bar_w
);

draw_sprite(spr_bar_end,0,hud_x-1,hud_y);

draw_sprite(spr_bar_end,0,(hud_x+p_max_hp)+1,hud_y);

draw_sprite_stretched
(
spr_bar_mid,
0,		
hud_x,
hud_y,
p_max_hp,
bar_w
);

#endregion

#region STAMINA

draw_text(hud_x+(p_max_stam+hud_diff),hud_y+hud_diff,string(p_stam));

draw_sprite_stretched
(
spr_stam,
0,		
hud_x,
hud_y+hud_diff,
(p_stam/p_max_stam)*p_max_stam,
bar_w
);

draw_sprite(spr_bar_end,0,hud_x-1,hud_y+hud_diff);

draw_sprite(spr_bar_end,0,(hud_x+p_max_stam)+1,hud_y+hud_diff);

draw_sprite_stretched
(
spr_bar_mid,
0,		
hud_x,
hud_y+hud_diff,
p_max_stam,
bar_w
);

#endregion

#region MANA

draw_text(hud_x+(p_max_mana+hud_diff),hud_y+(hud_diff*2),string(p_mana));

draw_sprite_stretched
(
spr_mana,
0,		
hud_x,
hud_y+(hud_diff*2),
(p_mana/p_max_mana)*p_max_mana,
bar_w
);

draw_sprite(spr_bar_end,0,hud_x-1,hud_y+(hud_diff*2));

draw_sprite(spr_bar_end,0,(hud_x+p_max_mana)+1,hud_y+(hud_diff*2));

draw_sprite_stretched
(
spr_bar_mid,
0,		
hud_x,
hud_y+(hud_diff*2),
p_max_mana,
bar_w
);

#endregion
#endregion

#region INV
hud_x=25;
hud_y=725;
hud_diff=50;

var melee_spr,magic_spr,item_spr;
melee_spr=p_melee.spr;
magic_spr=p_magic.spr;
item_spr=p_item.spr;

var item_count,stam_dec,mana_dec;
item_count=string(p_item.count);
stam_dec=p_melee.stam;
mana_dec=p_magic.mana;


if(p_equip=="MELEE"){draw_rectangle_color(hud_x,hud_y,hud_x+hud_diff,hud_y+hud_diff,c_white,c_white,c_white,c_white,true);}
else{draw_rectangle_color(hud_x,hud_y,hud_x+hud_diff,hud_y+hud_diff,c_aqua,c_aqua,c_aqua,c_aqua,true);};

if(p_equip=="MAGIC"){draw_rectangle_color(hud_x+(hud_diff*2),hud_y,hud_x+(hud_diff*3),hud_y+hud_diff,c_white,c_white,c_white,c_white,true);}
else{draw_rectangle_color(hud_x+(hud_diff*2),hud_y,hud_x+(hud_diff*3),hud_y+hud_diff,c_aqua,c_aqua,c_aqua,c_aqua,true);};

if(p_equip=="ITEM"){draw_rectangle_color(hud_x+(hud_diff*4),hud_y,hud_x+(hud_diff*5),hud_y+hud_diff,c_white,c_white,c_white,c_white,true);}
else{draw_rectangle_color(hud_x+(hud_diff*4),hud_y,hud_x+(hud_diff*5),hud_y+hud_diff,c_aqua,c_aqua,c_aqua,c_aqua,true);};


draw_sprite_ext(melee_spr,0,hud_x+(hud_diff*.5),hud_y+(hud_diff*.5),1,1,0,c_white,1);
draw_sprite_ext(magic_spr,0,hud_x+(hud_diff*2.5),hud_y+(hud_diff*.5),1,1,0,c_white,1);
draw_sprite_ext(item_spr,0,hud_x+(hud_diff*4.5),hud_y+(hud_diff*.5),1,1,0,c_white,1);


draw_text(hud_x+(hud_diff*.5),hud_y,stam_dec);
draw_text(hud_x+(hud_diff*2.5),hud_y,mana_dec);
if(global.item_inv_ind!=0){draw_text(hud_x+(hud_diff*4.75),hud_y,item_count);};
#endregion
};
