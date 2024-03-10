extends Node
var implements = Interface.InteractableInterface

var interactor : Node


@export_multiline var message : String

signal interacted(node, message)

func interact(interact_requester: Node):
	interactor = interact_requester
	interacted.emit(self, message)
	
	
func interaction_complete():
	interactor.interaction_finished()
