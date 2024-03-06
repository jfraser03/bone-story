extends Node2D

@onready var UI = $UI
@export var Bonesly : CharacterBody2D

func _ready():
	Bonesly.interacted.connect(text_box_message)

func text_box_message(message):
	UI.set_message(message)
