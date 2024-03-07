extends CharacterBody2D
class_name Bonesly


@export var MAX_SPEED = 65.0
@export var ACCELERATION = 350
@export var FRICTION = 2000
var input = Vector2.ZERO

@onready var interactArea = $InteractArea
@onready var StateMachine = $StateMachine
@onready var Sprite = $AnimatedSprite2D

var interactables = []

signal interacted(object_message)

func _ready():
	StateMachine.animation_update.connect(_on_animation_update)
	StateMachine._set_state("idle")

func _physics_process(delta):
	input.x = Input.get_axis('ui_left', 'ui_right')
	input.y = Input.get_axis('ui_up', 'ui_down')
	input = input.normalized()
	
	var colliding = move_and_slide()
	if Input.is_action_just_pressed("ui_select"): interact_test()
	
	
func _on_animation_update(state, direction):
	var animation = state + "_" + direction
	
	var current_frame = Sprite.get_frame()
	var progress = Sprite.get_frame_progress()

	Sprite.play(animation)
	Sprite.set_frame_and_progress(current_frame, progress)


# Code to be put into the StateMachine as an "interacting" state (where can't move until textbox is finished)
func interact_test():
	if interactables != []:
		var object = interactables[0]
		if object.has_method('get_message'):
			interacted.emit(object.get_message())
	

func _on_interact_area_body_entered(body):
	if body != self:
		interactables.append(body)
		
func _on_interact_area_body_exited(body):
	if interactables.has(body):
		interactables.erase(body)
	

