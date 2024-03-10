extends Area2D

var rotations = {
	"down": 0,
	"down_right": -45,
	"right": -90,
	"up_right": -135,
	"up": 180,
	"down_left": 45,
	"left": 90,
	"up_left": 135
}

var interact_position:
	set(value):
		set_interact_position(value)
		
func _ready():
	interact_position = "down"

func set_interact_position(value: String):
	if rotations.has(value):
		self.rotation_degrees = rotations[value]
		
