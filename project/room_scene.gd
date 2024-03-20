extends Node2D
class_name RoomScene

@onready var Player = $YSort/Bonesly
@onready var Camera = $Camera2D
@onready var Exits = $Exits

signal exit(current_scene, requested_scene, direction)
signal loaded

func _ready():
	for exit in Exits.get_children():
		exit.exit_passed.connect(_on_exit_passed) # Middle-man. Send the signal up to the loader
	loaded.emit()
	process_mode = Node.PROCESS_MODE_PAUSABLE

func set_player_position(exited_scene, direction):
	var player_position = Vector2.ZERO
	for exit in Exits.get_children():
		if exit.name.to_lower() == exited_scene:
			player_position = exit.get_enter_position()
	
	Player.global_position = player_position
	Player.set_starting_direction(direction)

func _on_exit_passed(current_scene , requested_scene, direction):
	exit.emit(current_scene, requested_scene, direction)

#func get_player_position():
	#var player_camera_distance = Camera.position - Player.global_position
	#var player_relative_to_cam = Camera.position + player_camera_distance
	#return player_relative_to_cam # Gets approximate position of player's face if feet are at 0,0

func get_player_position():
	# Calculate the direction vector from the camera to the player
	var player_camera_distance = Player.global_position - Camera.global_position
	
	# Use the camera's transform to take into account its rotation and position
	var camera_transform = Camera.get_global_transform()
	
	# Get the inverse of the camera's transform
	var camera_inverse = camera_transform.affine_inverse()
	
	# Transform the player-camera distance vector into the camera's local space
	var player_relative_to_cam = camera_transform.basis_xform(player_camera_distance)
	
	# Now, add the camera's local position to get the player's position relative to the camera
	var player_position_relative_to_camera = camera_transform.origin + player_relative_to_cam
	
	return player_position_relative_to_camera
