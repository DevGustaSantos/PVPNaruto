extends KinematicBody2D
class_name PersonagemGenerico

#---- VARIAVEIS ----#
var Movimento = Vector2.ZERO
export var Velocidade_de_movimento = 480
export var Forca_do_pulo = -720
var gravidade = Global.Gravidade


#---- FUNÇÕES ----#
func _movimento_do_personagem():
	#Movimentação esquerda e direita do personagem.
	var mover_direcoes = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	Movimento.x = Velocidade_de_movimento * mover_direcoes
	move_and_slide(Movimento)
	
func _physics_process(delta):
	_movimento_do_personagem()
