extends State

@onready var StateMachine = get_parent()
var prev_direction = Vector2.ZERO # Used to tell idle state direction to point && to check if walking a new direction 
var direction : String
@export var Sprite : AnimatedSprite2D

func _enter_state():
	play_animation.emit('walk')

func _physics_update(delta, Actor):
	if prev_direction != Actor.input: change_direction(Actor) 
	
	if Actor.input:
		Actor.velocity.x = move_toward(Actor.velocity.x, Actor.MAX_SPEED * Actor.input.x, Actor.ACCELERATION * delta)
		Actor.velocity.y = move_toward(Actor.velocity.y, Actor.MAX_SPEED * Actor.input.y, Actor.ACCELERATION * delta)
		prev_direction = Actor.input
	else:
		StateMachine.direction = direction
		change_state.emit('idle')
	if Input.is_action_just_pressed("ui_select"):
		interacting.emit()

func change_direction(Actor):
	var input = Actor.input
	if input.y > 0:
		direction = "down"
		check_x(input.x)
	elif input.y < 0:
		direction = "up"
		check_x(input.x)
	elif input.y == 0:
		if input.x > 0:
			direction = "right"
		elif input.x < 0:
			direction = "left"
	
	direction_change.emit(direction)
	play_animation.emit('walk')
	
func check_x(x):
	if x > 0:
		direction += "_right"
	elif x < 0:
		direction += "_left"
