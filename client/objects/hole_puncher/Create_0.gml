/// @description Insert description here
// You can write your code in this editor


#macro ACKED 30


buff = buffer_create(256, buffer_grow, 1);


// punch a hole in my nat 
alarm[0] = 30; 

// send pings to matched player
alarm[1] = 30;



peers_array = [];

function create_peer(_port,_ip){
   var inst = instance_create_depth(x,y,-1000,peer);
   
   inst.port = 6510;
   inst.reliable_port = 6511;
   inst.ip = _ip;
   
   return inst;
}





function send_to_peers(buffer){
	var i = 0;
	repeat(array_length(peers_array)){
		network_send_udp(socket,peers_array[i].ip,peers_array[i].port,buffer,buffer_tell(buffer));
		++i;
	}
}


function send_to_peers_reliable(buffer){
	var i = 0;
	repeat(array_length(peers_array)){
		network_send_udp(socket_reliable,peers_array[i].ip,peers_array[i].reliable_port,buffer,buffer_tell(buffer));
		++i;
	}
}




