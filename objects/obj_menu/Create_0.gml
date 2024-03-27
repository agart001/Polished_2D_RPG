/// @description Insert description here

display_set_gui_size(global.view_width,global.view_height);

#region MAIN PAGE
ds_main_id = scr_menu_create_id
(
	["NEW GAME", menu_type.funct, scr_new_game],
	["SETTINGS", menu_type.transfer, menu_page.settings],
	["EXIT", menu_type.funct, scr_exit_game]
);
#endregion

#region SETTINGS PAGE
ds_settings_id = scr_menu_create_id
(
	["CONTROLS", menu_type.transfer, menu_page.controls],
	["DIFFICULTY", menu_type.transfer, menu_page.difficulty],
	["AUDIO", menu_type.transfer, menu_page.audio],
	["GRAPHICS", menu_type.transfer, menu_page.graphics],
	["BACK", menu_type.transfer, menu_page.main]
);
#endregion

#region AUDIO PAGE
ds_audio_id = scr_menu_create_id
(
	["MASTER", menu_type.slider, scr_change_vol, 1, [0,1] ],
	["MUSIC", menu_type.slider, scr_change_vol, 1, [0,1] ],
	["EFFECTS", menu_type.slider, scr_change_vol, 1, [0,1] ],
	["BACK", menu_type.transfer, menu_page.settings]
);
#endregion

#region CONTROLS PAGE
ds_controls_id = scr_menu_create_id
(
	["UP", menu_type.input, "key_up", ord("W")],
	["DOWN", menu_type.input, "key_down", ord("S")],
	["RIGHT", menu_type.input, "key_right", ord("D")],
	["LEFT", menu_type.input, "key_left", ord("A")],
	["ACTION", menu_type.input, "key_action", mb_left],
	["ROLL", menu_type.input, "key_roll", vk_space],
	["INV UP", menu_type.input, "key_inv_inc", ord("E")],
	["INV DOWN", menu_type.input, "key_inv_dec", ord("Q")],
	["SWORD", menu_type.input, "key_1", ord("1")],
	["BOW", menu_type.input, "key_2", ord("2")],
	["SHIELD", menu_type.input, "key_3", ord("3")],
	["BACK", menu_type.transfer, menu_page.settings]
);
#endregion

#region DIFFICULTY PAGE
ds_difficulty_id = scr_menu_create_id
(
	["LEVEL", menu_type.shift, scr_change_diff, 0, ["EASY", "MED", "HARD"] ],
	["BACK", menu_type.transfer, menu_page.settings]
);
#endregion

#region GRAPHICS PAGE
ds_graphics_id = scr_menu_create_id
(
	["RESOLUTION", menu_type.shift, scr_change_res, 0, ["720 X 360", "1080 X 720","1920 X 1080"] ],
	["WINDOW", menu_type.toggle, scr_change_win, 1, ["FULLSCREEN", "WINDOWED"] ],
	["BACK", menu_type.transfer, menu_page.settings]
);
#endregion


page = 0;
pages = 
[
	ds_main_id, 
	ds_settings_id, 
	ds_audio_id, 
	ds_difficulty_id, 
	ds_graphics_id,
	ds_controls_id
];

var page_len;
page_len = array_length(pages);
for (var i=0; i<page_len; ++i) {options[i]=0;};

input_active = false;