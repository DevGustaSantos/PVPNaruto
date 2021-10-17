extends Node2D

func _ready():
	get_tree().connect("network_peer_connected",self,"_player_connected")

#Inicia quando o botão host for precionado
#o host fica como servidor
func _on_ButtonHost_pressed():
	var net = NetworkedMultiplayerENet.new()
	#Parâmetros (porta, max_players)
	net.create_server(6969, 2)
	get_tree().set_network_peer(net)
	print("hosting")

#Inicia quando o botão host for precionado
#Se conecta ao host(Servidor).
func _on_ButtonJoin_pressed():
	var net = NetworkedMultiplayerENet.new()
	net.create_client("127.0.0.1", 6969)
	get_tree().set_network_peer(net)

#Verifica se os players foram conectados
func _player_connected(id):
	Global.player2_id = id
	var game = preload("res://Cenas/cenarioTeste.tscn").instance()
	get_tree().get_root().add_child(game)
	hide()
