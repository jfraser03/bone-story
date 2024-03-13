extends DialogueResource

func initialize():
	dialogues = [
		{
			"character": {
				"name" : "ghostcat",
				"display_name" : "Ghost Cat",
				"mood" : "neutral"
			},
			"text": {
				"script" : "I'm afraid of the dark.",
				"effect" : null,
				"speed" : TextSpeed["slow"]
				}
		},
		{
			"character": {
				"name" : "ghostcat",
				"display_name" : "Ghost Cat",
				"mood" : "happy"
			},
			"text": {
				"script" : "But I am strong enough to kill a full sized skeleton for food.", ## Should be link to the dialogue localization file
				"effect" : null,
				"speed" : TextSpeed["fast"]
				}
		}
	]
