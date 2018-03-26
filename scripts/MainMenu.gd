extends VBoxContainer

var index = 0

func _ready():
	next()

func _process(delta):
	if (Input.is_action_just_pressed("ui_up")):
		next()
	if (Input.is_action_just_pressed("ui_down")):
		next()
	if (Input.is_action_just_released("ui_accept")):
		if (index == 1):
			get_tree().change_scene("res://scene/Level.tscn")
		elif (index == 0):
			pass
		
func next():
	if (index == 0):
		$SelectBox/Selected.visible = false
		$StartBox/Selected.visible = true
		index = 1
	elif (index == 1):
		$SelectBox/Selected.visible = true
		$StartBox/Selected.visible = false
		index = 0
