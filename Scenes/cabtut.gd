extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Chefglobal.mode == 0:
		set_visible(true)
