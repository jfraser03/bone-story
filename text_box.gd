extends Panel

@onready var label = $Label
@onready var bookmark = $Bookmark

var character_limit = 84
var message_pages = []
var page_finished = false
var index = 0

signal textbox_finished

var current_state
enum states {
	READ,
	READING
}

func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		next()
		

func set_message(pages):
	message_pages = pages
	index = 0
	page_finished = false
	set_visible(true)
	if pages.size() > 1:
		bookmark.set_text("v")
	else:
		bookmark.set_text("o")
		
	read_page(pages[0])
	

func next():
	if current_state == states.READ:
		index += 1
		if index < message_pages.size():
			read_page(message_pages[index])
		else:
			end_message()
	elif current_state == states.READING:
		label.visible_ratio = 1
	
func read_page(page):
	current_state = states.READING
	bookmark.set_visible(false)
	if index < message_pages.size():
		bookmark.set_text("v")
	else:
		bookmark.set_text("o")
		
	label.set_visible_characters(0)
	label.set_text(page)
	var i = 1
	for char in page:
		label.set_visible_characters(i)
		i += 1
		if char == " ":
			await get_tree().create_timer(0.02).timeout
		else:
			await get_tree().create_timer(0.035).timeout
	current_state = states.READ
	
func end_message():
	set_visible(false)
	textbox_finished.emit()
