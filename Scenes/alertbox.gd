extends Label


func _on_cabinetarea_invfull() -> void:
	set_text("Alerts:\n inventory full!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\n inventory full!":
		set_text("Alerts:\n")

func _on_trasharea_action() -> void:
	set_text("Alerts:\n inventory emptied!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\n inventory emptied!":
		set_text("Alerts:\n")

func _on_fridgearea_invfull() -> void:
	set_text("Alerts:\n inventory full!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\n inventory full!":
		set_text("Alerts:\n")


func _on_trash_2_area_action() -> void:
	set_text("Alerts:\n inventory emptied!")
	await get_tree().create_timer(1.0).timeout
	if get_text() == "Alerts:\n inventory emptied!":
		set_text("Alerts:\n")
