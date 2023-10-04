extends Node2D

onready var bg=$Sky
var speed = 1000
func _ready():
	pass 
func _physics_process(delta):
	bg.position.x -= 100 * delta
	if bg.position.x <= -2568:
		bg.position.x = 0
