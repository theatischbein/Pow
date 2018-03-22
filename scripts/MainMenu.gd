extends MarginContainer

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
		$HBoxContainer/VBoxContainer/Menu/SelectBox/Selected.hide()
		$HBoxContainer/VBoxContainer/Menu/StartBox/Selected.show()
		index = 1
	elif (index == 1):
		$HBoxContainer/VBoxContainer/Menu/SelectBox/Selected.show()
		$HBoxContainer/VBoxContainer/Menu/StartBox/Selected.hide()
		index = 0
