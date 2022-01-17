/// @description Insert description here
// You can write your code in this editor



#macro find_match 4
#macro receiving_matched_players_data 10

var ip_address = "127.0.0.1";// your public servers ip
var port = 3005;// the port your server is listening on

tcp_socket = network_create_socket(network_socket_tcp);
var succeeded = network_connect(tcp_socket , ip_address, port);
if succeeded < 0{
    show_debug_message("we did not connect");
}
else{
    show_debug_message("we connected with tcp");
}


// this instances buffers
buff = buffer_create(256, buffer_grow, 1);

