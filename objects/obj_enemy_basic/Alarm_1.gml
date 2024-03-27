/// @description Stun State Reset
// You can write your code in this editor
var p_dist;
p_dist = point_distance(x,y,obj_BC_player.x,obj_BC_player.y);	
if(p_dist<=vis_dist){state=enemy_state.chase; alarm[2]=0;}
else{state=enemy_state._return; new_attack=true;};