extends Node2D
enum States {
	STATE_START,
	STATE_STATE1,
	STATE_STATE2,
	STATE_STATE3,
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
