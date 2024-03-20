extends Node
class_name Exit

var to_scene_path : String
var from_scene : String
@onready var enterPosition = $EnterPosition

var direction : String

signal exit_passed(from_scene, to_scene, direction)

func _on_body_entered(body):
	if body is Bonesly:
		exit_passed.emit(from_scene, to_scene_path, direction)

func get_enter_position():
	return enterPosition.global_position
