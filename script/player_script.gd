extends KinematicBody2D
class_name Player
onready var timer = $Timer
onready var Animated_timer = $Animated_time
onready var sprite=$Sprite
var velocity = Vector2()
var direction : Vector2
const SPEED = 9000
const FRICTION = 0.9
var has_moved_right = false  

func _ready():
	pass 

func _physics_process(delta):
	var input_vector = Vector2()
	input_vector = input_vector.normalized()
	velocity = velocity.linear_interpolate(input_vector * SPEED, 0.1)
	velocity = move_and_slide(velocity)
	velocity *= FRICTION
	
	

func Move_Right():
	if(timer.is_stopped()):
		$sound.play()
		sprite.play("Right")
		var input_vector = Vector2()
		input_vector.x += 1
		input_vector = input_vector.normalized()
		velocity = velocity.linear_interpolate(input_vector * (SPEED), 0.1)
		velocity = move_and_slide(velocity)
		velocity *= FRICTION
		timer.start(1)

func Move_Left():
	if(timer.is_stopped()):
		$sound.play()
		sprite.play("Left")
		var input_vector = Vector2()
		input_vector.x -= 1
		input_vector = input_vector.normalized()
		velocity = velocity.linear_interpolate(input_vector * (SPEED), 0.1)
		velocity = move_and_slide(velocity)
		velocity *= FRICTION
		timer.start(1)
func Move_Down():
	if(timer.is_stopped()):
		$sound.play()
		sprite.play("Down")
		var input_vector = Vector2()
		input_vector.y += 1
		input_vector = input_vector.normalized()
		velocity = velocity.linear_interpolate(input_vector * (SPEED), 0.1)
		velocity = move_and_slide(velocity)
		velocity *= FRICTION
		timer.start(1)
func Move_Up():
	if(timer.is_stopped()):
		$sound.play()
		sprite.play("Up")
		var input_vector = Vector2()
		input_vector.y -= 1
		input_vector = input_vector.normalized()
		velocity = velocity.linear_interpolate(input_vector * (SPEED), 0.1)
		velocity = move_and_slide(velocity)
		velocity *= FRICTION
		timer.start(1)
func final():
	$Final2.play()
	sprite.play("Final")
func trap():
	$oo.play()
	sprite.play(("Trap"))
func left():
	sprite.play("Left")
func TNT():
	$oo.play()
	sprite.play("TNT")
