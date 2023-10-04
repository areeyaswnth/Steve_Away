extends Area2D
class_name Up
var click = true
var player=null
var mouse=false
var area_entered=false

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and click :
		position = get_global_mouse_position()
	else: 
		click = false
	if !click and !area_entered:
		queue_free()
	if Input.is_mouse_button_pressed(BUTTON_RIGHT) and mouse:
		queue_free()
func _on_Up_body_entered(body):
	if body is Player :
		player=body

func _on_Up_body_exited(body):
	if body is Player:
		player =null


func _on_Up_mouse_entered():
	mouse=true


func _on_Up_mouse_exited():
	mouse=false


