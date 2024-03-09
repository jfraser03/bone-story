extends State

func _physics_update(delta, Actor):
	if Actor.velocity != Vector2.ZERO:
		Actor.velocity = Vector2.ZERO
	
func _enter_state():
	print("INTERACTING")
