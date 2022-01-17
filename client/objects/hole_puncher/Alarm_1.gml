/// @description Insert description here
// You can write your code in this editor



// this is sending out non-reliable datagrams
alarm[1] = 30;

buffer_seek(buff, buffer_seek_start,0);
buffer_write(buff, buffer_u8,1);

network_send_udp(global.socket,global.matched_ip,global.matched_port,buff,buffer_tell(buff));



