extends RigidBody2D

var force = Vector2()
var direction_force = Vector2(0,0)
var acc = 1000
var max_move = 200
var max_jump = 400

func _ready():
	pass

func _integrate_forces(state):
	
	direction_force = Vector2(0,0)
	if (Input.is_action_pressed("ui_left")) :
		direction_force += Vector2(-1,0)
		$AnimatedSprite.flip_h = false;
		
	if (Input.is_action_pressed("ui_right")) :
		direction_force += Vector2(1,0)
		$AnimatedSprite.flip_h = true;
		
	if (Input.is_action_pressed("ui_up")) :
		direction_force += Vector2(0,-1)

	if (direction_force.length() > 0):
		$AnimatedSprite.play()
		$Particles2D.emitting = true
	else:
		$AnimatedSprite.stop()
		$Particles2D.emitting = false
	
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