extends CharacterBody2D

@export var Friend : CharacterBody2D

@export var MAX_SPEED : float
@export var ACCELERATION : float
@export var FRICTION : float
@export var FOLLOW_DISTANCE : float

@onready var StateMachine = $StateMachine
@onready var Sprite = $AnimatedSprite2D

func _ready():
	StateMachine.animation_update.connect(_on_animation_update)
	StateMachine._set_state("follow")
	
func _physics_process(delta):
	move_and_slide()
	
func _on_animation_update(state, direction):
	Sprite.play(direction)
