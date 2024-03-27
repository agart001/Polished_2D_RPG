/// @description Insert description here
// You can write your code in this editor
if(hp<=0){instance_destroy(self);};

if(en_scr[state]!= -1){script_execute(en_scr[state]);};


var prev_spr = sprite_index;

if(en_spr[state]!= -1){sprite_index=en_spr[state];};

if(prev_spr!=sprite_index){local_frame=0;};

if(en_spr[state]!= -1){scr_anim_spr();};

