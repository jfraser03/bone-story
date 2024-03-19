extends Node2D
class_name RoomScene

@onready var Player = $YSort/Bonesly
@onready var Exits = $Exits

signal exit(current_scene, requested_scene, direction)

func _ready():
	for exit in Exits.get_children():
		exit.exit_passed.connect(_on_exit_passed) # Middle-man. Send the signal up to the loader

func set_player_position(exited_scene, direction):
	var player_position = Vector2.ZERO
	for exit in Exits.get_children():
		if exit.name.to_lower() == exited_scene:
			player_position = exit.get_enter_position()
	
	Player.global_position = player_position
	Player.set_direction(direction)

func _on_exit_passed(current_scene , requested_scene, direction):
	exit.emit(current_scene, requested_scene, direction)
