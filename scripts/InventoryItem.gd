extends TextureRect

const TYPE = {
	misc = 0,
	consumable = 1,
	weapon = 2
	}

export var id = 0
export var itemName = ""
export var type = TYPE.misc
export var stackable = false
export var weight = 0.0
export var price = 0
export var amount = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
