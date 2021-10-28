extends Control

var player_name = ""


func _on_create_pressed():
	player_name = $nickname.text
	if player_name == "":
		return

	Network.create_server(player_name)
	_load_game()

func _on_join_pressed():
	player_name = $nickname.text
	if player_name == "":
		return

	Network.connect_to_server(player_name)
	_load_game()

func _load_game():
	get_tree().change_scene("res://Cenas/cenarioTeste.tscn")
