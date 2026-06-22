extends Label

func _ready() -> void:
	if Chefglobal.mode == 0:
		set_visible(true)
