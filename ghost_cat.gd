extends CharacterBody2D
var implements = Interface.InteractableInterface

@export var Friend : CharacterBody2D

@export var MAX_SPEED : float
@export var ACCELERATION : float
@export var FRICTION : float
@export var FOLLOW_DISTANCE : float

@export_multiline var message : String

@onready var StateMachine = $StateMachine
@onready var Sprite = $AnimatedSprite2D

signal interacted(interactor, interactee)
signal submit_dialogue(msg)

func _ready():
	StateMachine.animation_update.connect(_on_animation_update)
	StateMachine._set_state("idle")
	
func _physics_process(delta):
	move_and_slide()
	
func _on_animation_update(state, direction):
	Sprite.play(direction)

func interact(interact_requester: Node):
	interacted.emit(interact_requester, self)
	submit_dialogue.emit(message)
