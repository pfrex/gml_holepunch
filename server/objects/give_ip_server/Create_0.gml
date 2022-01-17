/// @description Insert description here
// You can write your code in this editor




// socket open on port 4510
socket = network_create_socket_ext(network_socket_udp,4510);


buffer = buffer_create(256, buffer_grow, 1);


