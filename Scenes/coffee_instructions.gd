extends Node2D


func _ready():
	Global.coffee_money = 100
	Global.regular_coffee_beans = 0
	Global.decaf_coffee_beans = 0
	Global.quota = (500 * ((Global.coffee_difficulty + 1)/2)) 
	Global.cofee = 0
	Global.ads = []
	Global.coffee_day = 0
	Global.latte_price = 3
	Global.regular_price = 3
	Global.decaf_price = 3
	Global.latte_discovered = false
	Global.coffee_milk = 0
	Global.regular_coffee_pot = 0
	Global.decaf_coffee_pot = 0
	Global.regular_espresso_pot = 0
	Global.decaf_espresso_pot = 0
	Global.sponsors = []
	Global.coffee_win = false
	Global.type_wanted = "none"
	Global.drink_wanted = "none"
	Global.drink_made = "none"
	Global.type_made = "none"
	Global.coffee_cup_made = "none"
	Global.drink_selected = "none"
	Global.coffee_cup_type_made = "none"
	Global.latte_cup_made = "none"
	Global.latte_cup_type_made = "regular"
	Global.selected_cup = "none"
	Global.espresso_purchase_day = 10
	Global.event_chance = "none"
	Global.event_number = "none"
