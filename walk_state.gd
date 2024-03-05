extends State

var current_direction = get_parent().direction

func _enter_state():
	play_animation.emit('walk')

func _physics_update(delta, Actor):
	if Actor.input:
		Actor.velocity.x = move_toward(Actor.velocity.x, Actor.MAX_SPEED * Actor.input.x, Actor.ACCELERATION * delta)
		Actor.velocity.y = move_toward(Actor.velocity.y, Actor.MAX_SPEED * Actor.input.y, Actor.ACCELERATION * delta)
	else:
		change_state.emit('idle')
		
	check_direction_change()

func check_direction_change():
	var x_dir
	var y_dir
	if Actor.input.x > 0:
		
		
