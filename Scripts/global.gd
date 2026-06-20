extends Node

var volume = 50
var brightness = 100
var coffee_complete = false
var chef_complete = false
var endless = false
var coffee_difficulty = 1
var coffee_money = 100
var regular_coffee_beans = 0
var decaf_coffee_beans = 0
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
var day_length := 120 
var day_time := 0
var espresso_purchase_day
var sponsors = []
var type_wanted
var drink_wanted
var drink_made = "none"
var type_made = "none"
var coffee_cup_made = "none"
var coffee_cup_type_made = "none"
var latte_cup_made = "none"
var latte_cup_type_made = "regular"
var selected_cup := "none"
var drink_selected
var customer_orders: Array = []
var coffee_win
var event_chance
