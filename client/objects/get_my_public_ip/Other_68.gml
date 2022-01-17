/// @description Insert description here
// You can write your code in this editor


var remote_port = async_load[? "port"];
var remote_ip = string(async_load[? "ip"]);
var n_id = async_load[? "id"];


show_debug_message(remote_port);
show_debug_message(remote_ip);

if(n_id == global.socket){
	show_debug_message("n_id is my sockets id")
}

var buffer = async_load[? "buffer"];
buffer_seek(buffer, buffer_seek_start,0);



var my_ip = buffer_read(buffer, buffer_string);
var my_port = buffer_read(buffer, buffer_u16);

global.my_ip = my_ip;
global.my_port = my_port;
//show_message(my_ip);
//show_message(my_port); I shouldn't need port right? The application will run on known ports  


// store the ip and then destroy this object use it to send stuff to the http matchmaker and facilitate hole punching 
//network_destroy(socket);

// keeping the socket for this example
buffer_delete(buff);
instance_destroy();


room_goto(matchmake_room);


