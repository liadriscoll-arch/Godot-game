extends Label




func _ready():
	text = str(Global.latte_price)
	visible = Global.latte_discovered
func _process(delta):
	text = str(Global.latte_price)
