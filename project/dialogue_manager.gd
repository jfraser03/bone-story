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
var script_effects = []

var text_effects = {
	"shake" : {
		"intro" : "[shake rate=15.0 level=1connected=1]",
		"outro" : "[/shake]"
	}
}

signal script_finished

func _ready():
	finishedState.finished_reading.connect(_on_finished_reading)
	readState.finished_page.connect(_on_page_finish)
	readingState.page_reading.connect(_on_reading)
	UI.portrait_created.connect(_on_portrait_set)
	

func read_script(script : String):
	index = 0
	dialogue = create_pages(script)
	StateMachine._set_state('reading')
	
func create_pages(script : String):
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
	
func set_script_effects(new_effects: Array):
	# Create dict called text_effects which contains a script with all custom effect resources {"shake": shake_text.tres}
	# Use the effects parameter to search the resource, and apply it to the RichTextLabel
	script_effects = new_effects

func set_script_speed(speed : float):
	readingState.set_speed(speed)
	
func _get_dialogue() -> Array:
	if script_effects == []: return dialogue
	var new_dialogue = []
	var bbc_intro = ""
	var bbc_outro = ""
	for effect in script_effects:
		if effect in text_effects:
			bbc_intro = text_effects[effect]["intro"]
			bbc_outro = text_effects[effect]["outro"]
	# Currently not supporting multiple effects. Need to stack BBC intros and outros programatically
	for page in dialogue:
		var formatted_script = bbc_intro + page + bbc_outro
		new_dialogue.append(formatted_script)
	return new_dialogue	

func get_script_length():
	return dialogue[index].length()

func _get_index():
	return index

func _set_index(value : int):
	index = value

func _on_finished_reading():
	script_finished.emit()

func _on_page_finish():
	if char_portrait != null:
		char_portrait.set_state("idle")
		char_portrait.play_animation()

func _on_reading():
	if char_portrait != null:
		char_portrait.set_state("talking")
		char_portrait.play_animation()

func interaction_finished():
	## The high-level, multi-step interaction has been finished. Clear UI
	StateMachine._set_state("inactive")
	
func _on_portrait_set(new_portrait):
	char_portrait = new_portrait
	
