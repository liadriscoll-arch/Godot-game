extends Node2D

func _ready() -> void:
	
	Global.customer_line.clear()
	if Global.coffee_money >= Global.quota and Global.coffee_day == 7 and !Global.endless:
		Global.coffee_complete = true
		Global.coffee_win = true
		get_tree().change_scene_to_file("res://Scenes/coffee_end_screen.tscn")
	elif Global.coffee_money < Global.quota and Global.coffee_day == 7 and !Global.endless:
		Global.coffee_complete = true
		Global.coffee_false = true
		get_tree().change_scene_to_file("res://Scenes/coffee_end_screen.tscn")
	elif Global.endless and Global.coffee_day % 7 == 0 and Global.coffee_money < Global.quota:
		Global.coffee_complete = true
		get_tree().change_scene_to_file("res://Scenes/coffee_end_screen.tscn")
	elif Global.endless and Global.coffee_day % 7 == 0 and Global.coffee_money >= Global.quota:
		update_quota()
		
	Global.coffee_day += 1
	for i in range(Global.ads.size()):
		Global.ads[i] -= 1

	Global.ads = Global.ads.filter(func(days): return days > 0)
	
func update_quota() -> void:
	var r = Global.coffee_week - 1
	Global.quota = int(500 * pow(1.38, r) + r * 175)
	
