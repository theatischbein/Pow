extends Node2D

export (PackedScene) var Fireball

const DIR = {
	LEFT = 0, 
	RIGHT = 1
	}

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _process(delta):
	if (Input.is_action_just_pressed("ui_accept")):
		var fire = Fireball.instance()
		add_child(fire)
		fire.shoot($Player.position, $Player.last_dir)