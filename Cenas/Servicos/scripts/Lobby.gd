extends Node2D

func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("_player_connected", self, "iniciar_game")
	pass

func _on_CriarPartida_pressed():
	var port = int( $Label_Porta/campo_porta.text)
	Network.criar_server(port)
	pass # Replace with function body.

func _player_connected(id):
	rpc_id(id, "register_player", $Label_nickname/campo_Apelido.text)

func _on_Entrar_pressed():
	var ip = $Label_IP/campo_ip.text
	var port = int( $Label_Porta/campo_porta.text)
	Network.criar_cliente(ip, port)
	pass # Replace with function body.


func iniciar_game():
	var game = preload("res://Cenas/Cenario/Cenario.tscn")
	get_tree().change_scene(game)


remote func register_player(info):
	var id = get_tree().get_rpc_sender_id()
	Network.players[id] = info
