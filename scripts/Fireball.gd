extends RigidBody2D

const DIR = {
	LEFT = 0, 
	RIGHT = 1
	}

export var damage = 10
var offset_x = 50
var velocity = Vector2(200,0)
signal hit()

func _ready():
	pass
		
func shoot(var spawn, var dir, var power):
	if (dir == DIR.LEFT):
		spawn.x -= offset_x
		velocity = Vector2(-power,0)
		$AnimatedSprite.flip_h = true
	elif (dir == DIR.RIGHT):
		spawn.x += offset_x
		velocity = Vector2(power,0)
		$AnimatedSprite.flip_h = false
	
	position = spawn
	set_linear_velocity(velocity)
	
func destroy():
	queue_free()
	
func contact(body):
	set_linear_velocity(Vector2(0,0))
	sleeping = true
	$AnimatedSprite.hide()
	$CollisionPolygon2D.hide()
	$Particles2D.emitting = true
	$Explosion.start()
	if (body.get_signal_connection_list("took_damage") != []):
		body.emit_signal("took_damage", body.health - damage)
	#else:
		#print("no player has hit?")
		#print(body.get_signal_connection_list("took_damage"))
	
func _on_Timer_timeout():
	destroy()

func _on_Explosion_timeout():
	destroy()
