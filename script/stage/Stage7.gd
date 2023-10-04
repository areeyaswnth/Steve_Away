extends Node
var text=''
var run=false
onready var player=$Player
var init_pos
var next=false
var i=15
var Key=false
var TNT=false
var notKey=true
enum States {
	INIT = 0,
	STATE1 = 1,
	STATE2 = 2,
	STATE3 = 3,
	STATE4 = 4,
	STATE5 = 5,
	STATE6 = 6,
	STATE7 = 7,
	STATE8 = 8,
	STATE9 = 9,
	STATE10 = 10,
	STATE11 = 11,
	STATE12 = 12,
	STATE13 = 13,
	TRAP = 14,
	TNT = 15,
	FINAL = 16,
	FINAL_FAKE = 17,
	STATE1_FAKE = 18,
	STATE2_FAKE = 19,
	STATE3_FAKE = 20,
	STATE5_FAKE = 21,
	STATE9_FAKE = 22,
	STATE10_FAKE = 23,
	TRAP_LOOP = 24,
	STATE15 = 25,
	STATE16 = 26,
};
var  dfa=States.INIT
var NextStage = preload("res://scene/Stage8.tscn").instance()
var menuclick=false
var nextclick=false
var retry=false
func _ready():
	init_pos =player.position
	player.left()
func _process(delta):
	$DFA7.getState(dfa)
	if(run):	
		isAccepted(text)
	for child in  get_tree().current_scene.get_children():
			if "Stage" in child.name: child.name="Stage"
	if !$button.is_playing() and retry:
		player.position =init_pos
		text=''
		run=false
		next=false
		notKey=false
		i=0
		retry=false
		TNT=false
		dfa=States.INIT
		$Key.show()
		$Final.default()
		$Player/Sprite.play("Left")
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

func init(c):
	print(0)
	dfa=States.STATE16
		
func state16(c):
	print(16)
	if(c=='L'):
		player.Move_Left()
		dfa=States.STATE15
		i=14
	elif(c=='U'):
		player.Move_Up()
		dfa=States.TNT
		i=14
	else:
		dfa=States.TRAP
		
func state15(c):
	print(15)
	if(c=='U'):
		player.Move_Up()
		dfa=States.STATE11
		i=10
	elif(c=='L'):
		player.Move_Left()
		dfa=States.TNT
		
	else:
		dfa=States.TRAP
		
func state11(c):
	print(11)
	if(c=='U'):
		player.Move_Up()
		dfa=States.STATE7
		i=6
	elif(c=='L'):
		player.Move_Left()
		dfa=States.STATE10
		i=9
	elif(c=='D'):
		dfa=States.TRAP
	elif(c=='R'):
		player.Move_Right()
		dfa=States.TNT
		
func state10(c):
	print(10)
	if(c=='L'):
		player.Move_Left()
		dfa=States.STATE9
		i=8
	elif(c=='R'):
		player.Move_Right()
		dfa=States.TRAP
	else:
		if c=='D':player.Move_Down()
		elif c=='U':player.Move_Up()
		dfa=States.TNT
		
func state9(c):
	print(9)
	if(c=='U'):
		player.Move_Up()
		dfa=States.STATE5
		i=4
	elif(c=='R'):
		player.Move_Right()
		dfa=States.TNT
		i=4
	else:
		i=3
		dfa=States.TRAP
func state5(c):
	print(5)
	notKey=false
	Key=true
	$KeySound.play()		
	$Key.hide()
	if(c=='U'):
		player.Move_Up()
		dfa=States.STATE1
		i=0
	elif(c=='L'):
		dfa=States.TRAP
	elif(c=='D'):
		dfa=States.TRAP
	elif(c=='R'):
		player.Move_Right()
		dfa=States.TNT
	else:
		i=3
		dfa=States.TRAP
func state1(c):
	print(1)
	if(c=='R'):
		player.Move_Right()
		dfa=States.STATE2
		i=1
	else:
		dfa=States.TRAP		
func state2(c):
	print(2)
	if(c=='R'):
		player.Move_Right()
		dfa=States.STATE3
		i=2
	elif(c=='D'):
		player.Move_Down()
		dfa=States.TNT
		i=2
	else:
		dfa=States.TRAP
func state3(c):
	print(3)
	if(c=='R'):
		player.Move_Right()
		dfa=States.FINAL
		i=4
	else:
		dfa=States.TRAP
