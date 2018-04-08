extends MarginContainer

onready var player = get_node("../../Player")
onready var itemList = get_node("CenterContainer/GridContainer")
export (PackedScene) var InventoryItem

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
	for child in itemList.get_children():
		itemList.remove_child(child)
		child.queue_free()
		
	for slot in range(0, player.max_slots-1):
		var item = player.inventory[String(slot)]
		var itemData = Inventory_DB.get_item(item["id"])
		if (itemData == null):
			print("itemData couldnt be loaded")
			return
		var icon = null
		if (itemData["icon"] != ""):
			icon = load(itemData["icon"])
		var amount = int(item["amount"])
		
		
		if (item["id"] == 0):
			amount = " "
		var newItem = InventoryItem.instance()
		newItem.amount = amount
		if (icon != null):
			newItem.texture = icon
		else:
			newItem.texture = null
		newItem.id = itemData["id"]
		newItem.itemName = itemData["name"]
		newItem.weight = itemData["weight"]
		newItem.price = itemData["price"]
		newItem.stackable = itemData["stackable"]
		
		var text_amount = newItem.get_child(0)
		text_amount.text = String(amount)
		itemList.add_child(newItem)

func add_item(item_id):
	pass