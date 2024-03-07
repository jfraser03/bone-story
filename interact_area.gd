extends Area2D

var sprite_y = 20

func _ready():
	interact_position = "down"

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

func set_interact_position(value: String):
	if rotations.has(value):
		self.rotation_degrees = rotations[value]
		
