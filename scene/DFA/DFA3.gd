extends Node2D
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
	if states ==States.STATE_STATE2_5:
		$St2_5.show()
	else:
		$St2_5.hide()
	if states ==States.STATE_STATE3:
		$St3.show()
	else:
		$St3.hide()
	if states ==States.STATE_STATE4_1:
		$St4_1.show()
	else:
		$St4_1.hide()
	if states ==States.STATE_STATE4_5:
		$St4_5.show()
	else:
		$St4_5.hide()
	if states ==States.STATE_STATE5_2:
		$St5_2.show()
	else:
		$St5_2.hide()
	if states ==States.STATE_STATE5_4:
		$St5_4.show()
	else:
		$St5_4.hide()
	if states ==States.STATE_FINAL:
		$FN.show()
	else:
		$FN.hide()
	if states ==States.STATE_TRAP:
		$trap1.show()
		$trap2.show()
	else:
		$trap1.hide()
		$trap2.hide()
func getState(var state):
	states=state;
