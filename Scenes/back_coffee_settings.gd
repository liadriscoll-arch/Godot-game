extends Button





func _on_pressed() -> void:
	Global.coffee_difficulty = 1
	Global.endless = false
	get_tree().change_scene_to_file("res://Scenes/coffee_instructions.tscn")
