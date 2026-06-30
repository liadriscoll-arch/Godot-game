extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !Global.endless:
		text = "You ended with " + str(Global.coffee_money) + " Credits"
	else:
		text = "You survived " + str(Global.coffee_week) + " weeks" + "\r" + "and " + str(Global.coffee_day % 7) + " days!"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
