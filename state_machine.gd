extends Node
class_name StateMachine

signal animation_update(current_state, current_direction)

@export var Sprite : AnimatedSprite2D
@export var Actor : CharacterBody2D
@export var interactArea : Area2D

var prev_state : State
var current_state : State
var states : Dictionary

var direction : String

func _ready():
	for i in get_children():
		states[i.name.to_lower()] = i
		i.play_animation.connect(_play_animation)
		i.change_state.connect(_set_state)
		i.direction_change.connect(_on_direction_update)

	direction = "down"
		

func _set_state(new_state):
	prev_state = current_state
	current_state = states[new_state]
	
	if current_state:
		current_state._enter_state()
	if prev_state:
		prev_state._exit_state()
	
func _process(delta):
	if current_state:
		current_state._update(delta, Actor)

func _physics_process(delta):
	if current_state:
		current_state._physics_update(delta, Actor)
	
func _on_direction_update(new_direction):
	direction = new_direction
	if interactArea != null:
		interactArea.interact_position = direction

func _play_animation(state):
	animation_update.emit(state, direction)
