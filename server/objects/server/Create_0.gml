/// @description Insert description here
// You can write your code in this editor



#macro find_match 4
#macro sending_matched_players_data 10
// on client #macro receiving_matched_players_data 10


// only use lists and structs in GameMaker deprecate the use of the built in ds stuff?



server_socket = network_create_server(network_socket_tcp, 3005, 32);
if (server_socket < 0){
    show_debug_message("Server not started");
}
	
	
// this instances buffer
buff = buffer_create(256, buffer_grow, 1);


connected_peers_map = ds_map_create();


match_wait_list = [];

function find_or_add(socket_id,ip,port){
	
	// store the players info
	var inst = instance_create_depth(x,y,-1000,player);
	player.socket = socket_id;
	player.ip = ip;
	player.port = port;
	
	show_debug_message(match_wait_list);
	var my_match = array_pop(match_wait_list);
	show_debug_message(my_match);
	if (my_match == undefined){
		
		array_push(match_wait_list, inst);
		show_debug_message("pushing match_wait_list");
	}
	else{
		
		// exchange port info and public ip's here
		// inst and my_match are instances of the player object and store 3 properties socket ip and port
		/*
		inst
		my_match
		*/
		
		// send to inst
		buffer_seek(buff, buffer_seek_start, 0);
		buffer_write(buff, buffer_u8, sending_matched_players_data);
		buffer_write(buff, buffer_string, my_match.ip);
		buffer_write(buff, buffer_u16, my_match.port);
		
		network_send_packet(inst.socket, buff, buffer_tell(buff));
		
		
		// send to inst
		buffer_seek(buff, buffer_seek_start, 0);
		buffer_write(buff, buffer_u8, sending_matched_players_data);
		buffer_write(buff, buffer_string, inst.ip);
		buffer_write(buff, buffer_u16, inst.port);
		
		network_send_packet(my_match.socket, buff, buffer_tell(buff));
		
	}
	
}

