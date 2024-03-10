extends Node
class_name DialogueManager

### Callable object that breaks script into pages, starts the StateMachine, and
### signals up when complete


@export var CHAR_LIMIT : int

@onready var StateMachine = $StateMachine
@onready var inactiveState = $StateMachine/Inactive

var dialogue = []
var index = 0

signal dialogue_over

func _ready():
	inactiveState.finished_reading.connect(_on_finished_reading)
	

func _begin_dialogue(script):
	index = 0
	dialogue = create_pages(script)
	StateMachine._set_state('reading')
	
func create_pages(script):
	var pages = []
	var words = script.split(" ")
	
	var current_page = ""
	var current_length = 0
	for word in words:
		if current_length + word.length() + 1 > CHAR_LIMIT:
			# Finish this page
			pages.append(current_page.strip_edges(true))
			# Start a new page
			current_page = word + " "
			current_length = word.length() + 1
		else:
			# Add word to current page
			current_page += word + " "
			current_length += word.length() + 1
	if current_page != "":
		pages.append(current_page.strip_edges(true))
	
	return pages

func _get_dialogue():
	return dialogue

func _get_index():
	return index

func _set_index(value):
	index = value

func _on_finished_reading():
	dialogue_over.emit()
