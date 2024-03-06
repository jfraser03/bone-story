extends CharacterBody2D


@export var MAX_SPEED = 65.0
@export var ACCELERATION = 350
@export var FRICTION = 2000
var input = Vector2.ZERO


func _physics_process(delta):
	input.x = Input.get_axis('ui_left', 'ui_right')
	input.y = Input.get_axis('ui_up', 'ui_down')
	input = input.normalized()
	print(input)
	
	var colliding = move_and_slide()
