extends Area2D
var down_preload=preload("res://scene/Box/Down.tscn")
var entered=false

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == BUTTON_LEFT and entered:
			$sound.play()
			get_tree().current_scene.get_node("Stage").get_node("Box").add_child(down_preload.instance())
			$sound.play()
			

func _on_Down_Button_mouse_entered():
	entered=true

func _on_Down_Button_mouse_exited():
	entered=false
