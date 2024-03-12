extends Node

var soundConsoleScene = preload("res://SoundConsole.tscn")

var soundConsole : SoundConsole

var speaker : String
var TEXT_BLOOP = preload("res://text-blip.wav")
var FOOTSTEPS = [preload("res://footstep_1.wav"), preload("res://footstep_2.wav"), preload("res://footstep_3.wav")]

func _ready():
	soundConsole = soundConsoleScene.instantiate()
	add_child(soundConsole)
	speaker = ""

func play_sfx(sound):
	soundConsole.play_SFX(sound)

func play_music(sound):
	soundConsole.play_music(sound)

func play_text_sound():
	if speaker == "":
		soundConsole.play_textAudio(TEXT_BLOOP)

func set_speaker(new_speaker):
	speaker = new_speaker
