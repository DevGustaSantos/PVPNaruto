extends PersonagemGenerico


func _physics_process(delta):
	
	if is_on_floor() && int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")):
		$Anima.play("correndo")
		
	elif not $Anima.current_animation == "pulando" && is_on_floor():
		$Anima.play("parado")
	
	if is_on_floor() && Input.is_action_just_pressed("ui_up"):
		$Anima.play("pulando")
		
	elif not is_on_floor() && not $Anima.current_animation == "pulando":
		$Anima.play("caindo")
	
	
	
	


func _on_Anima_animation_finished(anim_name):

	if(anim_name == "pulando" && not is_on_floor()):
		$Anima.play("caindo")
	pass # Replace with function body.
