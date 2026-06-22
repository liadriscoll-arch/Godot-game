extends Button


func _on_pressed() -> void:
	Chefglobal.mode = 1
	get_tree().change_scene_to_file("res://Scenes/chef_game.tscn")
