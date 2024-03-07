extends State

@export var Actor : CharacterBody2D
var StateMachine : StateMachine
var Friend : CharacterBody2D

func _enter_state():
	Friend = Actor.Friend
	StateMachine = get_parent()

func _physics_update(delta, Actor):
	point_to_friend()
	var distance_to_friend = Actor.global_position.distance_to(Friend.global_position)
	if distance_to_friend > Actor.FOLLOW_DISTANCE:
		go_to_friend(delta)
	elif distance_to_friend <= Actor.FOLLOW_DISTANCE:
		change_state.emit("float")

func go_to_friend(delta):
	var direction = (Friend.global_position - Actor.global_position).normalized()
	Actor.velocity.x = move_toward(Actor.velocity.x, Actor.MAX_SPEED * direction.x, Actor.ACCELERATION * delta)
	Actor.velocity.y = move_toward(Actor.velocity.y, Actor.MAX_SPEED * direction.y, Actor.ACCELERATION * delta)

func point_to_friend():
	if Friend != null:
		var direction_vector = Friend.global_position - Actor.global_position
		var radians = direction_vector.angle()
		var angle = rad_to_deg(radians) 
		
		var direction = "down"
		if angle < 30 && angle >= -30:
			direction = "right"
		elif angle < -30 && angle >= -60:
			direction = "up_right"
		elif angle < -60 && angle >= -120:
			direction = "up"
		elif angle < -120 && angle >= -150:
			direction = "up_left"
		elif angle < -150 || angle >= 160:
			direction = "left"
		elif angle < 160 && angle >= 130:
			direction = "down_left"
		elif angle < 130 && angle >= 60:
			direction = "down"
		elif angle < 60 && angle >= 30:
			direction = "down_right"
		
		if StateMachine != null && direction != StateMachine.direction:
			direction_change.emit(direction)
			play_animation.emit("idle")
		
