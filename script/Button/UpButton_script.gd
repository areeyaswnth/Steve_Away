extends Area2D
var up_preload=preload("res://scene/Box/Up.tscn")
var entered=false

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == BUTTON_LEFT and entered:
			get_tree().current_scene.get_node("Stage").get_node("Box").add_child(up_preload.instance())
			$sound.play()

func _on_Up_button_mouse_entered():
	entered=true


func _on_Up_button_mouse_exited():
	entered=false
