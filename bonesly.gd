extends CharacterBody2D
class_name Bonesly


@export var MAX_SPEED = 65.0
@export var ACCELERATION = 350
@export var FRICTION = 2000
var input = Vector2.ZERO

@onready var interactArea = $InteractArea
var interactables = []


func _physics_process(delta):
	input.x = Input.get_axis('ui_left', 'ui_right')
	input.y = Input.get_axis('ui_up', 'ui_down')
	input = input.normalized()
	
	var colliding = move_and_slide()
	if Input.is_action_just_pressed("ui_select"): interact_test()


# Code to be put into the StateMachine as an "interacting" state (where can't move until textbox is finished)
func interact_test():
	if interactables != []:
		print("Bonesly really likes this ", interactables[0].name)
	

func _on_interact_area_body_entered(body):
	if body != self:
		interactables.append(body)
		
func _on_interact_area_body_exited(body):
	if interactables.has(body):
		interactables.erase(body)
