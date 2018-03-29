extends AnimatedSprite

var start_pos 
var screen_size
var step = 200

func _ready():
	start_pos = position
	screen_size = get_viewport_rect().size
	print(screen_size)
	print(start_pos)

func _process(delta):
	if(position.x + step*delta <= screen_size.x):
		position.x += step*delta
	else:
		position.x = start_pos.x