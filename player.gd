extends RigidBody2D

const DIR = {
	LEFT = 0, 
	RIGHT = 1
	}

export var last_dir = DIR.LEFT
var force = Vector2()
var direction_force = Vector2(0,0)
var acc = 1000
var max_move = 200
var max_jump = 400

func _ready():
	pass

func _process(delta):
	if (Input.is_action_pressed("ui_left")) :
		last_dir = DIR.LEFT
		$AnimatedSprite.flip_h = true;
		
	if (Input.is_action_pressed("ui_right")) :
		last_dir = DIR.RIGHT
		$AnimatedSprite.flip_h = false;
		
	if (direction_force.length() > 0):
		$AnimatedSprite.play()
		$Particles2D.emitting = true
	else:
		$AnimatedSprite.stop()
		$AnimatedSprite.frame = 0
		$Particles2D.emitting = false
func _integrate_forces(state):
	
	direction_force = Vector2(0,0)
	if (Input.is_action_pressed("ui_left")) :
		direction_force += Vector2(-1,0)
		
	if (Input.is_action_pressed("ui_right")) :
		direction_force += Vector2(1,0)
		
	if (Input.is_action_pressed("ui_up")) :
		direction_force += Vector2(0,-1)


	force = state.get_linear_velocity() + direction_force * acc
	
	if (force.x > max_move):
		force.x = max_move
	elif (force.x < -max_move):
		force.x = -max_move

	if (force.y > max_jump):
		force.y = max_jump
	elif (force.y < -max_jump):
		force.y = -max_jump
	
	state.set_linear_velocity(force)