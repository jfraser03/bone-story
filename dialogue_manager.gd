### Fragments script into pages, starts the StateMachine, and
### signals back up when complete
extends Node
class_name DialogueManager

@export var CHAR_LIMIT : int
@export var UI : Control

@onready var StateMachine = $StateMachine
@onready var finishedState = $StateMachine/Finished
@onready var readingState = $StateMachine/Reading
@onready var readState = $StateMachine/Read

var dialogue = []
var index = 0
var char_portrait : Node

signal script_finished

func _ready():
	finishedState.finished_reading.connect(_on_finished_reading)
	readState.finished_page.connect(_on_page_finish)
	readingState.page_reading.connect(_on_reading)
	UI.portrait_created.connect(_on_portrait_set)
	

func read_script(script):
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
	print("Done")
	script_finished.emit()

func _on_page_finish():
	if char_portrait != null:
		char_portrait.set_animation("idle")

func _on_reading():
	print("reading")
	if char_portrait != null:
		char_portrait.set_animation("talking")

func interaction_finished():
	## The high-level, multi-step interaction has been finished. Clear UI
	StateMachine._set_state("inactive")
	
func _on_portrait_set(new_portrait):
	char_portrait = new_portrait
	
