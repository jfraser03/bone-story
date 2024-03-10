extends State

func _enter_state():
	play_animation.emit('idle')

func _physics_update(delta, Actor):
	if Actor.velocity != Vector2.ZERO:
		Actor.velocity = Vector2.ZERO
	
