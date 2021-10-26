extends Area2D


var mov = Vector2 (200, 0)
func _ready():
	$Anima.play("clone_voando")

func _process(delta):
	
	translate(mov * delta)
	pass

# PRECISO DE AJUDA NESSA PARTE PARA ACERTAR O INIMIGO
func _on_Clone_body_entered(body):
	if(body):
		mov.x = 0
		$Timer.queue_free()
		$Clone_corpo.queue_free()
		$Anima.play("ataque_clone")
	pass
	



func _on_Anima_animation_finished(anim_name):
	
	if anim_name == "ataque_clone":
		mov.x = 0
		$Anima.play("fumaca")
		
	if anim_name == "fumaca":
		queue_free()
	pass # Replace with function body.





func _on_Timer_timeout():
	mov.x = 0
	$Anima.play("ataque_clone")
	$Clone_corpo.queue_free()
	
#	$".".queue_free()
#	queue_free()
	pass # Replace with function body.
