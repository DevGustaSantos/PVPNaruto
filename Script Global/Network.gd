extends Node

var players = {}

func criar_server(port):
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(int(port), 4)
	get_tree().network_peer = peer

func criar_cliente(ip,port):
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(ip,int(port))
	get_tree().network_peer = peer
