/// @description Insert description here
// You can write your code in this editor

view_width = 1000;
view_height = 800;

window_scale = 1;

var scaled_w,scaled_h;
scaled_w = view_width*window_scale;
scaled_h = view_height*window_scale;

window_set_size(scaled_w,scaled_h);
alarm[0] = 1;

surface_resize(application_surface,scaled_w,scaled_h);
