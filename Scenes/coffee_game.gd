extends Node2D

@onready var spot1: Sprite2D = $Customer1
@onready var spot2: Sprite2D = $Customer2
@onready var spot3: Sprite2D = $Customer3
@onready var type_sprite: Sprite2D = $type_sprite
@onready var drink_sprite: Sprite2D = $drink_sprite
@onready var intro_label: Label = $intro_label



var orders = ["type_wanted", "drink_wanted"]
#preloaded images
var possible_customers: Array[Texture2D] = [
	preload("res://Assets/Coffee assets/customers/male_coffee_1.png"),
	preload("res://Assets/Coffee assets/customers/fem_coffee_1.webp"),
	preload("res://Assets/Coffee assets/customers/male_coffee_2.png"),
	preload("res://Assets/Coffee assets/customers/male_coffee_3.png"),
	preload("res://Assets/Coffee assets/customers/male_coffee_4.png"),
	preload("res://Assets/Coffee assets/customers/fem_coffee_2.png"),
	preload("res://Assets/Coffee assets/customers/fem_coffee_3.png"),
	preload("res://Assets/Coffee assets/customers/fem_coffee_4.png"),
	#preload("res://customer9.png"),
	#preload("res://customer10.png")
]

var full_coffee = preload("res://Assets/Coffee assets/full_coffee.webp")
var full_latte = preload("res://Assets/Coffee assets/full_latte.webp")

var coffee_types: Array[Texture2D] = [
	preload("res://Assets/Coffee assets/regular_bean_bag.webp"),
	preload("res://Assets/Coffee assets/decaf_bean_bag.png")
]
var drink_type: Array[Texture2D] = [
	preload("res://Assets/Coffee assets/full_latte.webp"),
	preload("res://Assets/Coffee assets/full_coffee.webp")
]


func _ready() -> void:
	randomize()
	update_line()
	update_order()
	
	if Global.coffee_day == 1:
		intro_label.text = str("welcome to your new job!" + "\r" + 
		"when a customer shows up, take a look at their order" + "\r" + 
		"then click near your coffee machine and beans" + "\r" + "to make coffee. When done," + "\r" + 
		"click on the speech bubble to give it to the customer")


#determines chance for new customer
func get_customer_chance() -> float:
	#base is 30
	var chance := 30.0
	
	#chance increases with ads
	chance += Global.ads.size() * 5.0
	#chance determined by regular coffee price
	chance += (6.0 - Global.regular_price) * 5.0
	#chance determined by latte price
	if Global.latte_discovered:
		chance += (10.0 - Global.latte_price) * 4.0
	#chance determined by decaf coffee price
	chance += (6.0 - Global.decaf_price) * 5.0
	#chance is forced between 5-85%
	return clamp(chance, 5.0, 85.0)
	
#chance to get a new customer
func try_add_customer() -> void:
	
	if Global.customer_line.size() >= 3:
		return
	#gets chance based on user inputs
	var chance := get_customer_chance()

	if randi_range(1, 100) <= chance:
		add_random_customer()

#adds a customer to the line
func add_random_customer() -> void:
	if Global.customer_line.size() >= 3:
		return

	var random_customer = possible_customers.pick_random()
	Global.customer_line.append(random_customer)

	var order = make_random_order()
	Global.customer_orders.append(order)

	update_line()
	update_order()

#serves cutomers drinks
func serve_customer() -> void:
	if Global.customer_line.size() == 0:
		return

	# customers pay based on player-set prices
	if Global.drink_made == "latte":
		Global.coffee_money += Global.latte_price
	elif Global.type_made == "regular":
		Global.coffee_money += Global.regular_price
	else:
		Global.coffee_money += Global.decaf_price

	# moves the line along
	Global.customer_line.remove_at(0)
	Global.customer_orders.remove_at(0)

	# clears only the cup that was served
	if Global.selected_cup == "coffee":
		Global.coffee_cup_made = "none"
		Global.coffee_cup_type_made = "none"

	elif Global.selected_cup == "latte":
		Global.latte_cup_made = "none"
		Global.latte_cup_type_made = "regular"

	Global.selected_cup = "none"
	Global.drink_made = "none"
	Global.type_made = "none"

	update_line()
	update_order()
	
	
#customers leave the line without paying if they get the wrong drink
func customer_leaves() -> void:
	if Global.customer_line.size() == 0:
		return

	Global.customer_line.remove_at(0)
	Global.customer_orders.remove_at(0)

	update_line()
	update_order()

#move customers up and/or add customers
func update_line() -> void:
	spot1.visible = Global.customer_line.size() >= 1
	spot2.visible = Global.customer_line.size() >= 2
	spot3.visible = Global.customer_line.size() >= 3

#checks if 1 customer is there, then adds their texture
	if Global.customer_line.size() >= 1:
		spot1.texture = Global.customer_line[0]
#checks if a 2nd customer is there, then adds their texture
	if Global.customer_line.size() >= 2:
		spot2.texture = Global.customer_line[1]
#checks if a 3rd customer is there, then adds their texture
	if Global.customer_line.size() >= 3:
		spot3.texture = Global.customer_line[2]
		

		
	

#people walk in randomly after this timer
func _on_customer_timer_timeout() -> void:
	try_add_customer()

#get a customer order
func make_random_order() -> Dictionary:
	var drink_wanted := "coffee"
	var type_wanted := "regular"

	var drink_number = randi_range(0, 1)
	if Global.latte_discovered and drink_number == 0:
		drink_wanted = "latte"

	var type_number = randi_range(0, 1)
	if type_number == 0 or drink_wanted == "latte":
		type_wanted = "regular"
	else:
		type_wanted = "decaf"

	return {
		"drink": drink_wanted,
		"type": type_wanted
	}

#adds order images onto screen
func update_order() -> void:
	if Global.customer_line.size() == 0 or Global.customer_orders.size() == 0:
		type_sprite.visible = false
		drink_sprite.visible = false
		return

	type_sprite.visible = true
	drink_sprite.visible = true

	var current_order = Global.customer_orders[0]
	Global.type_wanted = current_order["type"]
	Global.drink_wanted = current_order["drink"]

	if Global.type_wanted == "decaf":
		type_sprite.texture = coffee_types[1]
	else:
		type_sprite.texture = coffee_types[0]

	if Global.drink_wanted == "latte":
		drink_sprite.texture = drink_type[0]
	else:
		drink_sprite.texture = drink_type[1]

#day function
func _process(delta: float) -> void:
	Global.day_time += delta
#day ends after  2 min
	if Global.day_time >= Global.day_length:
		get_tree().change_scene_to_file("res://Scenes/coffee_game_night.tscn")
		Global.day_time = 0

#player gives drink to customer
func _on_speech_button_pressed() -> void:
	#if right, customer pays
	if Global.type_wanted == Global.type_made and Global.drink_wanted == Global.drink_made:
		serve_customer()
#if not, customer leaves
	else:
		customer_leaves()
