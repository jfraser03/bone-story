extends Node

var dialogue_resource: DialogueResource
var current_dialogue_index: int = 0

signal quest_update(quest_id, status)
signal cutscene_start(cutscene_id)

func set_dialogue_resource(d : DialogueResource):
	current_dialogue_index = 0
	dialogue_resource = d
	show_current_dialogue()
	
func advance_dialogue():
	## If no more dialogue, reset vars and exit
	## If more dialogue, index += 1, and show dialogue
	pass

func show_current_dialogue():
	var current_entry = dialogue_resource.dialogues[current_dialogue_index]
	if "character" in current_entry:
		# Set character voice in sound manager
		# Set character portrait
		# Set name tag
		pass
	if "text" in current_entry:
		#dialogueManager.read_script(current_entry["text"])
		pass
	if "quest_update" in current_entry:
		# quest_update.emit(current_entry["quest_update"])
		## This is where we talk to the QuestSystem
		pass
	if "cutscene" in current_entry:
		# cutscene_start.emit(current_entry["cutscene"])
	# await script_finished
	
func reset():
	# Get rid of ui and reset vars
	current_dialogue_index = 0
	dialogue_resource = null
