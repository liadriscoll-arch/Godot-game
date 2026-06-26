extends Label

func _process(delta: float) -> void:
	set_text("In inventory:\n" + Chefglobal.inventory)


func _on_trasharea_action() -> void:
	set_text("In inventory:\n" + Chefglobal.inventory)


func _on_trash_2_area_action() -> void:
	set_text("In inventory:\n" + Chefglobal.inventory)
