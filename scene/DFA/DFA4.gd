extends Node2D
enum States {
	STATE_START,
	STATE_STATE1,
	STATE_STATE2,
	STATE_STATE3,
	STATE_STATE4,
	STATE_STATE5,
	STATE_STATE6,
	STATE_STATE7,
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
	if states ==States.STATE_STATE2:
		$St2.show()
	else:
		$St2.hide()
	if states ==States.STATE_STATE3:
		$St3.show()
	else:
		$St3.hide()
	if states ==States.STATE_STATE4:
		$St4.show()
	else:
		$St4.hide()
	if states ==States.STATE_STATE5:
		$St5.show()
	else:
		$St5.hide()
	if states ==States.STATE_STATE6:
		$St6.show()
	else:
		$St6.hide()
	if states ==States.STATE_STATE7:
		$St7.show()
	else:
		$St7.hide()
	if states ==States.STATE_FINAL:
		$FN.show()
	else:
		$FN.hide()
	if states ==States.STATE_TRAP:
		$trap.show()
	else:
		$trap.hide()
func getState(var state):
	states=state;
