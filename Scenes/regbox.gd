extends ColorRect


func _on_regarea_triggercolor() -> void:
	if visible == true:
		set_visible(false)
	else:
		set_visible(true)
