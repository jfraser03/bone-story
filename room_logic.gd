extends Node2D

@onready var dialogueManager = $DialogueManager
@export var Bonesly : CharacterBody2D

func _ready():
	for i in get_children():
		if Interface.node_implements_interface(i, Interface.InteractableInterface):
			i.interacted.connect(_interaction_handle)
	dialogueManager.dialogue_over.connect(_on_interaction_over)
		
func _interaction_handle(node, message):
	dialogueManager._begin_dialogue(message)
	# Tell sound manager who is talking
	# Tell UI what to set the pages to
	
func _on_interaction_over():
	Bonesly.interaction_finished()
