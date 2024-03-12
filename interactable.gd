extends Node
var implements = Interface.InteractableInterface

var interactor : Node

@export var dialogue_resource : DialogueResource:
	set(value):
		dialogue_resource = value
		dialogue_resource.initialize()

signal interacted(interactor, interactee)
signal submit_dialogue(dialogue_resource)

func interact(interact_requester: Node):
	interactor = interact_requester
	interactor.set_interacting()
	interacted.emit(interactor, self)
	submit_dialogue.emit(dialogue_resource)
