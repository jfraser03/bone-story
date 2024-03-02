extends CharacterBody2D


const SPEED = 75.0
@onready var animatedSprite = $AnimatedSprite2D

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input = Vector2.ZERO
	input.x = Input.get_axis("ui_left", "ui_right")
	input.y = Input.get_axis("ui_up", "ui_down")
	if input:
		velocity = input * SPEED
		_process_walk(input)
	else:
		velocity = Vector2.ZERO
		_process_stop()
	
	
	move_and_slide()

func _process_walk(input):
	if input.x < 0:
		animatedSprite.play("WalkLeft")
	elif input.x > 0:
		animatedSprite.play("WalkRight")
	elif input.y < 0:
		animatedSprite.play("WalkUp")
	elif input.y > 0:
		animatedSprite.play("WalkDown")
	
func _process_stop():
	var direction = animatedSprite.get_animation()
	if direction == "WalkLeft":
		animatedSprite.play("IdleLeft")
	elif direction == "WalkRight":
		animatedSprite.play("IdleRight")
	elif direction == "WalkUp":
		animatedSprite.play("IdleUp")
	elif direction == "WalkDown":
		animatedSprite.play("IdleDown")
