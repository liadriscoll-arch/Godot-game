extends Node

var volume = 50
var brightness = 100
var coffee_complete = false
var chef_complete = false
var endless = false
var coffee_difficulty = 1
var coffee_money = 100
var regular_coffee_beans: Array = []
var decaf_coffee_beans: Array = []
var quota = 500
var cofee = 0
var ads = []
var coffee_day = 0
var latte_price = 3
var regular_price = 3
var decaf_price = 3
var latte_discovered = false
var coffee_milk = 0
var regular_coffee_pot = 0
var decaf_coffee_pot = 0
var regular_espresso_pot = 0
var decaf_espresso_pot = 0
var beans_used
var customer_line: Array[Texture2D] = []
var day_length := 21600 
var day_time := 0
var espresso_purchase_day
var sponsors = []
var type_wanted = "none"
var drink_wanted = "none"
var drink_made = "none"
var type_made = "none"
var coffee_cup_made = "none"
var coffee_cup_type_made = "none"
var latte_cup_made = "none"
var latte_cup_type_made = "regular"
var selected_cup := "none"
var drink_selected = "none"
var customer_orders: Array = []
var coffee_win = false
var event_chance
var event_number
var time_taken = 0
var coffee_week = 1
var brewing = false
var espresso_brewing = false
var previous_scene_path = ""
var expresso_speed_purchased = false
var coffee_speed_purchased = false


func esc_settings():
	if Input.is_action_just_pressed("ui_cancel"):
		# Save the current scene's file path to our global variable
		Global.previous_scene_path = get_tree().current_scene.scene_file_path
		
		# Change to the settings scene
		get_tree().change_scene_to_file("res://Scenes/settings.tscn")
		
func go_back_to_previous_scene():
	if Global.previous_scene_path != "":
		# Go back to the screen we came from
		get_tree().change_scene_to_file(Global.previous_scene_path)
	else:
		# Fallback just in case the path is empty (e.g., if you launched settings directly)
		get_tree().change_scene_to_file("res://Scenes/main_game.tscn")
		
		
