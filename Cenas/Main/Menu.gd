extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$BackGroundMain.playing = true


func _process(delta):
	if($MainThemeMusic.playing == false):
		$MainThemeMusic.playing = true






func _on_CreditsButton_mouse_entered():
	$CreditsButton/AnimatedSprite.playing = true

func _on_CreditsButton_mouse_exited():
	$CreditsButton/AnimatedSprite.playing = false
