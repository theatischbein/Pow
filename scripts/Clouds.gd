extends TextureRect

const max_s = 3
const step = 0.2

var start_scale
var start_pos

func _ready():
	start_pos = rect_position
	start_scale = rect_scale

func _process(delta):
	
		if (rect_scale.x + step*delta <= max_s):
			rect_scale.x += step*delta
			rect_scale.y += step*delta
			rect_position.x += delta*step*1000
		else:
			rect_scale = start_scale
			rect_position = start_pos
	
