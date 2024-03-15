extends StateMachine

@export var textBox : Panel

func _ready():
	for i in get_children():
		i.change_state.connect(_set_state)
		states[i.name.to_lower()] = i

func _set_state(state : String):
	var new_state = state
	if current_state:
		prev_state = current_state
		
	if states[new_state] is State:
		current_state = states[new_state]
		current_state._enter_state()
	
	if prev_state:
		prev_state._exit_state()
	

func _process(delta):
	if current_state:
		current_state._update(delta, textBox)

func _physics_process(delta):
	if current_state:
		current_state._physics_update(delta, textBox)
