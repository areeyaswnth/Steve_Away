extends Area2D
class_name Box
var text=' '
var checkbox=true
var box=null
var mouse=false
var drop=false
func set_text(t):
	text=t
func get_text():
	return text
func _process(delta):
	if box !=null:
		if !box.click:
			box.position=position
			if box is Down:set_text('D')
			if box is Right:set_text('R')
			if box is Up:set_text('U')
			if box is Left:set_text('L')
			if !drop: 
				$Drop.play()
				drop=true
			checkbox=false
	
		
func reset():
	text=' '
	checkbox=true
	box=null
	mouse=false
	drop=false
func _on_Box_area_entered(area):
	if (area is Right or area is Left or area is Down or area is Up )and checkbox :
		box=area
		box.area_entered =true
		


func _on_Box_area_exited(area):
	if (area is Right or area is Left or area is Down or area is Up )and !checkbox and box==area:
		box.area_entered =false
		set_text(' ')
		box=null
		drop=false
		checkbox=true
		
	elif (area is Right or area is Left or area is Down or area is Up ):
		box=null
	else:
		if box!=null:
			box.area_entered=false
			set_text(' ')


func _on_Box_mouse_entered():
	mouse=true


func _on_Box_mouse_exited():
	mouse=false
