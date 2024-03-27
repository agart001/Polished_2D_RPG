/// @description Insert description here
// You can write your code in this editor
shader_set(shad_glow);

shader_set_uniform_f(glow_handler,value);
draw_surface(application_surface,0,0);

shader_reset();

//draw_text(100,50,string(value));