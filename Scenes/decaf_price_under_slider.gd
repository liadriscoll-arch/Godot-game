extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = str(Global.decaf_price)



func _process(delta):
	text = str(Global.decaf_price)
