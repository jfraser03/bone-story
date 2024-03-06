extends Node
class_name StateMachine

@export var Sprite : AnimatedSprite2D
@export var Actor : CharacterBody2D

var prev_state : State
var current_state : State
var states : Dictionary

var direction : String

func _ready():
	for i in get_children():
		states[i.name.to_lower()] = i
		i.play_animation.connect(_play_animation)
		i.change_state.connect(_set_state)

	if states['idle']:
		direction = "down"
		_set_state('idle')
		

func _set_state(new_state):
	prev_state = current_state
	current_state = states[new_state]
	
	if current_state:
		current_state._enter_state()
	if prev_state:
		prev_state._exit_state()
	
func _process(delta):
	current_state._update(delta, Actor)

func _physics_process(delta):
	current_state._physics_update(delta, Actor)
	
func _on_direction_update(new_direction):
	direction = new_direction

func _play_animation(state):
	var animation = state + "_" + direction
	
	var current_frame = Sprite.get_frame()
	var progress = Sprite.get_frame_progress()

	Sprite.play(animation)
	Sprite.set_frame_and_progress(current_frame, progress)

