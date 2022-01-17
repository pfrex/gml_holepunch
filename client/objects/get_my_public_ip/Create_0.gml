/// @description Insert description here
// You can write your code in this editor


global.socket = network_create_socket(network_socket_udp);

buff = buffer_create(256, buffer_grow, 1);


//var url = network_resolve("your domain would go here otherwise just use hardcoded ip");
//host_ip = url;
var server_location = "the publicly available server ip goes here";
server_location = "127.0.0.1";
host_ip = server_location;
host_port = 4510;// the port your service is listening on  

// send a 1 to the server and figure out what our public ip is could be any value it's just a ping really
buffer_seek(buff, buffer_seek_start,0);
buffer_write(buff, buffer_u8,1);
network_send_udp(global.socket,host_ip,host_port,buff,buffer_tell(buff));



// refire in case the packet got dropped
alarm[0] = 30;
