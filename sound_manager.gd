extends Node

var soundConsoleScene = preload("res://SoundConsole.tscn")

var soundConsole : SoundConsole

var speaker : String
var TEXT_BLOOP = preload("res://text-blip.wav")

func _ready():
	soundConsole = soundConsoleScene.instantiate()
	add_child(soundConsole)
	speaker = ""

func play_sfx(sound):
	soundConsole.play_sfx(sound)

func play_music(sound):
	soundConsole.play_music(sound)

func play_text_sound():
	if speaker == "":
		soundConsole.play_textAudio(TEXT_BLOOP)
