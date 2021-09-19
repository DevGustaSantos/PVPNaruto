extends PersonagemGenerico

var run = false
var ataque = false
var ataque_clone = preload("res://Cenas/Personagens/Naruto/Ataque_clone.tscn")


func _ready():
	self.Velocidade_de_movimento = 200 
	run = false
	ataque = false
	
func _animacoes_basicas(delta):
	
#	print(self.Velocidade_de_movimento)
	if (not ataque):
		
	#	Controle de correr, andar e parar
		if(Input.is_action_pressed("correr")):
			run = true
		else: 
			run = false
			
		if is_on_floor() && self.Movimento.x:
			if(run):
				self.Velocidade_de_movimento = 480 
				$Anima.play("correndo")
			else:
				self.Velocidade_de_movimento = 200 
				$Anima.play("andando")
				
		elif not $Anima.current_animation == "pulando" && is_on_floor():
			$Anima.play("parado")
			
	#	Controle de cair e pular
		if is_on_floor() && Input.is_action_just_pressed("ui_up"):
			$Anima.play("pulando")
			
		elif not is_on_floor() && not $Anima.current_animation == "pulando":
			$Anima.play("caindo")
			
#			Habilidades e Especiais
		if Input.is_action_just_pressed("jutsu_clone"):
			$fum.visible = true
			$Anima.play("jutsu_clone")
			$fumaca.play("fumaca")
			self.Velocidade_de_movimento = 0
			ataque = true
			
			var clone = ataque_clone.instance()
			clone.global_position = $Shuriken_eClone.global_position
			clone.z_index = -1
			if(self.Controle_do_giro == false):
				clone.scale.x = -1
			get_tree().root.add_child(clone)
	else:
		
			pass
	
func _physics_process(delta):
	_animacoes_basicas(delta)
	pass
	

func _on_Anima_animation_finished(anim_name):
	
# Controlando a animação de cair após o pulo
	if(anim_name == "pulando" && not is_on_floor()):
		$Anima.play("caindo")
		
# Controlando a animação de atacar
	if anim_name == "jutsu_clone" || anim_name == "fumaca":
		$fum.visible = false
		self.Velocidade_de_movimento = 200
		ataque = false

