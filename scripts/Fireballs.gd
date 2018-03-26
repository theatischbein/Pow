extends Timer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export (PackedScene) var Fireball

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Fireballs_timeout():
	var fire = Fireball.instance()
	get_parent().add_child(fire)
	var pos = $"../Player".position
	pos.x -= 100
	fire.shoot(pos, 1, 200)
