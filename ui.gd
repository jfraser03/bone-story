extends Control

@onready var label = $Panel/Label
@onready var panel = $Panel

var character_limit = 84

signal textbox_finished

func set_message(message):
	var pages = message.length() / character_limit
	
	
	
	panel.set_visible(true)
	label.set_visible_ratio(0)
	label.set_text(message)
	
	var tween = get_tree().create_tween()
	tween.tween_property(label, "visible_ratio", 1.0, 1.5)
	
func _on_tween_completed():
	await get_tree().create_timer(2).timeout
	panel.set_visible(false)
	textbox_finished.emit()
