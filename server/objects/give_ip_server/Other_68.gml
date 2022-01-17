/// @description Insert description here
// You can write your code in this editor

var remote_port = async_load[? "port"];
var remote_ip = string(async_load[? "ip"]);
var n_id = async_load[? "id"];


show_debug_message(remote_port);
show_debug_message(remote_ip);

if(n_id == socket){
	show_debug_message("n_id is my sockets id")
	
	// the below line is a bit unneccesary the remote_ip is the "connecting" clients_ip
	var clients_ip = remote_ip;
	
	buffer_write(buffer, buffer_string, clients_ip);
	buffer_write(buffer, buffer_u16, remote_port);
	
	// let the client know what their IP is, by sending it to them
	network_send_udp(socket,remote_ip,remote_port,buffer,buffer_tell(buffer));
}


