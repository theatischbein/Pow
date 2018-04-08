extends Node

onready var file = File.new()

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func load_file(path):
	if path == null:
		return
	if (!file.file_exists(path)):
		print("error exists")
		return
	file.open(path, File.READ)
	
	#load to dictonary
	var data = {}
	data = parse_json(file.get_as_text())
	file.close()
	return data

func write_file(path, data):
	if path == null or data == null:
		print("error no data or no valid path")
		return -1
		
	file.open(path, File.WRITE)
	if (file == null):
		print("file error")
		return -1
		
	if (data == null):
		print("data null")
		return -1
	
	file.store_line(to_json(data))
	file.close()
	return 0
