extends Area2D


var positions = {
	"down": {"position": Vector2(0, 26), "rotation": 0},
	"down_right": {"position": Vector2(10, 22), "rotation": -45},
	"right": {"position": Vector2(16, 12), "rotation": 90},
	"up_right": {"position": Vector2(10, 0), "rotation": -135},
	"up": {"position": Vector2(0, 0), "rotation": -180},
	"up_left": {"position": Vector2(-12, 0), "rotation": -225},
	"left": {"position": Vector2(-18, 12), "rotation": -270},
	"down_left": {"position": Vector2(-12, 22), "rotation": -315}
}

var interact_position:
	set(value):
		set_interact_position(value)

func set_interact_position(value: String):
	if positions.has(value):
		self.position = positions[value]["position"]
		self.rotation = positions[value]["rotation"]
