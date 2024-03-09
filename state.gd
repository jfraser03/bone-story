extends Node
class_name State

signal play_animation(state)
signal change_state(state)
signal direction_change(direction : String)
signal interacting

func _enter_state():
	pass

func _exit_state():
	pass

func _update(delta, Actor):
	pass

func _state_update(delta, Actor):
	pass
