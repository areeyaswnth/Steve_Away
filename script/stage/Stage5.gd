extends Node
var text=''
var run=false
onready var player=$Player
var init_pos
var next=false
var notKey=true
var key=false
var fake_final=false
var i=0
enum States {
	STATE_START,
	STATE_STATE1,
	STATE_STATE2_1,
	STATE_STATE2_3,
	STATE_STATE2_5,
	STATE_STATE3_2_Key,
	STATE_STATE3_2,
	STATE_STATE3_6_2,
	STATE_STATE3_6_4,
	STATE_STATE4_1,
	STATE_STATE4_5,
	STATE_STATE4_5_Key,
	STATE_STATE5_2,
	STATE_STATE5_4,
	STATE_STATE5_6_Key,
	STATE_STATE6_3,
	STATE_STATE6_3_Key,
	STATE_STATE6_5_2,
	STATE_STATE6_5_4,
	STATE_STATE7_5,
	STATE_STATE7_5_Key,
	STATE_FAKE_FINAL,
	STATE_FINAL,
	STATE_TRAP
};
var  dfa=States.STATE_START
var NextStage = preload("res://scene/Stage6.tscn").instance()
var menuclick=false
var nextclick=false
var retry=false
func _ready():
	init_pos =player.position
func _process(delta):
	$DFA5.getState(dfa)
	if(run):	
		isAccepted(text)
	for child in  get_tree().current_scene.get_children():
			if "Stage" in child.name: child.name="Stage"
	if !$button.is_playing() and retry:
		fake_final=false
		player.position =init_pos
		text=''
		run=false
		next=false
		i=0
		retry=false
		notKey=true
		key=false
		dfa=States.STATE_START
		$Final.default()
		$Key.show()
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
		dfa=States.STATE_STATE4_1
		i=3
	else:
		dfa=States.STATE_TRAP
		
func state2_1(c):
	print(21)
	if(c=='R'):
		player.Move_Right()
		dfa=States.STATE_STATE3_2_Key
		i=2
	elif(c=='D'):
		player.Move_Down()
		dfa=States.STATE_STATE5_2
		i=4
	else:
		dfa=States.STATE_TRAP
		
func state2_3(c):
	dfa=States.STATE_TRAP
	
func state2_5(c):
	print(21)
	if(c=='R'):
		player.Move_Right()
		dfa=States.STATE_STATE3_2
		i=2
	else:
		dfa=States.STATE_TRAP
			
func state3_2_Key(c):
	notKey=false
	$KeySound.play()
	$Key.hide()
	print("3_2_k")
	if(c=='D'):
		player.Move_Down()
		dfa=States.STATE_STATE6_3_Key
		i=5
	else:
		dfa=States.STATE_TRAP
		
func state3_2(c):
	$KeySound.play()
	$Key.hide()
	print("3_2")
	if(c=='D'):
		player.Move_Down()
		dfa=States.STATE_STATE6_3
		i=5
	else:
		dfa=States.STATE_TRAP
		
func state3_6_2(c):
	$KeySound.play()
	$Key.hide()
	print("3_6_2")
	dfa=States.STATE_TRAP
	
func state3_6_4(c):
	print("3_6_4")
	$KeySound.play()
	$Key.hide()
	if(c=='L'):
		player.Move_Left()
		dfa=States.STATE_STATE2_3
		i=1
	else:
		dfa=States.STATE_TRAP
func state4_1(c):
	print("4_1")
	if(c=='R'):
		player.Move_Right()
		dfa=States.STATE_STATE5_4
		i=4
	elif(c=='D'):
		player.Move_Down()
		dfa=States.STATE_FAKE_FINAL
		i=4
	else:
		dfa=States.STATE_TRAP
func state4_5(c):
	print("4_5")
	if(c=='D'):
		player.Move_Down()
		dfa=States.STATE_FAKE_FINAL
		i=4
	else:
		dfa=States.STATE_TRAP
func state4_5_Key(c):
	print("4_5")
	if(c=='D'):
		player.Move_Down()
		dfa=States.STATE_FINAL
		i=4
	else:
		dfa=States.STATE_TRAP
		
		
