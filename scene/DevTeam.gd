extends Node2D

var Tutorial = preload("res://scene/Stage1.tscn").instance()
var Play = preload("res://scene/Stage4.tscn").instance()
var devbut=false
var Tutorialbut=false
var Playbut=false
var menuclick=false
func _process(delta):
	if !$button.is_playing() and menuclick:
		get_tree().reload_current_scene()
		queue_free()




func _on_Home_pressed():
		$button.play()
		menuclick=true

