@tool
extends Resource
class_name DialogueResource

enum Characters {BoBoBones, GhostCat}

signal set_quest_status(quest, status)

@export var dialogues : Array[Dictionary]

func initialize():
	pass
