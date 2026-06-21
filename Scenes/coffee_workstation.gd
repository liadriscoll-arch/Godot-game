extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.drink_selected = "none"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.day_time += 1
#day ends after  2 min
	if Global.day_time >= Global.day_length:
		get_tree().change_scene_to_file("res://Scenes/coffee_game_night.tscn")
		Global.day_time = 0
	if Global.customer_line.size() >= 1:
		Global.time_taken += 1/180
