extends Area2D
class_name Left
var player=null
var click =true
var mouse=false
var area_entered=false
var box=null
func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and click :
		position = get_global_mouse_position()
	else: 
		click = false
	if !click and !area_entered:
		queue_free()
	if Input.is_mouse_button_pressed(BUTTON_RIGHT) and mouse:
		queue_free()
	
func _on_Area2D_body_entered(body):	
	if body is Player :
		player=body

func _on_Left_body_exited(body):
	if body is Player:
		player =null


func _on_Left_mouse_entered():
	mouse=true


func _on_Left_mouse_exited():
	mouse=false

