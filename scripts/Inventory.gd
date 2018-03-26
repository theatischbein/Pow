extends MarginContainer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	pass

func _process(delta):
	if (Input.is_action_just_released("toogle_inventory")):
		if (visible):
			hide()
			get_tree().paused = false
		else:
			show()
			get_tree().paused = true