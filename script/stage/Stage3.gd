extends Node
var text=''
var run=false
onready var player=$Player
var init_pos
var next=false
var i=0
var st4=false
enum States {
	STATE_START,
	STATE_STATE1,
	STATE_STATE2_1,
	STATE_STATE2_5,
	STATE_STATE3,
	STATE_STATE4_1,
	STATE_STATE4_5
	STATE_STATE5_2,
	STATE_STATE5_4,
	STATE_FINAL,
	STATE_TRAP
};
var NextStage = preload("res://scene/Stage4.tscn").instance()
var menuclick=false
var nextclick=false
var retry=false
var  dfa=States.STATE_START

func _ready():
	init_pos =player.position
	
func _process(delta):
	$DFA3.getState(dfa)
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
	dfa=States.STATE_STATE1
		
func state1(c):
	print(1)
	if(c=='R'):
		player.Move_Right()
		dfa=States.STATE_STATE2_1
		i=1
	elif(c=='D'):
		player.Move_Down()
		i=3
		dfa=States.STATE_STATE4_1
		
	else:
		dfa=States.STATE_TRAP
		
func state2_1(c):
	print(21)
	if(c=='R'):
		player.Move_Right()
		dfa=States.STATE_STATE3
		i=2
	elif(c=='D'):
		player.Move_Down()
		i=4
		dfa=States.STATE_STATE5_2
	else:
		dfa=States.STATE_TRAP
		
func state2_5(c):
	print(25)
	if(c=='R'):
		player.Move_Right()
		dfa=States.STATE_STATE3
		i=2
	else:
		dfa=States.STATE_TRAP
		
func state3(c):
	
	if(c=='D'):
		print(3)
		player.Move_Down()
		dfa=States.STATE_FINAL
		i=5
	else:
		dfa=States.STATE_TRAP
func state4_1(c):
	print(41)
	if(c=='R'):
		player.Move_Right()
		dfa=States.STATE_STATE5_4
		i=4
	else:
		dfa=States.STATE_TRAP
func state4_5(c):
	print(45)
	dfa=States.STATE_TRAP
func state5_2(c):
	print(52)
	if(c=='R'):
		player.Move_Right()
		dfa=States.STATE_FINAL
		i=5
	elif(c=='L'):
		player.Move_Left()
		i=3
		dfa=States.STATE_STATE4_5
	else:
		dfa=States.STATE_TRAP
func state5_4(c):
	print(54)
	if(c=='R'):
		player.Move_Right()
		dfa=States.STATE_FINAL
		i=5
	elif(c=='U'):
		player.Move_Up()
		i=1
		dfa=States.STATE_STATE2_5
	else:
		dfa=States.STATE_TRAP
func state_trap(c):
	
	if c=='R': player.Move_Right()
	elif c=='L':player.Move_Left()
	elif c=='D':player.Move_Down()
	elif c=='U':player.Move_Up()	
	player.trap()
func isAccepted(t):
	var n=len(t)
	if(player.timer.is_stopped() and i <= n):
		if dfa==States.STATE_START: start(t[i])
		elif dfa==States.STATE_STATE1: state1(t[i])
		elif dfa==States.STATE_STATE2_1: state2_1(t[i])
		elif dfa==States.STATE_STATE2_5: state2_5(t[i])
		elif dfa==States.STATE_STATE3: state3(t[i])
		elif dfa==States.STATE_STATE4_1: 
			st4=true
			state4_1(t[i])
		elif dfa==States.STATE_STATE4_5: state4_5(t[i])
		elif dfa==States.STATE_STATE5_2: state5_2(t[i])
		elif dfa==States.STATE_STATE5_4: state5_4(t[i])
		elif dfa==States.STATE_TRAP: 
			state_trap(t[i])
			run=false
			return 0;
		elif (dfa == States.STATE_FINAL):
			print('f')
			next=true
			run=false
			$Final.final()
			player.final()
			return 1;
		else:
			return 0;
		player.timer.start(0.75)
	
func _on_Run_pressed():
	$button.play()
	if !run and dfa==States.STATE_START and  dfa==States.STATE_START:
		run=true
		text=""
		i=0
		dfa=States.STATE_START
		var children = get_tree().current_scene.get_node("Stage").get_node("Box_stage").get_children()
		for child in children:
			text+=child.get_text()
		print(",",text,".")
		player.Move_Right()
		





func _on_Next_pressed():
	$button.play()
	if next:
		menuclick=true

func _on_retry_pressed():
	$button.play()
	retry=true
func _on_Home_pressed():
	$button.play()
	menuclick=true
