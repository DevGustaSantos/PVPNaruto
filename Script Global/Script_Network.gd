extends Node

const DEFAULT_IP = "127.0.0.1"
const DEFAULT_PORT = 31400
const MAX_PLAYERS = 8

var players = {}
var self_data = {name = '', position = Vector2(368,100)}

func create_server(player_nickname):
	self_data.name = player_nickname
	players[1] = self_data
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(DEFAULT_PORT, MAX_PLAYERS)
	get_tree().set_network_peer(peer)

func connect_to_server(player_nickname):
	self_data.name = player_nickname
	get_tree().connect("connected_to_server", self, "_connected_to_server")
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(DEFAULT_IP, DEFAULT_PORT)
	get_tree().set_network_peer(peer)

func _connect_to_server():
	players[get_tree().get_network_unique_id()] = self_data
	rpc('_send_payer_info', get_tree().get_network_unique_id(), self_data)

remote func _send_payer_info(id, info):
	if get_tree().is_network_server():
		for peer_id in players:
			rpc_id(id,'_send_payer_info', peer_id, players[peer_id])
	players[id] = info
