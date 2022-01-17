/// @description Insert description here
// You can write your code in this editor



buffer_seek(buff, buffer_seek_start, 0);
buffer_write(buff, buffer_u8, find_match);// find_match == 1
buffer_write(buff, buffer_string, global.my_ip);// find_match == 1
buffer_write(buff, buffer_u16, global.my_port);// find_match == 1

// Send this to the server
network_send_packet(tcp_socket, buff, buffer_tell(buff));


buffer_delete(buff);
buff = -1;

