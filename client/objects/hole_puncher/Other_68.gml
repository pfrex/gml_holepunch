/// @description Insert description here
// You can write your code in this editor


//Get the port and ip of the client, so we can reply
remote_port = async_load[? "port"];
remote_ip = string(async_load[? "ip"]);
n_id = async_load[? "id"];

// get the buffer so we can process it
buffer = async_load[? "buffer"];
buffer_seek(buffer, buffer_seek_start,0);


var cmd = buffer_read(buffer, buffer_u8);

if(cmd == ACKED){
	room_goto(handshaked);
}


if(remote_ip != global.my_ip){
	buffer_seek(buff, buffer_seek_start,0);
	buffer_write(buff, buffer_u8,ACKED);

	network_send_udp(global.socket,global.matched_ip,global.matched_port,buff,buffer_tell(buff));

	buffer_delete(buff);
}



