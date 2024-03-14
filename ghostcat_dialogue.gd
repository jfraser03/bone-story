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
				"script" : "Last night I visited your grave.",
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
				"script" : "And I fricking threw up.",
				"effects" : ["shake"],
				"speed" : TextSpeed["fast"]
				}
		},
		{
			"character": {
				"name" : "ghostcat",
				"display_name" : "Ghost Cat",
				"mood" : "happy"
			},
			"text": {
				"script" : "But throwing up isn't so bad! After a while it actually feels pretty nice!!", ## Should be link to the dialogue localization file
				"speed" : TextSpeed["medium"]
				}
		},
		{
			"character": {
				"name" : "ghostcat",
				"display_name" : "Ghost Cat",
				"mood" : "happy"
			},
			"text": {
				"script" : "I could probably throw up again today and be pretty brave about it.",
				"speed" : TextSpeed["medium"]
				}
		},
		{
			"character": {
				"name" : "ghostcat",
				"display_name" : "Ghost Cat",
				"mood" : "happy"
			},
			"text": {
				"script" : "Happy birthday by the way!! I hope you enjoy your birthday cake.",
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
				"script" : "I hope you don't choke on it.",
				"effects" : ["shake"],
				"speed" : TextSpeed["fast"]
				}
		},
	]
