extends MarginContainer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var player_max_health = $"../../Player".max_health
	$HBoxContainer/Bars/Bar/Progress.max_value = player_max_health
	update_health(player_max_health)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Player_took_damage(health):
	update_health(health)


func _on_Player_die():
	$HBoxContainer.hide()

func update_health(health):
	$HBoxContainer/Bars/Bar/Count/BG/Count.text = str(health)
	$HBoxContainer/Bars/Bar/Progress.value = health