extends Node2D

@onready var UI = $UI
@export var Bonesly : CharacterBody2D

func _ready():
	Bonesly.interacted.connect(text_box_message)

func text_box_message(message):
	var pages = create_pages(message)
	print(pages)
	#UI.set_message(pages)
	
func create_pages(message):
	var pages = []
	var char_limit = 50
	var words = message.split(" ")
	
	var current_page = ""
	var current_length = 0
	for word in words:
		if current_length + word.length() + 1 > char_limit:
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
