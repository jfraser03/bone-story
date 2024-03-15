@tool
extends Resource
class_name DialogueResource

enum Characters {BoBoBones, GhostCat}
const TextSpeed = {
	"slow" : 0.1,
	"medium" : 0.05,
	"fast" : 0.025
}

signal set_quest_status(quest, status)

@export var dialogues : Array[Dictionary]

func initialize():
	pass
