extends Node
var text=''
var run=false
onready var player=$Player
var init_pos
var next=false
var i=0
var TNT=false
var Key=false

enum States {
	STATE_START,
	STATE_STATE1,
	STATE_STATE2,
	STATE_STATE3,
	STATE_STATE4,
	STATE_STATE5,
	STATE_STATE6,
	STATE_STATE7,
	STATE_STATE8,
	STATE_STATE9,
	STATE_STATE10,
	STATE_STATE11,
	STATE_STATE12,
	STATE_STATE13,
	STATE_TRAP,
	STATE_FINAL,
	STATE_KEY,
	STATE_TNT
};
var  dfa=States.STATE_START
var menuclick=false
var nextclick=false
var retry=false
var NextStage = preload("res://scene/Win.tscn").instance()
func _ready():
	init_pos =player.position
func _process(delta):
	$DFA8.getState(dfa)
	if(run):	
		isAccepted(text)
	for child in  get_tree().current_scene.get_children():
			if "Stage" in child.name: child.name="Stage"
	if !$button.is_playing() and retry:
		player.position =init_pos
		text=''
		run=false
		next=false
		i=0
		retry=false
		TNT=false
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
		dfa=States.STATE_STATE2
		i=1
	elif (c=='D'):
		player.Move_Down()
		dfa=States.STATE_TNT
	else:
		dfa=States.STATE_TRAP
		
func state2(c):
	print(2)
	if(c=='R'):
		player.Move_Right()
		dfa=States.STATE_STATE3
		i=2
	elif(c=='D'):
		player.Move_Down()
		dfa=States.STATE_TNT
	else:
		dfa=States.STATE_TRAP

func state3(c):
	print("3")
	if(c=='R'):
		player.Move_Right()
		dfa=States.STATE_STATE4
		i=3
	elif(c=='D'):
		player.Move_Down()
		dfa=States.STATE_TNT
	else:
		dfa=States.STATE_TRAP
		
func state4(c):
	print("4")
	if(c=='R'):
		player.Move_Right()
		dfa=States.STATE_TNT
	elif(c=='D'):
		player.Move_Down()
		dfa=States.STATE_STATE5
		i=4
	else:
		dfa=States.STATE_TRAP
func state5(c):
	print("5")
	if(c=='R'):
		player.Move_Right()
		dfa=States.STATE_STATE6
		i=5
	elif(c=='D'):
		dfa=States.STATE_TNT
		player.Move_Down()
	elif(c=='L'):
		dfa=States.STATE_TNT
		player.Move_Left()
	else:
		dfa=States.STATE_TRAP
func state6(c):
	print("6")
	if(c=='D'):
		player.Move_Down()
		dfa=States.STATE_STATE7
		i=6
	elif(c=='U'):
		dfa=States.STATE_TNT
		player.Move_Up()
	else:
		dfa=States.STATE_TRAP
func state7(c):
	print("7")
	if(c=='D'):
		player.Move_Down()
		dfa=States.STATE_STATE8
		i=7
	elif(c=='L'):
		dfa=States.STATE_TNT
		player.Move_Left()
	else:
		dfa=States.STATE_TRAP
func state8(c):
	print("8")
	if(c=='L'):
		player.Move_Left()
		dfa=States.STATE_STATE9
		i=8
	elif(c=='D'):
		player.Move_Down()
		dfa=States.STATE_TNT
		
	else:
		dfa=States.STATE_TRAP
func state9(c):
	print("9")
	if(c=='D'):
		player.Move_Down()
		dfa=States.STATE_STATE10
		i=9
	elif(c=='U' or c=='L'):
		dfa=States.STATE_TNT
		
	else:
		dfa=States.STATE_TRAP
func state10(c):
	print("10")
	if(c=='L'):
		player.Move_Left()
		dfa=States.STATE_STATE11
		i=10
	elif(c=='R'):
		dfa=States.STATE_TNT
		player.Move_Right()
	else:
		dfa=States.STATE_TRAP
func state11(c):
	print("11")
	if(c=='R'):
		player.Move_Right()
		dfa=States.STATE_TRAP
	elif(c=='L'):
		dfa=States.STATE_STATE12
		player.Move_Left()
		i=11
	elif(c=='D'):
		dfa=States.STATE_TNT
		player.Move_Down()
	else:
		dfa=States.STATE_TRAP
func state12(c):
	print("12")
	if(c=='R'):
		dfa=States.STATE_TRAP
	elif(c=='L'):
		dfa=States.STATE_STATE13
		player.Move_Left()
		i=12
	elif(c=='D'):
		dfa=States.STATE_TNT
		player.Move_Down()
	else:
		dfa=States.STATE_TNT
		player.Move_Up()
func state13(c):
	print("11")
	if(c=='U'):
		dfa=States.STATE_FINAL
		player.Move_Up()
	else: 
		dfa=States.STATE_TRAP
	
func stateKey(c):
	print("key")
	if(c=='R'):
		player.Move_Right()
		dfa=States.STATE_STATE12
		i=11
	elif(c=='L'):
		player.Move_Left()
		dfa=States.STATE_TNT
	else:
		dfa=States.STATE_TRAP
func stateTNT(c):
	dfa=States.STATE_TRAP
	
func state_trap(c):
	if TNT:
		player.TNT()
	else:
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
		elif dfa==States.STATE_STATE2: state2(t[i])
		elif dfa==States.STATE_STATE3: state3(t[i])
		elif dfa==States.STATE_STATE4: state4(t[i])
		elif dfa==States.STATE_STATE5: state5(t[i])
		elif dfa==States.STATE_STATE6: state6(t[i])
		elif dfa==States.STATE_STATE7: state7(t[i])
		elif dfa==States.STATE_STATE8: state8(t[i])
		elif dfa==States.STATE_STATE9: state9(t[i])
		elif dfa==States.STATE_STATE10: state10(t[i])
		elif dfa==States.STATE_STATE11: state11(t[i])
		elif dfa==States.STATE_STATE12: state12(t[i])
		elif dfa==States.STATE_STATE13: state13(t[i])
		elif dfa==States.STATE_TNT: 
			stateTNT(t[i])
			TNT=true
		elif dfa==States.STATE_KEY: stateKey(t[i])
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
	if !run and dfa!=States.STATE_TRAP and  dfa==States.STATE_START:
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
		nextclick=true
func _on_retry_pressed():
	$button.play()
	retry=true

func _on_Home_pressed():
	$button.play()
	menuclick=true
