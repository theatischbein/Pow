extends Node

#var db_path = "user://item_database.JSON"
var db_path = "res://resc/item_database.json"

func _ready():
	#Global_File_Handling.write_file(db_path, {1:"a"})
	#var item = load(db_path)
	var id = 1
	var item = get_item(id)
	if (item == null):
		print("no item?")
		return
	#print(String(id)+","+item["name"]+","+String(item["stackable"])+","+String(item["price"]))
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func get_item(id):
	var itemData = {}
	itemData = File_Handling.load_file(db_path)

	if (itemData == null):
		print("load error")
		return 
		
	if (!itemData.has(String(id))):
		print("Error: Item doesn't exists.")
		return
	itemData[String(id)]["id"] = String(id)
	return itemData[String(id)]