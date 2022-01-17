/// @description Insert description here
// You can write your code in this editor


// refire in case this packet gets dropped
alarm[0] = 30;



// send a 1 to the server and figure out what our public ip is could be any value it's just a ping really
buffer_seek(buff, buffer_seek_start,0);
buffer_write(buff, buffer_u8,1);
network_send_udp(global.socket,host_ip,host_port,buff,buffer_tell(buff));


