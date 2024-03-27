///Player Variables

//Collision Variables
col_tm = layer_tilemap_get_id("col_tiles");
damage_inst = noone;

hit_list = -1;

//Image Variables
col_spr = spr_player;
image_speed = 0;
local_frame = 0;

#region CHAR VARIABLES

hsp = 0;
vsp = 0;
sp_run = 10;

sp_roll = 15;
al_roll = 30;
dec_roll = 10;
roll = true;

hp = 100;
stam = 100;
mana = 100;

max_hp = 100;
max_stam = 100;
max_mana = 100;

gen_hp = .0015;
gen_stam = .025;
gen_mana = 0;

dec_stam = 15;
dec_mana = 15;

coins = 0;
cur_equip = "MELEE";

cur_melee = global.melee_list.reg_sword;
cur_magic = global.magic_list.reg_spell;
cur_item = global.item_list.hp_pot_1;


#endregion

#region SPRITES

p_spr[player_state.idle] = spr_p_idle;
p_spr[player_state.run] = spr_p_run;
p_spr[player_state.action] = cur_melee.anim;
p_spr[player_state.roll] = spr_p_run;
p_spr[player_state.damage] = spr_player;

#endregion

#region STATES

p_scr[player_state.idle] = scr_player_idle;
p_scr[player_state.run] = scr_player_run;
p_scr[player_state.action] = scr_player_action;
p_scr[player_state.roll] = scr_player_roll;
p_scr[player_state.damage] = scr_player_damage;

state = player_state.idle

#endregion
