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

func _ready():
	var starting_scene = test_room.instantiate()
	add_child(starting_scene)
	current_scene = starting_scene
	current_scene.exit.connect(_on_exit_signal)

func change_scene(new_scene : PackedScene):
	var instanced_scene = new_scene.instantiate()
	call_deferred("add_child", instanced_scene)
	
	if current_scene != null:
		previous_scene = current_scene
		previous_scene.queue_free()
		align_player()
		
	current_scene = instanced_scene
	current_scene.exit.connect(_on_exit_signal)
	
func align_player():
	# Honor system. The previous scene's exit signal manually includes the name of current scenes Exit node
	await get_tree().create_timer(1).timeout
	current_scene.set_player_position(exited_scene, exit_direction)
	
func _on_exit_signal(previous_scene : String, new_scene : PackedScene, direction : String):
	exited_scene = previous_scene
	exit_direction = direction
	change_scene(new_scene)
