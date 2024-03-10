extends Node
var implements = Interface.InteractableInterface

var interactor : Node


@export_multiline var message : String

signal interacted(interactor, interactee)
signal submit_dialogue(message)

func interact(interact_requester: Node):
	interactor = interact_requester
	interactor.set_interacting()
	interacted.emit(interactor, self)
	submit_dialogue.emit(message)
	
