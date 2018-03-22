extends TextureRect

# class member variables go here, for example:
const MIN_X = 1
const MIN_Y = 1
const MAX_X = 2
const MAX_Y = 3
var incr = 1
var dir = 1

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	if (dir == 1):
		if ((rect_scale.x + incr * delta <= MAX_X) and (rect_scale.y + incr * delta <= MAX_Y)):
			rect_scale.x += incr * delta /6
			rect_scale.y += incr * delta /6
		else:
			dir = -1
	if (dir == -1):
		if ((rect_scale.x - incr * delta >= MIN_X) and (rect_scale.y - incr * delta >= MIN_Y)):
			rect_scale.x -= incr * delta /6
			rect_scale.y -= incr * delta /6
		else:
			dir = 1
