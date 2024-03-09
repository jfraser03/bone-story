extends Node2D

@onready var UI = $UI/TextBox
@export var Bonesly : CharacterBody2D

func _ready():
	Bonesly.interacted.connect(_on_Player_interaction)

func _on_Player_interaction():
	pass

func set_idle_state():
	$YSort/Bonesly/StateMachine._set_state("idle")
