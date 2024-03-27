/// @description Insert description here
// You can write your code in this editor

#region MELEE STRUCTS
function create_melee(_str,_desc,_spr,_hitbox,_anim,_dam,_stam,_funct,_cost) constructor
{
	str=_str;
	desc=_desc;
	spr=_spr;
	hitbox=_hitbox;
	anim=_anim;
	dam=_dam;
	stam=_stam;
	funct=_funct
	cost=_cost;
};

global.melee_list =
{
	#region REG SWORD
	reg_sword : new create_melee
	(
		"REG SWORD",
		"a regular sword",
		spr_reg_sw,
		spr_HB_p_attack,
		spr_p_attack,
		20,
		15,
		function(enemy)
		{
			exit;
		},
		100
	),
	#endregion
	
	#region POIS SWORD
	pois_sword : new create_melee
	(
		"POIS SWORD",
		"a poison sword",
		spr_pois_sw,
		spr_HB_p_attack,
		spr_p_attack_pois,
		10,
		30,
		function(enemy)
		{
			var pois_val, count;
			pois_val=.01;
			count=60;
			if(enemy.effect==false)
			{
				if(enemy.organic)
				{
					show_message("start")
					with(enemy)
					{
						effect=true;
						for(var i=0;i<count;i++)
						{
							hp-=pois_val;
							//if(i==count){show_message("end");enemy.effect=false;};
						};
						if(i==count){show_message("end");effect=false;};
					};
				}else{exit;};
			};
		},
		100
	)
	#endregion
};
#endregion

#region MAGIC STRUCTS
function create_magic(_str,_desc,_spr,_anim,_dam,_mana,_spd,_rand,_lmt,_cost) constructor
{
	str=_str;
	desc=_desc;
	spr=_spr;
	anim=_anim;
	dam=_dam;
	mana=_mana;
	spd=_spd;
	rand=_rand;
	limit=_lmt;
	cost=_cost;
};


global.magic_list = 
{
	#region REG SPELL
	reg_spell : new create_magic
	(
		"REG SPELL",
		"a regular spell",
		spr_arrow,
		spr_player,
		20,
		15,
		15+random_range(-2,2),
		random_range(-5,5),
		30,
		100
	),
	#endregion
	
	#region RED SPELL
	red_spell : new create_magic
	(
		"RED SPELL",
		"a red spell",
		spr_arrow_red,
		spr_player,
		40,
		30,
		10+random_range(-3,3),
		random_range(-7,7),
		30,
		100
	)
	#endregion
};
#endregion

#region ITEM STRUCTS
function create_item(_str,_desc,_spr,_anim,_count,_funct,_cost) constructor
{
	str=_str;
	desc=_desc;
	spr=_spr;
	anim=_anim;
	count=_count;
	funct=_funct;
	cost=_cost;
};

function scr_empty_item()
{
	var itm_len;
	itm_len=array_length(global.item_inv);
	array_delete(global.item_inv,global.item_inv_ind,1)
	if(global.item_inv_ind-1<0){global.item_inv_ind=itm_len-1;}else{global.item_inv_ind-=1;};
	obj_BC_player.cur_item=array_get(global.item_inv,global.item_inv_ind);
};

global.item_list =
{
	items_empty : new create_item
	(
		"NO ITEMS",
		"Items empty",
		spr_no_item,
		spr_player,
		0,
		function(struct)
		{
			exit;
		},
		0
	),
	
	#region HP POT 1
	hp_pot_1 : new create_item
	(
		"HP POTION",
		"Restores 10 HP",
		spr_hp_pot,
		spr_player,
		3,
		function(struct)
		{
			var hp_val = 20;
			if(struct.count!=0)
			{
				struct.count--;
				with(obj_BC_player)
				{
					if(hp+hp_val>max_hp){hp=max_hp;}
					else{hp+=hp_val;};
				};
				
				if(struct.count==0)
				{
					scr_empty_item();
				};
			};
		},
		50
	),
	#endregion
	
	#region MANA POT 1
	mana_pot_1 : new create_item
	(
		"MANA POTION",
		"Restores 10 MP",
		spr_mana_pot,
		spr_player,
		3,
		function(struct)
		{
			var mana_val = 20;
			if(struct.count!=0)
			{
				struct.count--;
				with(obj_BC_player)
				{
					if(mana+mana_val>max_mana){mana=max_mana;}
					else{mana+=mana_val;};
				};
				
				if(struct.count==0)
				{
					scr_empty_item();
				};
			};
		},
		50
	)
	#endregion
};

#endregion

global.melee_inv=array_create(0);
global.magic_inv=array_create(0);
global.item_inv=array_create(0);

global.melee_inv_ind=0;
global.magic_inv_ind=0;
global.item_inv_ind=1;

array_push(global.melee_inv, global.melee_list.reg_sword, global.melee_list.pois_sword);
array_push(global.magic_inv, global.magic_list.reg_spell, global.magic_list.red_spell);
array_push(global.item_inv, global.item_list.items_empty, global.item_list.hp_pot_1);
