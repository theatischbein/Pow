extends RigidBody2D

export (PackedScene) var Fireball
export var max_health = 100
export var health = 50
export var max_power = 800
export var min_power = 250

signal die()
signal took_damage()
signal load_power()
signal shoot()

const DIR = {
	LEFT = 0, 
	RIGHT = 1
	}


export var last_dir = DIR.RIGHT
var force = Vector2()
var direction_force = Vector2()
var acc
var max_move
var max_jump
var power


func _ready():
	direction_force = Vector2(0,0)
	acc = 1000
	max_move = 200
	max_jump = 400
	power = 250
	health = 100

func _process(delta):
	if (Input.is_action_pressed("ui_left")) :
		last_dir = DIR.LEFT
		$AnimatedSprite.flip_h = true;
		
	if (Input.is_action_pressed("ui_right")) :
		last_dir = DIR.RIGHT
		$AnimatedSprite.flip_h = false;
		
	if (Input.is_action_pressed("ui_accept")):
		if(power < max_power):
			power += 10
			emit_signal("load_power", power)
	if (Input.is_action_just_released("ui_accept")):
		var fire = Fireball.instance()
		get_parent().add_child(fire)
		fire.shoot(position, last_dir, power)
		power = min_power		
		emit_signal("load_power", power)
		emit_signal("shoot")
	
func update_health(new_health):
	health = new_health
	
func _integrate_forces(state):
	
	direction_force = Vector2(0,0)
	if (Input.is_action_pressed("ui_left")) :
		direction_force += Vector2(-1,0)
		
	if (Input.is_action_pressed("ui_right")) :
		direction_force += Vector2(1,0)
		
	if (Input.is_action_pressed("ui_up")) :
		direction_force += Vector2(0,-1)
			
	if (direction_force.length() > 0):
		$AnimatedSprite.play()
		$Particles2D.emitting = true
	else:
		$AnimatedSprite.stop()
		$AnimatedSprite.frame = 0
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

func _on_Player_took_damage(new_health):
	if(new_health > 0):
		update_health(new_health)
	else:
		emit_signal("die")


func _on_Player_die():
	queue_free()
	##DEBUG
	$"../Fireballs".stop()
