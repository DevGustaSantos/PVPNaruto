extends KinematicBody2D

#---- INICIO VARIAVEIS ----#
#Controle para movimentação.
var movimento = Vector2.ZERO
export var veloc_mov = 480
export var forca_pulo = -720
#------ FIM VARIAVEIS ------#

#---- INICIO FUNÇÕES ----#
func _movimento_personagem():
	#Realizar o movimento para esquerda(-x) e para a direita(+x)
	var move_direcoes = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	movimento.x = veloc_mov * move_direcoes
	move_and_slide(movimento)
func _physics_process(delta) -> void:
	_movimento_personagem()
#------ FIM FUNÇÕES ------#