func state7(c):
	print(7)
	if(c=='D'):
		player.Move_Down()
		dfa=States.TRAP
	elif(c=='U'):
		player.Move_Up()
		dfa=States.STATE3_FAKE
		i=2
	elif(c=='R'):
		player.Move_Right()
		dfa=States.TNT
		i=2
	elif(c=='L'):
		player.Move_Left()
		dfa=States.TNT
		i=2
	else:
		dfa=States.TRAP
func state3_fake(c):
	print("3f")
	if(c=='L'):
		player.Move_Left()
		dfa=States.STATE2_FAKE
		i=1
	elif(c=='R'):
		player.Move_Right()
		dfa=States.FINAL_FAKE
		i=2
	else:
		dfa=States.TRAP
func state2_fake(c):
	print("2f")
	if(c=='L'):
		player.Move_Left()
		dfa=States.STATE1_FAKE
		i=0
	elif(c=='U'):
		player.Move_Up()
		dfa=States.TRAP
	elif(c=='R'):
		player.Move_Right()
		dfa=States.TNT
	elif(c=='D'):
		dfa=States.TRAP
		player.Move_Down()
		
	else:
		i=3
		dfa=States.TRAP
func state1_fake(c):
	print("1f")
	if(c=='D'):
		player.Move_Down()
		dfa=States.STATE5_FAKE
		i=4
	else:
		dfa=States.TRAP
func state5_fake(c):
	notKey=false
	print("5f")
	if(c=='D'):
		player.Move_Down()
		dfa=States.STATE9_FAKE
		i=8
	elif(c=='R'):
		player.Move_Right()
		dfa=States.TNT
	else:
		dfa=States.TRAP
func state9_fake(c):
	print("9f")
	if(c=='R'):
		player.Move_Right()
		dfa=States.STATE10_FAKE
		i=9
	else:
		dfa=States.TRAP
func state10_fake(c):
	print("10f")
	if(c=='L'):
		dfa=States.TRAP
	elif(c=='R'):
		dfa=States.TRAP_LOOP
	elif(c=='U'):
		player.Move_Up()
		dfa=States.TNT
	else:
		player.Move_Down()
		dfa=States.TNT

	


func stateKey(c):
	print("key")
	if(c=='R'):
		player.Move_Right()
		dfa=States.STATE_STATE12
		i=11
		
	elif(c=='L'):
		player.Move_Left()
		dfa=States.TNT
	else:
		dfa=States.TRAP
func stateTNT(c):
	dfa=States.TRAP
	TNT=true
	
func state_trap(c):
	if TNT :player.TNT()
	elif notKey:
		$Final.fake()
		player.final()
	else:
		if c=='R': player.Move_Right()
		elif c=='L':player.Move_Left()
		elif c=='D':player.Move_Down()
		elif c=='U':player.Move_Up()		
		player.trap()
			
func isAccepted(t):
	var n=len(t)
	if(player.timer.is_stopped() and i <= n):
		if dfa==States.INIT: init(t[i])
		elif dfa==States.STATE1: state1(t[i])
		elif dfa==States.STATE2: state2(t[i])
		elif dfa==States.STATE3: state3(t[i])
		elif dfa==States.STATE5: state5(t[i])
		elif dfa==States.STATE7: state7(t[i])
		elif dfa==States.STATE9: state9(t[i])
		elif dfa==States.STATE10: state10(t[i])
		elif dfa==States.STATE11: state11(t[i])
		elif dfa==States.STATE15: state15(t[i])
		elif dfa==States.STATE16: state16(t[i])
		elif dfa==States.STATE1_FAKE: state1_fake(t[i])
		elif dfa==States.STATE2_FAKE: state2_fake(t[i])
		elif dfa==States.STATE3_FAKE: state3_fake(t[i])
		elif dfa==States.STATE5_FAKE: state5_fake(t[i])
		elif dfa==States.STATE9_FAKE: state9_fake(t[i])
		elif dfa==States.FINAL_FAKE: 
			notKey=true
			dfa=States.TRAP
		elif dfa==States.TNT: 
			stateTNT(t[i])
			
		
		elif dfa==States.TRAP: 
			state_trap(t[i])
			run=false
		elif (dfa == States.FINAL):
			print('f')
			next=true
			$Final.final()
			player.final()
			run=false
			return 1;
		else:
			return 0;
		player.timer.start(0.75)
	
func _on_Run_pressed():
	$button.play()
	if !run:
		run=true
		text=""
		i=15
		dfa=States.INIT
		var children = get_tree().current_scene.get_node("Stage").get_node("Box_stage").get_children()
		for child in children:
			text+=child.get_text()
		print(",",text,".")
		player.Move_Left()



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
