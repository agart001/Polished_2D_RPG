/// @description Insert description here
// You can write your code in this editor
event_inherited();

moveable = true;
organic = true;
effect = false;
hp = 50;

pat_x = xstart;
pat_y = ystart;
pat_off = 45;
pat_dir = 0;

secs = 0;
wait_time = 60;
used_time = 0;

max_dist = 250;
vis_dist = 500;
action_dist = 250;

damage_value = 0;
damage_dir = 0;
dam_win = 40;
new_attack = true;

enemy_sprite = spr_en_basic;

en_spr[enemy_state.patrol] = spr_p_run;
en_spr[enemy_state.chase] = spr_p_run;
en_spr[enemy_state._return] = spr_p_run;
en_spr[enemy_state.action] = spr_p_idle;
en_spr[enemy_state.stun] = spr_p_idle;
en_spr[enemy_state.damage] = spr_p_idle;

state = enemy_state.patrol;

en_scr[enemy_state.patrol] = scr_en_basic_patrol;
en_scr[enemy_state.chase] = scr_en_basic_chase;
en_scr[enemy_state._return] = scr_en_basic_return;
en_scr[enemy_state.action] = scr_en_b_range_action;
en_scr[enemy_state.stun] = scr_en_basic_stun;



