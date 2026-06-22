extends ColorRect


func _on_fryerarea_triggercolor() -> void:
	if visible == true:
		set_visible(false)
	else:
		set_visible(true)
