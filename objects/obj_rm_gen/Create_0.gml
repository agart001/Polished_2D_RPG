/// @description Room Gen Variables

//Room Sprite Arrays -- vertical, horizontal, end rooms
ver_rms = [spr_rm_1,spr_rm_3];
hor_rms = [spr_rm_1,spr_rm_2];
end_rms = [spr_rm_R_end,spr_rm_L_end,spr_rm_U_end,spr_rm_D_end];

//Entered Rooms Array -- array of already generated rooms
entered_rms = [];

//Backward/Forward Arrays -- array of directions to stored rooms
backward_dir = [];
forward_dir = [];

str_for = "RIGHT"
str_bck = "LEFT"

//Room Variables
cur_rm = 0;
total_rms = 0;
max_rms = 5;

//Level Variables
level = 0;

