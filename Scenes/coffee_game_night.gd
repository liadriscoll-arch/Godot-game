extends Node2D

func _ready() -> void:
	
	Global.customer_line.clear()
	if Global.coffee_money >= Global.quota and Global.coffee_day == 7:
		Global.coffee_complete = true
		Global.coffee_win = true
		get_tree().change_scene_to_file("res://Scenes/coffee_instructions.tscn")
		
	Global.coffee_day += 1
	for i in range(Global.ads.size()):
		Global.ads[i] -= 1

	Global.ads = Global.ads.filter(func(days): return days > 0)
	
