/// @description Insert description here
var dam_val,dam_dir,dam_hsp,dam_vsp;
dam_val=damage_value;
dam_dir=damage_dir;

with(other)
{
	if(moveable)
	{
		dam_hsp=lengthdir_x(dam_val,dam_dir);//_dam_val*cos(_dam_dir);
		dam_vsp=lengthdir_y(dam_val,dam_dir);//_dam_val*sin(_dam_dir);
						
		image_blend=c_red;
						
		hsp=dam_hsp;
		vsp=dam_vsp;
		hp-=dam_val;
		state=enemy_state.stun;
	}
	else{hp-=dam_val;};
};

instance_destroy(self);
