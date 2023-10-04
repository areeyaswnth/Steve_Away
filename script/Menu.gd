extends Node2D
var Tutorial = preload("res://scene/Stage1.tscn").instance()
var Play = preload("res://scene/Stage4.tscn").instance()
var Dev  = preload("res://scene/DevTeam.tscn").instance()
var devbut=false
var Tutorialbut=false
var Playbut=false
func _ready():
	
	pass 
func _process(delta):
	if !$button.is_playing()and Tutorialbut:
		get_tree().current_scene.add_child(Tutorial)
		queue_free()
	if !$button.is_playing()and Playbut:
		get_tree().current_scene.add_child(Play)
		queue_free()
	if !$button.is_playing()and devbut:
		get_tree().current_scene.add_child(Dev)
		queue_free()
	
func _on_Developers_pressed():
	$button.play()
	devbut=true
	pass # Replace with function body.


func _on_Tutorial_pressed():
	$button.play()
	Tutorialbut=true

func _on_Play_pressed():
	$button.play()
	Playbut=true


func _on_code_pressed():
	$button.play()
	OS.shell_open("https://github.com/areeyaswnth/Steve_Away")
