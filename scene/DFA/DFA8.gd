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
	if states ==States.STATE_STATE13:
		$St13.show()
	else:
		$St13.hide()
	if states ==States.STATE_STATE8:
		$St8.show()
	else:
		$St8.hide()
	if states ==States.STATE_STATE9:
		$St9.show()
	else:
		$St9.hide()
	if states ==States.STATE_STATE10:
		$St10.show()
	else:
		$St10.hide()
	if states ==States.STATE_STATE11:
		$St11.show()
	else:
		$St11.hide()
	if states ==States.STATE_STATE12:
		$St12.show()
	else:
		$St12.hide()

	if states ==States.STATE_TNT:
		$TNT.show()
		$TNT2.show()
	else:
		$TNT.hide()
		$TNT2.hide()
	if states ==States.STATE_FINAL:
		$FN.show()
	else:
		$FN.hide()
	if states ==States.STATE_TRAP:
		$trap.show()
		$trap2.show()
	else:
		$trap.hide()
		$trap2.hide()
func getState(var state):
	states=state;
