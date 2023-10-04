extends Area2D

var right_preload=preload("res://scene/Box/Right.tscn")
var entered=false

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == BUTTON_LEFT and entered:
			get_tree().current_scene.get_node("Stage").get_node("Box").add_child(right_preload.instance())
			$sound.play()


func _on_Right_Button_mouse_entered():
	entered=true
	

func _on_Right_Button_mouse_exited():
	entered=false
