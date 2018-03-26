extends MarginContainer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var player_max_health = $"../../Player".max_health
	$VBoxContainer/HBoxContainer/Bars/Bar/Progress.max_value = player_max_health
	update_health(player_max_health)
	
	var player_max_power = $"../../Player".max_power
	var player_min_power = $"../../Player".min_power
	$VBoxContainer/Power/Progress.max_value = player_max_power
	$VBoxContainer/Power/Progress.min_value = player_min_power
	$VBoxContainer/Power.hide()
	update_power(player_min_power)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Player_took_damage(health):
	update_health(health)


func _on_Player_die():
	$HBoxContainer.hide()

func update_health(health):
	$VBoxContainer/HBoxContainer/Bars/Bar/Count/BG/Count.text = str(health)
	$VBoxContainer/HBoxContainer/Bars/Bar/Progress.value = health
	
func update_power(power):
	$VBoxContainer/Power/Progress.value = power

func _on_Player_load_power(power):
	if ($VBoxContainer/Power.visible != true):
		$VBoxContainer/Power.show()
	else:
		print($VBoxContainer/Power.visible)
	update_power(power)


func _on_Player_shoot():
	$VBoxContainer/Power.hide()
