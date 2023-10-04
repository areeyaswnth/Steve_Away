extends Area2D
class_name Final
func final():
	$Sprite.play("Final")
func default():
	$Sprite.play("default")
func fake():
	$ho.play()
	$Sprite.play("NotKey")
