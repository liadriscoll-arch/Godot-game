extends Label



func _ready():
	visible = Global.latte_discovered
	text = str(Global.latte_price)

func _process(delta):
	text = str(Global.latte_price)
