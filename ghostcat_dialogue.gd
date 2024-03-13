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
				"script" : "My thoughts travel to a dark place.",
				"effects" : ["shake"],
				"speed" : TextSpeed["medium"]
				}
		},
		{
			"character": {
				"name" : "ghostcat",
				"display_name" : "Ghost Cat",
				"mood" : "neutral"
			},
			"text": {
				"script" : "You grow old. Is your soul too weathered now for my consumption?",
				"effects" : ["shake"],
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
				"script" : "Happy birthday by the way!!", ## Should be link to the dialogue localization file
				"speed" : TextSpeed["medium"]
				}
		}
	]
