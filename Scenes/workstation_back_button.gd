extends TextureButton





func _on_pressed() -> void:
	if !Global.brewing:
		get_tree().change_scene_to_file("res://Scenes/coffee_game_day.tscn")
	else: 
		return
