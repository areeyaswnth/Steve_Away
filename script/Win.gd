extends Node2D
var click=false
func _ready():
	$win.play()
func _process(delta):
	if(!$Button.is_playing() and click):get_tree().reload_current_scene()
		
func _on_Home_pressed():
	$Button.play()
	click=true
	
