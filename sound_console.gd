extends Node
class_name SoundConsole

var Speaker : CharacterBody2D

@onready var SFX = $SFX
@onready var Music = $Music
@onready var textAudio = $TextAudio

func _ready():
	for channel in SFX.get_children():
		if channel is AudioStreamPlayer:
			channel.finished.connect(_on_stream_finished.bind(channel))
			
	textAudio.finished.connect(_on_stream_finished.bind(textAudio))

func play_SFX(sfx):
	for channel in SFX.get_children():
		if channel.stream == null:
			channel.set_stream(sfx)
			channel.play()
			break
	
func play_textAudio(sfx):
	if textAudio:
		textAudio.set_stream(sfx)
		textAudio.play()
	
func _on_stream_finished(channel : AudioStreamPlayer):
	channel.set_stream(null)
