extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = str(100 * Global.coffee_week)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
