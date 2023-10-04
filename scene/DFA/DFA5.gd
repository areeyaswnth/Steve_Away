extends Node2D
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
var states=null;
func _process(delta):
	if states ==States.STATE_START:
		$init.show()
	else:
		$init.hide()
	if states ==States.STATE_STATE1:
		$St1.show()
	else:
		$St1.hide()
	if states ==States.STATE_STATE2_1:
		$St2_1.show()
	else:
		$St2_1.hide()
	if states ==States.STATE_STATE2_3:
		$St2_3.show()
	else:
		$St2_3.hide()
	if states ==States.STATE_STATE2_5:
		$St2_5.show()
	else:
		$St2_5.hide()
	if states ==States.STATE_STATE3_2_Key:
		$St3_2_key.show()
	else:
		$St3_2_key.hide()
	if states ==States.STATE_STATE3_6_2:
		$St3_6_2.show()
	else:
		$St3_6_2.hide()
	if states ==States.STATE_STATE3_2:
		$St3_2.show()
	else:
		$St3_2.hide()
	if states ==States.STATE_STATE3_6_4:
		$St3_6_4.show()
	else:
		$St3_6_4.hide()
	if states ==States.STATE_STATE4_1:
		$St4_1.show()
	else:
		$St4_1.hide()
	if states ==States.STATE_STATE4_5:
		$St4_5.show()
	else:
		$St4_5.hide()
	if states ==States.STATE_STATE4_5_Key:
		$St4_5_key.show()
	else:
		$St4_5_key.hide()
	if states ==States.STATE_STATE5_2:
		$St5_2.show()
	else:
		$St5_2.hide()
	if states ==States.STATE_STATE5_4:
		$St5_4.show()
	else:
		$St5_4.hide()
	if states ==States.STATE_STATE5_6_Key:
		$St5_6_key.show()
	else:
		$St5_6_key.hide()
	if states ==States.STATE_STATE6_3:
		$St6_3.show()
	else:
		$St6_3.hide()
	if states ==States.STATE_STATE6_3_Key:
		$St6_3_key.show()
	else:
		$St6_3_key.hide()
	if states ==States.STATE_STATE6_5_2:
		$St6_5_2.show()
	else:
		$St6_5_2.hide()
	if states ==States.STATE_STATE6_5_4:
		$St6_5_4.show()
	else:
		$St6_5_4.hide()
	if states ==States.STATE_STATE7_5:
		$St7_5.show()
	else:
		$St7_5.hide()
	if states ==States.STATE_STATE7_5_Key:
		$St7_5_key.show()
	else:
		$St7_5_key.hide()
	if states ==States.STATE_FAKE_FINAL:
		$FakeFN.show()
		$FakeFN2.show()
		$FakseFN.hide()
	else:
		$FakeFN.hide()
		$FakeFN2.hide()
		$FakseFN.hide()
	if states ==States.STATE_FINAL:
		$FN.show()
	else:
		$FN.hide()
	if states ==States.STATE_TRAP:
		$trap.show()
		$trap2.show()
		$trap3.show()
		$trap4.show()
	else:
		$trap.hide()
		$trap2.hide()
		$trap3.hide()
		$trap4.hide()
func getState(var state):
	states=state;
