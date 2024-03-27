/// @description Debug Room Draw

/// Draw Event
if(cur_rm!=0)
{
	draw_text(100,100,string(cur_rm));
	draw_text(200,100,string(total_rms));
};

//var len = array_length(entered_rms);
//if len>0
//{
//    for(var i=0; i<len; i++)
//    {
//		draw_sprite_ext(entered_rms[i],0,100+i*200,5,6,6,0,c_white,1);
//        draw_text(100, 150+i*20,"#"+string(i)+": "+"rm"+string(entered_rms[i])); // 20 being the space between each line
//		draw_text(175, 150+i*20,"B:"+string(backward_dir[i])); // 20 being the space between each line
//		//if(!is_undefined(forward_dir[i])){draw_text(235, 100+i*20,"F:"+string(forward_dir[i]));}; // 20 being the space between each line
//    }
//}