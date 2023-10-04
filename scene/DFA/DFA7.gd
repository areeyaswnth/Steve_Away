extends Node2D
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
var states=null;
func _process(delta):
	if states ==States.INIT:
		$init.show()
	else:
		$init.hide()
	if states ==States.STATE1:
		$St1.show()
	else:
		$St1.hide()
	if states ==States.STATE2:
		$St2.show()
	else:
		$St2.hide()
	
	if states ==States.STATE3:
		$St4.show()
	else:
		$St4.hide()
	if states ==States.STATE5:
		$St5.show()
	else:
		$St5.hide()
	
	if states ==States.STATE7:
		$St7.show()
	else:
		$St7.hide()
	if states ==States.STATE9:
		$St9.show()
	else:
		$St9.hide()
	if states ==States.STATE10:
		$St10.show()
	else:
		$St10.hide()
	if states ==States.STATE11:
		$St11.show()
	else:
		$St11.hide()
	if states ==States.STATE15:
		$St15.show()
	else:
		$St15.hide()
	if states ==States.STATE16:
		$St16.show()
	else:
		$St16.hide()
	if states ==States.TNT:
		$TNT.show()
	else:
		$TNT.hide()
	if states ==States.FINAL:
		$FN.show()
	else:
		$FN.hide()
	if states ==States.TRAP:
		$trap.show()
		$trap2.show()
	else:
		$trap.hide()
		$trap2.hide()
	if states ==States.STATE1_FAKE:
		$StFake_1.show()
	else:
		$StFake_1.hide()
	if states ==States.STATE2_FAKE:
		$StFake_2.show()
	else:
		$StFake_2.hide()
	if states ==States.STATE3_FAKE:
		$StFake_3.show()
	else:
		$StFake_3.hide()
	if states ==States.STATE5_FAKE:
		$StFake_5.show()
	else:
		$StFake_5.hide()
	if states ==States.STATE9_FAKE:
		$StFake_9.show()
	else:
		$StFake_9.hide()
	if states ==States.STATE10_FAKE:
		$StFake_10.show()
	else:
		$StFake_10.hide()
	if states ==States.FINAL_FAKE:
		$Fake_FN.show()
	else:
		$Fake_FN.hide()
func getState(var state):
	states=state;