func state5_2(c):
	print("5_2")
	if(c=='L'):
		player.Move_Left()
		if notKey:
				dfa=States.STATE_STATE4_5
		else:
			dfa=States.STATE_STATE4_5_Key
		i=3
	elif(c=='R'):
		player.Move_Right()
		dfa=States.STATE_STATE6_5_2
		i=5
	elif(c=='D'):
		player.Move_Down()
		dfa=States.STATE_STATE7_5
		i=6
	else:
		dfa=States.STATE_TRAP
			
func state5_4(c):
	print("5_4")
	if(c=='D'):
		player.Move_Down()
		dfa=States.STATE_STATE7_5
		i=6
	elif(c=='U'):
		player.Move_Up()
		dfa=States.STATE_STATE2_5
		i=1
	elif(c=='R'):
		player.Move_Right()
		dfa=States.STATE_STATE6_5_4
		i=5
	else:
		dfa=States.STATE_TRAP
		
func state5_6_Key(c):
	print("5_6_k")
	if(c=='D'):
		player.Move_Down()
		dfa=States.STATE_STATE7_5_Key
		i=6
	elif(c=='L'):
		player.Move_Left()
		dfa=States.STATE_STATE4_5_Key
		i=3
	else:
		dfa=States.STATE_TRAP
func state6_3(c):
	print("6_3")
	dfa=States.STATE_TRAP
func state6_3_Key(c):
	print("6_3_k")
	if(c=='L'):
		player.Move_Left()
		dfa=States.STATE_STATE5_6_Key
		i=4
	else:
		dfa=States.STATE_TRAP
func state6_5_2(c):
	print("6_5_2")
	if(c=='U'):
		player.Move_Up()
		dfa=States.STATE_STATE3_6_2
		i=2
	else:
		dfa=States.STATE_TRAP
func state6_5_4(c):
	print("6_5_4")
	if(c=='U'):
		player.Move_Up()
		dfa=States.STATE_STATE3_6_4
		i=2
	else:
		dfa=States.STATE_TRAP
func state7_5(c):
	print("7_5")
	if(c=='L'):
		player.Move_Left()
		dfa=States.STATE_FAKE_FINAL
		i=6
	else:
		dfa=States.STATE_TRAP
func state7_5_Key(c):
	print("7_5_k")
	
	if(c=='L'):
		player.Move_Left()
		dfa=States.STATE_FINAL
	else:
		dfa=States.STATE_TRAP
func state_trap(c):	
	if notKey and fake_final:
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
		if dfa==States.STATE_START: start(t[i])
		elif dfa==States.STATE_STATE1: state1(t[i])
		elif dfa==States.STATE_STATE2_1: state2_1(t[i])
		elif dfa==States.STATE_STATE2_3: state2_3(t[i])
		elif dfa==States.STATE_STATE2_5: state2_5(t[i])
		elif dfa==States.STATE_STATE3_2: state3_2(t[i])
		elif dfa==States.STATE_STATE3_2_Key: state3_2_Key(t[i])
		elif dfa==States.STATE_STATE3_6_2: state3_6_2(t[i])
		elif dfa==States.STATE_STATE3_6_4: state3_6_4(t[i])
		elif dfa==States.STATE_STATE4_1: state4_1(t[i])
		elif dfa==States.STATE_STATE4_5: state4_5(t[i])
		elif dfa==States.STATE_STATE4_5_Key: state4_5_Key(t[i])
		elif dfa==States.STATE_STATE5_2: state5_2(t[i])
		elif dfa==States.STATE_STATE5_4: state5_4(t[i])
		elif dfa==States.STATE_STATE5_6_Key: state5_6_Key(t[i])
		elif dfa==States.STATE_STATE6_3: state6_3(t[i])
		elif dfa==States.STATE_STATE6_3_Key: state6_3_Key(t[i])
		elif dfa==States.STATE_STATE6_5_2: state6_5_2(t[i])
		elif dfa==States.STATE_STATE6_5_4: state6_5_4(t[i])
		elif dfa==States.STATE_STATE7_5: state7_5(t[i])
		elif dfa==States.STATE_STATE7_5_Key: state7_5_Key(t[i])
		elif dfa==States.STATE_FAKE_FINAL: 
			fake_final=true
			notKey=true
			dfa=States.STATE_TRAP
		elif dfa==States.STATE_TRAP: 
			state_trap(t[i])
			run=false
		elif (dfa == States.STATE_FINAL):
			
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
		nextclick=true

func _on_retry_pressed():
	$button.play()
	retry=true

func _on_Home_pressed():
	$button.play()
	menuclick=true
