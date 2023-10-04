extends Area2D

var left_preload=preload("res://scene/Box/Left.tscn")
var entered=false

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == BUTTON_LEFT and entered:
			get_tree().current_scene.get_node("Stage").get_node("Box").add_child(left_preload.instance())
			$sound.play()

func _on_Left_button_mouse_entered():
	entered=true


func _on_Left_button_mouse_exited():
	entered=false
