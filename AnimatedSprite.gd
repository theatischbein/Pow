extends AnimatedSprite


export (int) var SPEED  # how fast the player will move (pixels/sec)
var velocity = Vector2()  # the player's movement vector
var screensize  # size of the game window

func _ready():
	screensize = get_viewport_rect().size
	#hide()
	set_process(true)

func _process(delta):
	print(position)
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1000
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		play()
	else:
		stop()
	
	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	
