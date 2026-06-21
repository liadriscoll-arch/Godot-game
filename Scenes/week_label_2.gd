extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = Global.endless
	text = str(Global.coffee_week)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
