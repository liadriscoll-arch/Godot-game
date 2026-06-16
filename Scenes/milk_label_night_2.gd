extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = Global.latte_discovered
	text = str(Global.coffee_milk)

func _process(delta):
	visible = Global.latte_discovered
	text = str(Global.coffee_milk)
