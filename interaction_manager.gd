extends Node
class_name InteractionManager

@export var dialogueManager : DialogueManager

var interact_player : Node
var interactables : Array

func _ready():
	for node in get_tree().get_nodes_in_group("Interactable"):
		if Interface.node_implements_interface(node, Interface.InteractableInterface):
			interactables.append(node)
			node.interacted.connect(_on_interacted)
			node.submit_dialogue.connect(_on_dialogue_request)
	dialogueManager.dialogue_over.connect(_on_dialogue_over)

func _on_interacted(interactor: Node, interactee: Node):
	interact_player = interactor
	interactor.set_interacting()

func _on_dialogue_request(message : String):
	dialogueManager._begin_dialogue(message)
	
func _on_dialogue_over():
	interact_player.interaction_finished()
	
