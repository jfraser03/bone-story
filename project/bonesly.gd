extends CharacterBody2D
class_name Bonesly


@export var MAX_SPEED = 65.0
@export var ACCELERATION = 350
@export var FRICTION = 2000
var input = Vector2.ZERO

@onready var interactArea = $InteractArea
@onready var StateMachine = $StateMachine
@onready var interact = $StateMachine/Interact
@onready var Sprite = $AnimatedSprite2D

signal interacted(message)

var interactables : Array = []

func _ready():
	StateMachine.animation_update.connect(_on_animation_update)
	StateMachine.interacting.connect(_interact)
	StateMachine._set_state("idle")

func _physics_process(delta):
	input.x = Input.get_axis('ui_left', 'ui_right')
	input.y = Input.get_axis('ui_up', 'ui_down')
	input = input.normalized()
	
	var colliding = move_and_slide()
	
func _on_animation_update(state, direction):
	var animation = state + "_" + direction
	
	var current_frame = Sprite.get_frame()
	var progress = Sprite.get_frame_progress()

	Sprite.play(animation)
	Sprite.set_frame_and_progress(current_frame, progress)

func set_direction(new_direction):
	StateMachine.direction = new_direction
	StateMachine._play_animation('idle')

func _interact():
	if interactables != []:
		var node = interactables[0]
		if Interface.node_implements_interface(node, Interface.InteractableInterface):
			node.interact(self)
			
func set_interacting():
	StateMachine._set_state('interact')

func interaction_finished():
	StateMachine._set_state("idle")

func _on_interact_area_body_entered(body):
	if body != self:
		interactables.append(body)
		
func _on_interact_area_body_exited(body):
	if interactables.has(body):
		interactables.erase(body)
		
func play_footstep():
	var step = randi() % 3
	SoundManager.play_sfx(SoundManager.FOOTSTEPS[step])
