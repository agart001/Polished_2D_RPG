/// @description Insert description here
display_set_gui_size(global.view_width,global.view_height);

shop_active = false;
//act_dist = 100;

#region MAIN PAGE
ds_main_id = scr_menu_create_id
(
	["MELEE", menu_type.transfer, shop_page.melee],
	["MAGIC", menu_type.transfer, shop_page.magic],
	["ITEMS", menu_type.transfer, shop_page.items],
	["EXIT", menu_type.funct, scr_exit_menu, shop_active]
);
#endregion

#region MELEE PAGE
ds_melee_id = scr_menu_create_id
(
	["REG SWORD", menu_type.funct, scr_add_melee, global.melee_list.reg_sword, "MELEE"],
	["POIS SWORD", menu_type.funct, scr_add_melee, global.melee_list.pois_sword, "MELEE"],
	["EXIT", menu_type.transfer, shop_page.main]
);
#endregion

#region MAGIC PAGE
ds_magic_id = scr_menu_create_id
(
	["REG MAGIC", menu_type.funct, scr_add_magic, global.magic_list.reg_spell, "MAGIC"],
	["RED MAGIC", menu_type.funct, scr_add_magic, global.magic_list.red_spell, "MAGIC" ],
	["EXIT", menu_type.transfer, shop_page.main]
);
#endregion

#region ITEM PAGE
ds_items_id = scr_menu_create_id
(
	["HP POT", menu_type.funct, scr_add_item, global.item_list.hp_pot_1, "ITEM"],
	["MANA POT", menu_type.funct, scr_add_item, global.item_list.mana_pot_1, "ITEM"],
	["EXIT", menu_type.transfer, shop_page.main]
);
#endregion

page = 0;
pages = 
[
	ds_main_id, 
	ds_melee_id,
	ds_magic_id,
	ds_items_id
];

var page_len;
page_len = array_length(pages);
for (var i=0; i<page_len; ++i) {options[i]=0;};

