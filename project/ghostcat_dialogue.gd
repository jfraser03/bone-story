extends DialogueResource

func initialize():
	dialogues = [
		{
			"character": {
				"name" : "ghostcat",
				"display_name" : "Ghost Cat",
				"mood" : "shocked"
			},
			"text": {
				"script" : "WOAH!!!",
				"speed" : TextSpeed["fast"]
				}
		},
		{
			"character": {
				"name" : "ghostcat",
				"display_name" : "Ghost Cat",
				"mood" : "shocked"
			},
			"text": {
				"script" : "Am I dead??",
				"effects" : ["shake"],
				"speed" : TextSpeed["medium"]
				}
		},
		{
			"character": {
				"name" : "ghostcat",
				"display_name" : "Ghost Cat",
				"mood" : "scared"
			},
			"text": {
				"script" : "Aw man that's not a.. *gulp * .. cockroach following you around, is it?",
				"speed" : TextSpeed["slow"]
				}
		},
		{
			"character": {
				"name" : "ghostcat",
				"display_name" : "Ghost Cat",
				"mood" : "angry"
			},
			"text": {
				"script" : "I COULD TOTALLY STOMP THAT LITTLE LOSER.", ## Should be link to the dialogue localization file
				"effects" : ["shake"],
				"speed" : TextSpeed["fast"]
				}
		},
		{
			"character": {
				"name" : "ghostcat",
				"display_name" : "Ghost Cat",
				"mood" : "sad"
			},
			"text": {
				"script" : ".... Sorry. I've been trying to work on my people and bug skills.", ## Should be link to the dialogue localization file
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
				"script" : "Whatever though. People suck and bugs suck.",
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
				"mood" : "shocked"
			},
			"text": {
				"script" : "I hope you don't choke on it.",
				"effects" : ["shake"],
				"speed" : TextSpeed["fast"]
				}
		},
	]
