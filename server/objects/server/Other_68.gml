/// @description Insert description here
// You can write your code in this editor

show_debug_message("async_firing");


var n_id = ds_map_find_value(async_load, "id");
if n_id == server_socket{
    var t = ds_map_find_value(async_load, "type");
    switch(t){
		case network_type_connect:
			var socket = ds_map_find_value(async_load, "socket");
			ds_map_add(connected_peers_map,socket,socket);
		break;
        case network_type_disconnect:
		show_debug_message("Have the client close the connection after getting the needed info! Something about time_wait in tcp.");
		show_debug_message("What to do if somebody disconects after hitting play.");
            var socket = ds_map_find_value(async_load, "socket");
			var client_who_left = ds_map_find_value(connected_peers_map,socket);
			// is the below a sufficient failsafe?
			if(client_who_left == undefined){
				game_restart(); 
			}
			network_destroy(client_who_left);
			// run the above once clients have been succesfully matched also
			
			// or using a map solves the sorting problem
            // write an array sort function to delete the client who left? 
			// or does it not matter because the array can just be deleted at game end? 
			// use a struct instead possibly?
        break;
        case network_type_data:
			show_debug_message("data is incoming");
        break;
	}
}
else{
	show_debug_message("else it is a client sending something!");
	
	//the first piece of data in the buffer will determine which function to fire 
	//all functions in this else block will be defined in this objects create event
	var socket_id = ds_map_find_value(async_load, "id");
	var buff = ds_map_find_value(async_load, "buffer");
	var cmd = buffer_read(buff, buffer_u8);
	show_debug_message(cmd);
	
	switch(cmd){
		
		case find_match:
			var ip = buffer_read(buff, buffer_string);
			var port = buffer_read(buff, buffer_u16);
			show_debug_message("cmd find_match firing");
			find_or_add(socket_id,ip,port);
		break;
	}
	
}
