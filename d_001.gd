extends DialogueResource

func _init():
	self.dialogues = [
		{
			"character": ["GhostCat", "Chill"],
			"text": "I like bones. And the dark"
		},
		{
			"signal": ["set_quest_status", ["Q_001", "active"]]
		}
	]
