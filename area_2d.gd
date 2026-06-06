extends Area2D

var player_near = false


func _on_body_entered(body):
	if body.name == "Fella":
		player_near = true
		


func _on_body_exited(body):
	
	if body.name == "Fella":
		player_near = false
		

func _process(delta):
	if player_near and Input.is_action_just_pressed("ui_down"):
		get_tree().change_scene_to_file("res://Scenes/coffee_instructions.tscn")
