extends State
class_name IdleState

var input = Vector2.ZERO

func _enter_state():
	play_animation.emit('idle')
	print("Idle State entered")
	
func _physics_update(delta, Actor):
	if Actor.input == Vector2.ZERO:
		Actor.velocity.x = move_toward(Actor.velocity.x, 0, Actor.FRICTION * delta)
		Actor.velocity.y = move_toward(Actor.velocity.y, 0, Actor.FRICTION * delta)
	else:
		change_state.emit('walk')
