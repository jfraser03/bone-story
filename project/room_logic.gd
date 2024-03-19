extends Node2D

@onready var Player = $YSort/Bonesly
@onready var Exits = $Exits

func set_player_position(exited_scene, direction):
	if Exits == null: return
	if Player == null: return
	var player_position = Vector2.ZERO
	for exit in Exits.get_children():
		if exit.name.to_lower() == "exited_scene":
			player_position = exit.get_enter_position()
	
	Player.global_position = player_position
	Player.set_direction(direction)
