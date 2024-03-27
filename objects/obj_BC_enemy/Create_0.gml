/// @description Enemy BC Variables

col_tm = layer_tilemap_get_id("col_tiles");

damage_inst = noone;
moveable = false;

hp = 100;
hsp = 0;
vsp = 0;
spd = 5;

action_ready = false;

enemy_sprite = -1;

en_spr[enemy_state.patrol] = -1;
en_spr[enemy_state.chase] = -1;
en_spr[enemy_state._return] = -1;
en_spr[enemy_state.action] = -1;
en_spr[enemy_state.stun] = -1;
en_spr[enemy_state.damage] = -1;


state = enemy_state.patrol

en_scr[enemy_state.patrol] = -1;
en_scr[enemy_state.chase] = -1;
en_scr[enemy_state._return] = -1;
en_scr[enemy_state.action] = -1;
en_scr[enemy_state.stun] = -1;
en_scr[enemy_state.damage] = -1;

alarm[0] = 1;
