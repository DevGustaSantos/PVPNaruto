extends PersonagemGenerico

var run = false
var ataque = false
var ataque_clone = preload("res://Cenas/Personagens/Naruto/Ataque_clone.tscn")
var shuriken = preload("res://Cenas/Ataques_e_habilidades/Shuriken.tscn")
var qtd_socos = 0
var socos = false
var combos = false


func _ready():
	self.Velocidade_de_movimento = 200 
	run = false
	ataque = false
	socos = false
	combos = false
	

func _combos():
	for i in range(3):
		
		pass
	


func _animacoes_basicas(delta):
	
#	print(self.Velocidade_de_movimento)
	if (not ataque):
	#	-----Controle de correr, andar e parar-----
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
			
	#	-----Controle de cair e pular-----
		if is_on_floor() && Input.is_action_just_pressed("ui_up"):
			$Anima.play("pulando")
			
		elif not is_on_floor() && not $Anima.current_animation == "pulando" or not $Anima.current_animation == "parado" :
			$Anima.play("caindo")
			
#			-----Jutsu clone-----
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
			
		elif Input.is_action_just_pressed("shuriken"):
			$Anima.play("atk_shuriken")
			self.Velocidade_de_movimento = 0
			ataque = true
			
			var atk_shuriken = shuriken.instance()
			atk_shuriken.global_position = $Shuriken_eClone.global_position
			atk_shuriken.z_index = -1
			if(self.Controle_do_giro == false):
				atk_shuriken.scale.x = -1
			get_tree().root.add_child(atk_shuriken)
			
#			-----Quebra defesa-----
		elif Input.is_action_just_pressed("quebra_defesa"):
			$Anima.play("quebra_defesa")
			ataque = true
			
#			-----Inicio dos combos-----
		elif Input.is_action_just_pressed("combo") and is_on_floor():
			self.Velocidade_de_movimento = 0
			$Anima.play("soco")
			ataque = true
			
	
	else:
		
		if Input.is_action_just_pressed("combo") and is_on_floor():
				self.Velocidade_de_movimento = 0
				$Anima.play("cabecada")
				combos = true
				
#		if(combos):
#	#		Sistemas de combos
#			if Input.is_action_just_pressed("combo") and is_on_floor() and not $Anima.current_animation == "cabecada":
#				self.Velocidade_de_movimento = 0
#				$Anima.play("socao")
				
		else:
			
			pass

#	elif(socos):
#		if Input.is_action_just_pressed("combo") and is_on_floor():
#			self.Velocidade_de_movimento = 0
#			$Anima.play("socao")
#			pass
	
func _physics_process(delta):
	_animacoes_basicas(delta)
	_combos()
	pass
	

func _on_Anima_animation_finished(anim_name):
	
# Controlando a animação de cair após o pulo
	if(anim_name == "pulando" && not is_on_floor()):
		$Anima.play("caindo")
		
# Controlando a animação de atacar
	if (anim_name == "jutsu_clone" or anim_name == "fumaca" or anim_name == "quebra_defesa"
	or anim_name == "soco" or anim_name == "cabecada" or anim_name == "atk_shuriken"):
		$fum.visible = false
		self.Velocidade_de_movimento = 200
		ataque = false
		
#	if(anim_name == "socao"):
#		$fum.visible = false
#		self.Velocidade_de_movimento = 200
#		ataque = false
#		combos = false
		
# Controlando o combo
#	if(anim_name == "soco" or anim_name == "cabecada" ):
#		self.Velocidade_de_movimento = 200
#		qtd_socos = 0
#		ataque = false
		
#	if (anim_name == "socao"):
#		ataque = false
#		socos = false
		pass

# ADICIONAR CADA ATAQUE (NOME) DOS OUTROS PERSONAGENS
func _on_Recebe_dano_area_entered(area):
	
#	
	if (area.name == "Shuriken"):
		pass
	if (area.name == "Quebra_def"):
		pass
	if (area.name == "Clone"):
		pass
	pass # Replace with function body.


