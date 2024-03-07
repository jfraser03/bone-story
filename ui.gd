extends Control

@onready var label = $Panel/Label
@onready var panel = $Panel

signal textbox_finished

func set_message(message):
	panel.set_visible(true)
	label.set_visible_characters(0)
	label.set_text(message)
	
	var tween = get_tree().create_tween()
	var chars = label.text.length()
	tween.tween_property(label, "visible_characters", chars, 1)
	
func _on_tween_completed():
	await get_tree().create_timer(2).timeout
	panel.set_visible(false)
	textbox_finished.emit()
