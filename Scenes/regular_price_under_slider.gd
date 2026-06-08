extends Label

func _ready():
	text = str(Global.regular_price)
	
func _process(delta):
	text = str(Global.regular_price)
