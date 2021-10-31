extends Control
var Registerlink = "www.facebook.com"
var CreditsLink = "http://www.republiquedesmangues.fr"
var JoinLink = "http://www.omfgdogs.com"
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


func _on_RegisterButton_mouse_entered():
	$RegisterButton/AnimatedRegister.playing = true


func _on_RegisterButton_mouse_exited():
	$RegisterButton/AnimatedRegister.playing = false


func _on_RegisterButton_pressed():
	OS.shell_open(Registerlink)


func _on_CreditsButton_pressed():
	OS.shell_open(CreditsLink)


func _on_Join_pressed():
	OS.shell_open(JoinLink)
