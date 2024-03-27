// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.frc = .2;

global.pause = true;
global.view_width = 1000;
global.view_height = 800;

global.p_input = true;
global.p_coins = 1000;

global.key_m_enter = mb_left;

global.key_esc = ord("X");
global.key_enter = vk_enter;

global.key_interact = ord("F")

global.key_action = mb_left;
global.key_roll = vk_space;

global.key_up = ord("W");
global.key_down = ord("S");
global.key_right = ord("D");
global.key_left = ord("A");

global.key_inv_inc = ord("E");
global.key_inv_dec = ord("Q");

global.key_1 = ord("1");
global.key_2 = ord("2");
global.key_3 = ord("3");

//#macro TILE_SIZE 64;
#macro FRAME_RATE 60;

enum shop_page
{
	main,
	melee,
	magic,
	items
};

enum menu_page
{
	main,
	settings,
	audio,
	difficulty,
	graphics,
	controls,
	height
};

enum menu_type
{
	funct,
	transfer,
	slider,
	shift,
	toggle,
	input
};

enum player_state
{
	idle,
	run,
	damage,
	action,
	roll
};

enum enemy_state
{
	patrol,
	chase,
	_return,
	action,
	damage,
	stun,
	search
};
