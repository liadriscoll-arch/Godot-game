extends Button

func _on_pressed() -> void:
	Chefglobal.mode = 0
	get_tree().change_scene_to_file("res://Scenes/chef_tutorial.tscn")
