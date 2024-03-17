extends Camera2D

@onready var TopLeft = $Boundaries/TopLeft
@onready var BottomRight = $Boundaries/BottomRight

func _ready():
	pass
	#limit_left = TopLeft.position.x
	#limit_right = BottomRight.position.x
	#limit_bottom = BottomRight.position.y
	#limit_top = TopLeft.position.y
