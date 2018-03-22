extends VBoxContainer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass




func _on_SelectBox_focus_exited():
	$SelectBox.hide()

func _on_StartBox_focus_exited():
	$SelectBox.hide()

func _on_StartBox_focus_entered():
	$StartBox.show()

func _on_SelectBox_focus_entered():
	$SelectBox.show()
