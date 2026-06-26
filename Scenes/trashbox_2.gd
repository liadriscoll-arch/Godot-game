extends ColorRect


func _on_trash_2_area_triggercolor() -> void:
	if visible == true:
		set_visible(false)
	else:
		set_visible(true)
