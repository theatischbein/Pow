extends MarginContainer

onready var player = get_node("../../Player")
onready var itemlist = get_node("CenterContainer/ItemList")
func _ready():
	pass

func _process(delta):
	if (Input.is_action_just_released("toogle_inventory")):
		if (visible):
			hide()
			get_tree().paused = false
		else:
			update_inventory()
			show()
			get_tree().paused = true

func update_inventory():
	itemlist.clear()
	for slot in range(0, player.max_slots-1):
		var item = player.inventory[String(slot)]
		var itemData = Inventory_DB.get_item(item["id"])
		if (itemData == null):
			print("itemData couldnt be loaded")
			return
		var icon = load(itemData["icon"])
		var amount = int(item["amount"])
		
		
		if (item["id"] == 0):
			amount = " "
		itemlist.add_item(amount, icon)
		itemlist.set_item_metadata(slot, itemData)
		itemlist.set_item_text(slot, itemData["name"])

