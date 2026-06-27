extends Node2D

@onready var purchase_fx = preload("res://Assets/sfx music/cha-ching.mp3")

func _ready() -> void:
	MainGameMusic.stop()
	CoffeeShopMusic.play_coffee_music()
	
	Global.type_made = "none"
	Global.drink_made = "none"
	Global.drink_selected = "none"
	
	Global.customer_line.clear()
	if Global.coffee_money >= Global.quota and Global.coffee_day == 7 and !Global.endless:
		Global.coffee_complete = true
		Global.coffee_win = true
		get_tree().change_scene_to_file("res://Scenes/coffee_end_screen.tscn")
	elif Global.coffee_money < Global.quota and Global.coffee_day == 7 and !Global.endless:
		Global.coffee_complete = true
		Global.coffee_win = false
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
	for i in range(Global.regular_coffee_beans.size()):
		Global.regular_coffee_beans[i] -= 1

	Global.regular_coffee_beans = Global.regular_coffee_beans.filter(func(days): return days > 0)
	
	for i in range(Global.decaf_coffee_beans.size()):
		Global.decaf_coffee_beans[i] -= 1

	Global.decaf_coffee_beans = Global.decaf_coffee_beans.filter(func(days): return days > 0)
	
	Global.decaf_coffee_pot = 0
	
	Global.regular_coffee_pot = 0
	
	Global.regular_espresso_pot = 0
	
	if Global.coffee_money <= 0 and Global.decaf_coffee_beans.size() == 0 and Global.regular_coffee_beans.size() == 0:
		Global.coffee_win = false
		get_tree().change_scene_to_file("res://Scenes/coffee_end_screen.tscn")
		
	
	
func update_quota() -> void:
	var r = Global.coffee_week - 1
	Global.quota = int(500 * pow(1.38, r) + r * 175)

func _process(delta: float) -> void:
	Global.esc_settings()
	
