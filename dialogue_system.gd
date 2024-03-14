### Parses DialogueResource files for data and actions, and sets them in motion
extends Node
class_name InteractionSystem

@export var dialogueManager : DialogueManager
@export var UI : Control

var dialogue_resource: DialogueResource
var interaction_index: int = 0


signal quest_update(quest_id, status)
signal cutscene_start(cutscene_id)
signal interaction_complete

func _ready():
	dialogueManager.script_finished.connect(_on_script_finished)

func set_dialogue_resource(new_dialogue_resource : DialogueResource):
	interaction_index = 0
	dialogue_resource = new_dialogue_resource
	play_interaction(interaction_index)
	
func advance_dialogue():
	## If no more dialogue, reset vars and exit
	## If more dialogue, index += 1, and show dialogue
	interaction_index += 1
	if interaction_index < dialogue_resource.dialogues.size():
		play_interaction(interaction_index)
	else:
		reset()

func play_interaction(index):
	var current_entry = dialogue_resource.dialogues[index]
	if "character" in current_entry:
		SoundManager.set_speaker(current_entry["character"]["name"])
		if UI.check_portrait() == false:
			UI.add_portrait(current_entry["character"]["name"], current_entry["character"]["mood"])
		else: UI.update_portrait_mood(current_entry["character"]["mood"])
		UI.set_nametag(current_entry["character"]["display_name"])
	else:
		SoundManager.set_speaker("")
	if "text" in current_entry:
		var script = current_entry["text"]["script"]
		var effects = []
		# Tell DialogueManager# of chars to show without BBCode formatting
		if "effects" in current_entry["text"]:
			effects = current_entry["text"]["effects"]
		dialogueManager.set_script_effects(effects)
		dialogueManager.set_script_speed(current_entry["text"]["speed"])
		dialogueManager.read_script(script)
		
	if "quest_update" in current_entry:
		# quest_update.emit(current_entry["quest_update"])
		## This is where we talk to the QuestSystem
		pass
	if "cutscene" in current_entry:
		# cutscene_start.emit(current_entry["cutscene"])
		pass
	
func reset():
	# Get rid of ui and reset vars
	interaction_index = 0
	dialogue_resource = null
	interaction_complete.emit()

func _on_script_finished():
	## Handle 'next-steps' logic to wrap up script and advance to next
	advance_dialogue()
