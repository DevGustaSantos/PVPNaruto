extends Node2D

const cenaPlayer = "res://Cenas/Personagens/Naruto/Naruto_personagem.tscn"

onready var player1pos = $Player1Pos
onready var player2pos = $Player2Pos

func _ready():
	#CONFIGURAÇÕES PLAYER 1
	var player1 = preload(cenaPlayer).instance()
	player1.set_name(str(get_tree().get_network_unique_id()))
	player1.set_network_master(get_tree().get_network_unique_id())
	player1.global_transform = player1pos.global_transform
	add_child(player1)
	
	#CONFIGURAÇÕES PLAYER 2
	var player2 = preload(cenaPlayer).instance()
	player2.set_name(str(Global.player2_id))
	player2.set_network_master(Global.player2_id)
	player2.global_transform = player2pos.global_transform
	add_child(player2)
