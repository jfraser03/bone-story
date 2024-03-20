extends Node
class_name SceneLoader

## Currently this Node takes requests to change scenes (including info from which door character is coming from)
## Creates an instance of the new scene, and frees the old
## Issues regarding loading, It should start with a blank screen and load everything in, then play an animation
## that reveals the scene once everything is totally done

var current_scene : Node
var previous_scene : Node
var exited_scene : String
var exit_direction : String

var test_room = preload("res://TestRoom.tscn")
var loadingScreen = preload("res://LoadingScreen.tscn")
var loading_screen = Node

@onready var roomTransition = $RoomTransition

func _ready():
	roomTransition.exit_transition_finished.connect(_connected)
	roomTransition.enter_transition_finished.connect(_connected)
	
	var starting_scene = test_room.instantiate()
	add_child(starting_scene)
	current_scene = starting_scene
	current_scene.exit.connect(_on_exit_signal)
	process_mode = Node.PROCESS_MODE_ALWAYS

func change_scene(new_scene_path : String):
	var old_player_position = current_scene.get_player_position()
	await exit_transition_start(old_player_position)
	if current_scene != null:
		call_deferred("remove_child", current_scene)
		previous_scene = current_scene
	
	var target_scene = load(new_scene_path)
	current_scene = target_scene.instantiate()
	call_deferred("add_child", current_scene)
	current_scene.loaded.connect(_on_target_scene_loaded)
	
func load_scene_information():
	# Premade scene is loaded (scripts and assets)
	# Now add characters, instance the Player, etc.
	await current_scene.set_player_position(exited_scene, exit_direction)
	
	
func _on_exit_signal(previous_scene : String, new_scene : String, player_direction : String):
	exited_scene = previous_scene
	exit_direction = player_direction
	change_scene(new_scene)

func _on_target_scene_loaded():
	await load_scene_information()
	var new_player_position = current_scene.get_player_position()
	await enter_transition_start(new_player_position)
	current_scene.exit.connect(_on_exit_signal)

func exit_transition_start(prev_door_position : Vector2):
	# This is the blackout transition
	roomTransition.exit_transition(prev_door_position)
	get_tree().paused = true
	await roomTransition.exit_transition_finished

func enter_transition_start(new_door_position : Vector2):
	# This is the blackout transition
	roomTransition.enter_transition(new_door_position)
	get_tree().paused = false
	await roomTransition.enter_transition_finished
	
func _connected():
	# Connect calls need a function attached.
	pass
