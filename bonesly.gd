extends CharacterBody2D


@export var MAX_SPEED = 90.0
@export var ACCELERATION = 4 * 60
@export var FRICTION = 25 * 60
var input = Vector2.ZERO


func _physics_process(delta):
	input.x = Input.get_axis('ui_left', 'ui_right')
	input.y = Input.get_axis('ui_up', 'ui_down')
	
	var colliding = move_and_slide()
