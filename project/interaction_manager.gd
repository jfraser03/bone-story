### Handles interaction requests between objects and players
extends Node
class_name InteractionManager

@export var dialogueManager : DialogueManager
@export var interactionSystem : InteractionSystem

var interact_player : Node
var interactables : Array

func _ready():
	for node in get_tree().get_nodes_in_group("Interactable"):
		if Interface.node_implements_interface(node, Interface.InteractableInterface):
			interactables.append(node)
			node.interacted.connect(_on_interacted)
			node.submit_dialogue.connect(_on_dialogue_request)
	interactionSystem.interaction_complete.connect(_on_interaction_over)

func _on_interacted(interactor: Node, interactee: Node):
	interact_player = interactor
	interactor.set_interacting()

func _on_dialogue_request(dialogueResource : DialogueResource):
	interactionSystem.set_dialogue_resource(dialogueResource)
	
func _on_interaction_over():
	interact_player.interaction_finished()
	dialogueManager.interaction_finished()
	
