extends Control

signal textbox_finished
@onready var textBox = $TextBox

func _ready():
	textBox.textbox_finished.connect(_on_textbox_finished)

func _on_textbox_finished():
	textbox_finished.emit()
