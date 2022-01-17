/// @description Insert description here
// You can write your code in this editor


var eventid = ds_map_find_value(async_load, "id");


var type = ds_map_find_value(async_load, "type");

	
if (type == network_type_non_blocking_connect){
	var succeeded = ds_map_find_value(async_load, "succeeded");
	
	if succeeded{
		show_debug_message("connected to match maker");
	}
	
	exit;
}



 
if( tcp_socket == eventid ){

	show_debug_message("data from server in");
	
	

	var buff = ds_map_find_value(async_load, "buffer");
	var cmd = buffer_read(buff, buffer_u8);

	switch(cmd){
		case receiving_matched_players_data:
			global.matched_port = buffer_read(buff, buffer_u16);
			global.matched_ip = buffer_read(buff, buffer_string);
			
			// disconnect from matchmaking server here? 
			network_destroy(tcp_socket);
			
			room_goto(holepunch_room);
		break;
		
	}
	
	
	


}





