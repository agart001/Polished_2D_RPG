/// @description Room Gen Handler

//player position
var p_x,p_y;
p_x = obj_BC_player.x;
p_y = obj_BC_player.y;

//player door collision
if(position_meeting(p_x,p_y,obj_door))
{
	//door variables
	var inst_door,d_x,d_y,d_dir;
	inst_door = instance_position(p_x,p_y,obj_door);
	d_x = inst_door.x;
	d_y = inst_door.y;
	d_dir = inst_door.door_dir;
	
	//backward check -- can go back, unless in start
	if(cur_rm!=0)
	{
		//check door direction
		if(d_dir==backward_dir[cur_rm-1])
		{
			//unload room/decrement room number
			scr_destroy_rm();
			cur_rm--;
			
			//start room -- player heads back to start
			if(cur_rm-1<0)
			{
				show_message("0")
				//load start room
				scr_load_rm(spr_rm_start);
				
				//spawn player/forward direction -- start room has one enter direction
				#region LEFT
				with(obj_player)
				{
					x = p_x+(room_width*.85);
					y = d_y;
				};
				
				#endregion
				
				exit;
			};
			else
			{
			//standard back -- door direction determines spawn/forward direction
				switch(d_dir)
				{
					#region UP
					case "UP":
					with(obj_player)
					{
						x = d_x;
						y = p_y+(room_height*.75);
					};
				
					forward_dir[cur_rm-1] = "DOWN";
					break;
					#endregion
				
					#region DOWN
					case "DOWN":
					with(obj_player)
					{
						x = d_x;
						y = p_y-(room_height*.75);
					};
				
					forward_dir[cur_rm-1] = "UP";
					break;
					#endregion
				
					#region RIGHT
					case "RIGHT":
					with(obj_player)
					{
						x = p_x-(room_width*.85);
						y = d_y;
					};
				
					forward_dir[cur_rm-1] = "LEFT";
					break;
					#endregion
				
					#region LEFT
					case "LEFT":
					with(obj_player)
					{
						x = p_x+(room_width*.85);
						y = d_y;
					};
				
					forward_dir[cur_rm-1] = "RIGHT";
					break;
					#endregion
				};
			};
			
			//load backward room
			scr_load_rm(entered_rms[cur_rm-1])
			
			exit;
		};
	};
	
	//forward check -- only go forward, if you are back
	if(cur_rm<total_rms)
	{
		//check room -- start room or standard
		if(cur_rm==0)
		{
			//start room -- player heads forward out of start again
			if(d_dir==str_for)
			{
				//unload room/increment room number
				scr_destroy_rm();
				cur_rm++;
			
				//spawn player/backward direction -- start room has one exit direction
				#region RIGHT
				with(obj_player)
				{
					x = p_x-(room_width*.85);
					y = d_y;
				};
				#endregion
				
				//load start room
				scr_load_rm(entered_rms[cur_rm-1]);
				
				exit;
			};
		}
		else
		{
			//standard room -- player heads forward
			if(d_dir==forward_dir[cur_rm-1])
			{
				//unload room/increment room number
				scr_destroy_rm();
				cur_rm++;
			
				
				//spawn player -- door direction determines spawn
				switch(d_dir)
				{
					#region UP
					case "UP":
					with(obj_player)
					{
						x = d_x;
						y = p_y+(room_height*.75);
					};
		
					break;
					#endregion
				
					#region DOWN
					case "DOWN":
					with(obj_player)
					{
						x = d_x;
						y = p_y-(room_height*.75);
					};
				
				
					break;
					#endregion
				
					#region RIGHT
					case "RIGHT":
					with(obj_player)
					{
						x = p_x-(room_width*.85);
						y = d_y;
					};
				
				
					break;
					#endregion
				
					#region LEFT
					case "LEFT":
					with(obj_player)
					{
						x = p_x+(room_width*.85);
						y = d_y;
					};
				
				
					break;
					#endregion
				};
				
				//load forward room
				scr_load_rm(entered_rms[cur_rm-1]);
				
				exit;
			};
		};
	};
	
	//new room check -- generate new rooms based on direction
	if(cur_rm==total_rms&&max_rms>total_rms)
	{
		//room array/room
		var rm_array,rm;
		
		//max room check
		if(total_rms+1==max_rms)
		{
			//unload room
			scr_destroy_rm();
			
			//door direction -- pick room(end rooms), spawn player, backward direction
			switch(d_dir)
			{
				#region UP
				case "UP":
				rm_array = end_rms;
				rm = 2;
		
				with(obj_player)
				{
				x = d_x;
				y = p_y+(room_height*.75);
				};
		
				entered_rms[cur_rm] = rm_array[rm];
				backward_dir[cur_rm] = "DOWN";
		
				scr_load_rm(rm_array[rm]);
				break;
				
				#endregion
		
				#region DOWN
				case "DOWN":
				rm_array = end_rms;
				rm = 3;
		
				with(obj_player)
				{
				x = d_x;
				y = p_y-(room_height*.75);
				};
		
				entered_rms[cur_rm] = rm_array[rm];
				backward_dir[cur_rm] = "UP";
		
				scr_load_rm(rm_array[rm]);
				break;
				
				#endregion
		
				#region RIGHT
				case "RIGHT":
				rm_array = end_rms;
				rm = 0;
		
				with(obj_player)
				{
					x = p_x-(room_width*.85);
					y = d_y;
				};
		
				entered_rms[cur_rm] = rm_array[rm];
				backward_dir[cur_rm] = "LEFT";
		
				scr_load_rm(rm_array[rm]);
				break;
				#endregion
		
				#region LEFT
				case "LEFT":
				rm_array = end_rms;
				rm = 1;
		
				with(obj_player)
				{
					x = p_x+(room_width*.85);
					y = d_y;
				};
		
				entered_rms[cur_rm] = rm_array[rm];
				backward_dir[cur_rm] = "RIGHT";
		
				scr_load_rm(rm_array[rm]);
				break;
				#endregion
			};
		
			//increment total/current rooms
			total_rms++;
			cur_rm++;
			
			exit;
		}
		else
		{
			//unload room
			scr_destroy_rm();
			
			//door direction -- pick room, spawn player, backward direction
			switch(d_dir)
			{
				#region UP
				case "UP":
				rm_array = ver_rms;
				rm = irandom_range(0,1);
		
				with(obj_player)
				{
				x = d_x;
				y = p_y+(room_height*.75);
				};
		
				entered_rms[cur_rm] = rm_array[rm];
				backward_dir[cur_rm] = "DOWN";
		
				scr_load_rm(rm_array[rm]);
				break;
				#endregion
		
				#region DOWN
				case "DOWN":
				rm_array = ver_rms;
				rm = irandom_range(0,1);
		
				with(obj_player)
				{
				x = d_x;
				y = p_y-(room_height*.75);
				};
		
				entered_rms[cur_rm] = rm_array[rm];
				backward_dir[cur_rm] = "UP";
		
				scr_load_rm(rm_array[rm]);
				break;
				#endregion
		
				#region RIGHT
				case "RIGHT":
				rm_array = hor_rms;
				rm = irandom_range(0,1);
		
				with(obj_player)
				{
					x = p_x-(room_width*.85);
					y = d_y;
				};
		
				entered_rms[cur_rm] = rm_array[rm];
				backward_dir[cur_rm] = "LEFT";
		
				scr_load_rm(rm_array[rm]);
				break;
				#endregion
		
				#region LEFT
				case "LEFT":
				rm_array = hor_rms;
				rm = irandom_range(0,1);
		
				with(obj_player)
				{
					x = p_x+(room_width*.85);
					y = d_y;
				};
		
				entered_rms[cur_rm] = rm_array[rm];
				backward_dir[cur_rm] = "RIGHT";
		
				scr_load_rm(rm_array[rm]);
				break;
				#endregion
			};
			
			//increment total/current rooms
			total_rms++;
			cur_rm++;
			
			exit;
		};
	};

};

//player level finish collision
if(position_meeting(p_x,p_y,obj_finish))
{
	//unload room
	scr_destroy_rm();
	show_message("finish");
	
	//clear arrays
	entered_rms = [];
	backward_dir = [];
	forward_dir = [];
	
	//clear rooms/increment level
	cur_rm = 0;
	total_rms = 0;
	level++;
	
	//determine new max
	var new_max = max_rms+round(max_rms/3)*level;
	max_rms = new_max;

	//spawn player
	with(obj_player)
	{
		x = room_width/2;
		y = room_height/2;
	};
	
	//load start room
	scr_load_rm(spr_rm_start);
};

