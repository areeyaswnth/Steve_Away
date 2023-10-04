extends Node
var text=''
var run=false
onready var player=$Player
var init_pos
var next=false
onready var final=$Final
var i=0
var retry=false
enum States {
	STATE_START,
	STATE_STATE1,
	STATE_STATE2,
	STATE_STATE3,
	STATE_FINAL,
	STATE_TRAP
};
var NextStage = preload("res://scene/Stage2.tscn").instance()
var menuclick=false
var nextclick=false
var  dfa=States.STATE_START
func _ready():
	init_pos =player.position
	
func _process(delta):
	$DFA1.getState(dfa)
	for child in  get_tree().current_scene.get_children():
			if "Stage" in child.name: child.name="Stage"
	if(run):	
		isAccepted(text)
	if !$button.is_playing() and retry:
		player.position =init_pos
		text=''
		run=false
		next=false
		i=0
		retry=false
		dfa=States.STATE_START
		$Final.default()
		$Player/Sprite.play("Right")
		
		for child in  get_tree().current_scene.get_children():
			if "Stage" in child.name: child.name="Stage"
		var children = get_tree().current_scene.get_node("Stage").get_node("Box").get_children()
		for child in children:
			child.queue_free()
		var children2 = get_tree().current_scene.get_node("Stage").get_node("Box_stage").get_children()
		for child in children2:
			child.reset()
	if !$button.is_playing() and menuclick:
		get_tree().reload_current_scene()
	if !$button.is_playing() and nextclick:
		get_tree().current_scene.add_child(NextStage)
		queue_free()
		

func start(c):
	print(1)
	dfa=States.STATE_STATE1
	i=0
	
func state1(c):
	print(2)
	if(c=='R'):
		player.Move_Right()
		dfa=States.STATE_STATE2
		i=1
	else:
		dfa=States.STATE_TRAP
func state2(c):
	print(3)
	if(c=='R'):
		player.Move_Right()
		dfa=States.STATE_STATE3
		i=2
	else:
		dfa=States.STATE_TRAP
func state3(c):
	print(3)
	if(c=='R'):
		player.Move_Right()
		dfa=States.STATE_FINAL
	else:
		dfa=States.STATE_TRAP
func state_trap(c):
	i=4
	if c=='R': player.Move_Right()
	elif c=='L':player.Move_Left()
	elif c=='D':player.Move_Down()
	elif c=='U':player.Move_Up()	
	player.trap()
func isAccepted(t):
	var n=len(t)
	if(player.timer.is_stopped() and i <= n):
		if dfa==States.STATE_START: 
			start(t[i])
			
		elif dfa==States.STATE_STATE1: state1(t[i])
		elif dfa==States.STATE_STATE2: state2(t[i])
		elif dfa==States.STATE_STATE3: state3(t[i])
		elif dfa==States.STATE_TRAP: 
			state_trap(t[i])
			run=false
		elif (dfa == States.STATE_FINAL):
			$Final.final()
			player.final()
			print(4)
			next=true
			run=false
			
			return 1;
		else:
			return 0;
		player.timer.start(0.75)
		
	
func _on_Run_pressed():
	$button.play()
	if !run and  dfa==States.STATE_START:
		i=0
		run=true
		text=""
		dfa=States.STATE_START
		var children = get_tree().current_scene.get_node("Stage").get_node("Box_stage").get_children()
		for child in children:
			text+=child.get_text()
		player.Move_Right()
		

func _on_Next_pressed():
	$button.play()
	if next:
		nextclick=true


func _on_Home_pressed():
	$button.play()
	menuclick=true

func _on_retry_pressed():
	$button.play()
	retry=true
	

