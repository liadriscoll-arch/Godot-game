extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.coffee_win == true:
		text = "Congrats!"
	else:
		text = "Sorry!"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
