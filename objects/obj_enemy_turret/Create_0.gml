/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 250;
spd = 10;

vis_dist = 300;

rand_dir = 0;
aim_dir = 0;

locked = false;

enemy_sprite = spr_en_turret;

state = enemy_state.patrol;

en_scr[enemy_state.patrol] = scr_en_turret_search;
en_scr[enemy_state.chase] = scr_en_turret_track;
en_scr[enemy_state._return] = -1;
en_scr[enemy_state.action] = scr_en_turret_action;
en_scr[enemy_state.stun] = -1;
