extends Node2D

@onready var spot1: Sprite2D = $Customer1
@onready var spot2: Sprite2D = $Customer2
@onready var spot3: Sprite2D = $Customer3
@onready var type_sprite: Sprite2D = $type_sprite
@onready var drink_sprite: Sprite2D = $drink_sprite
@onready var intro_label: Label = $intro_label
@onready var event_text: Label = $event_text
@onready var event_rect: Sprite2D = $event_rect
@onready var tip_label: Label = $tip_label
@onready var coffee_cup: Sprite2D = $Sprite2D16
@onready var latte_cup: Sprite2D = $Sprite2D15
@onready var decaf_coffee_pot: decaf_coffee_pot = $decaf_coffee_pot
@onready var regular_coffee_pot: regular_coffee_pot = $regular_coffee_pot
@onready var regular_espresso_pot: regular_espresso_pot = $regular_espresso_pot
@onready var event_fx = preload("res://Assets/sfx music/event_sfx.mp3")


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


var empty_latte = preload("res://Assets/Coffee assets/empty_latte.webp")
var empty_coffee = preload("res://Assets/Coffee assets/empty_coffee.webp")




func _ready() -> void:
	MainGameMusic.stop()
	CoffeeShopMusic.play_coffee_music()
	
	randomize()
	update_line()
	update_order()
	if Global.event_chance != 5:
		event_rect.hide()
	if Global.coffee_day == 1:
		intro_label.text = str("welcome to your new job!" + "\r" + 
		"when a customer shows up, take a look at their order" + "\r" + 
		"then click near your coffee machine and beans" + "\r" + "to make coffee. When done," + "\r" + 
		"click on the speech bubble to give it to the customer")
	
	decaf_coffee_pot.update_coffee_pot()
	
	regular_coffee_pot.update_coffee_pot()
	
	regular_espresso_pot.update_coffee_pot()


#determines chance for new customer
func get_customer_chance() -> float:
	#base is 30
	var chance := 30.0
	
	#chance increases with ads
	chance += Global.ads.size() * (5.0 / (Global.coffee_difficulty + 1))
	#chance determined by regular coffee price
	chance += (8.0 - Global.coffee_difficulty - Global.regular_price) * 5.0
	#chance determined by latte price
	if Global.latte_discovered:
		chance += (10.0 - Global.coffee_difficulty - Global.latte_price) * 4.0
	#chance determined by decaf coffee price
	chance += (8.0 - Global.coffee_difficulty - Global.decaf_price) * 5.0
	#chance is forced between 5-85%
	return clamp(chance, 5.0, 85.0)
	
#chance to get a new customer
func try_add_customer() -> void:
	
	if Global.customer_line.size() >= 3:
		return
	#gets chance based on user inputs
	var chance := get_customer_chance()
	print(chance)

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

	try_tip()
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
	
	if Global.selected_cup == "latte":
		latte_cup.texture = empty_latte
	elif Global.selected_cup == "coffee":
		coffee_cup.texture = empty_coffee

	
	
	Global.selected_cup = "none"
	Global.drink_made = "none"
	Global.type_made = "none"

	update_line()
	update_order()
	
	
	Global.time_taken = 0
	
	
#customers leave the line without paying if they get the wrong drink
# customers leave the line without paying if they get the wrong drink
func customer_leaves() -> void:
	
	Global.customer_line.remove_at(0)
	Global.customer_orders.remove_at(0)
	
	if Global.customer_line.size() == 0:
		return

	
	
	
	if Global.selected_cup == "latte":
		latte_cup.texture = empty_latte
		Global.latte_cup_made = "none"
		Global.latte_cup_type_made = "regular"
	elif Global.selected_cup == "coffee":
		coffee_cup.texture = empty_coffee
		Global.coffee_cup_made = "none"
		Global.coffee_cup_type_made = "none"

	#Reset global variables so the next drink starts fresh
	Global.selected_cup = "none"
	Global.drink_made = "none"
	Global.type_made = "none"


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
	Global.esc_settings()
	Global.day_time += 1
#day ends after  2 min
	if Global.day_time >= Global.day_length:
		get_tree().change_scene_to_file("res://Scenes/coffee_game_night.tscn")
		Global.day_time = 0
	if Global.customer_line.size() >= 1:
		Global.time_taken += delta

#player gives drink to customer
func _on_speech_button_pressed() -> void:
	#if right, customer pays
	if Global.type_wanted == Global.type_made and Global.drink_wanted == Global.drink_made:
		serve_customer()
#if not, customer leaves
	else:
		customer_leaves()


func find_tip_chance() -> float:
	var tip_chance := 10.0
	
	#chance increases with ads
	tip_chance += (1.0 / max(Global.time_taken, 0.1)) * (10.0 / (1 + Global.coffee_difficulty))
	#chance determined by regular coffee price
	tip_chance += (5.0 + Global.coffee_difficulty - Global.regular_price) * 5.0
	#chance determined by latte price
	if Global.latte_discovered:
		tip_chance += (8.0 + Global.coffee_difficulty - Global.latte_price) * 4.0
	#chance determined by decaf coffee price
	tip_chance += (5.0 + Global.coffee_difficulty - Global.decaf_price) * 5.0
	#chance is forced between 5-50%
	return clamp(tip_chance, 0, 50.0)
	
func try_tip() -> void:
	var tip_chance := find_tip_chance()
	var tip = 0
	if randi_range(1, 100) <= tip_chance:
		tip = randi_range(1,5)
		Global.coffee_money += tip
		tip_label.text = "The customer left a " + str(tip) + " credit tip"
		await get_tree().create_timer(5).timeout
		tip_label.text = ""

func _on_events_timer_timeout() -> void:
	Global.event_chance = randi_range(1,5)
	if Global.event_chance == 5:
		Global.event_number = randi_range(1,25)
		CoffeeShopMusic.play_sfx(event_fx)
		if Global.event_number == 1:
			Global.coffee_money += 15
			event_text.text = str("You found extra cash in the register!" + "\r" + "You win 15 credits!")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
		elif Global.event_number == 2:
			Global.coffee_money -= 10
			event_text.text = str("You had to pay an unexpected fee." + "\r" + "You lose 10 credits.")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
		elif Global.event_number == 3:
			Global.ads.append(3)
			event_text.text = str("A local website offered free advertising!" + "\r" + "You gain 3 ads!")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
		elif Global.event_number == 4 and Global.regular_coffee_beans.size():
			Global.regular_coffee_beans.remove_at(0)
			event_text.text = str("A bag of regular coffee beans was spilled." + "\r" + "You lose 1 regular coffee bean.")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
		elif Global.event_number == 5:
			Global.coffee_money += 25
			event_text.text = str("Your expenses were lower than expected!" + "\r" + "You win 25 credits!")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
		elif Global.event_number == 6:
			Global.coffee_money -= 20
			event_text.text = str("Equipment maintenance cost more than expected." + "\r" + "You lose 20 credits.")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
		elif Global.event_number == 7:
			Global.ads.append(3)
			event_text.text = str("A marketing company gave you free promotion!" + "\r" + "You gain 3 ads!")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
		elif Global.event_number == 8 and Global.decaf_coffee_beans.size():
			Global.decaf_coffee_beans.remove_at(0)
			event_text.text = str("A bag of decaf coffee beans was ruined." + "\r" + "You lose 1 decaf coffee bean.")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
		elif Global.event_number == 9:
			Global.coffee_money += 30
			event_text.text = str("You received a small business grant!" + "\r" + "You win 30 credits!")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
		elif Global.event_number == 10:
			Global.coffee_money -= 25
			event_text.text = str("Your insurance payment is due." + "\r" + "You lose 25 credits.")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
		elif Global.event_number == 11:
			Global.coffee_money += 20
			event_text.text = str("You won a local coffee brewing contest!" + "\r" + "You win 20 credits!")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
		elif Global.event_number == 12 and Global.regular_coffee_beans.size() >= 1:
			Global.regular_coffee_beans.remove_at(0)
			event_text.text = str("A container of regular coffee beans tipped over." + "\r" + "You lose 1 regular coffee bean.")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
		elif Global.event_number == 13:
			Global.ads.append(3)
			event_text.text = str("A billboard company gave you free ad space!" + "\r" + "You gain 3 ads!")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
		elif Global.event_number == 14:
			Global.coffee_money -= 15
			event_text.text = str("You had to replace some shop supplies." + "\r" + "You lose 15 credits.")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
		elif Global.event_number == 15:
			Global.coffee_money += 40
			event_text.text = str("Your coffee shop was featured in a local newspaper!" + "\r" + "You win 40 credits!")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
		elif Global.event_number == 16:
			Global.coffee_money -= 30
			event_text.text = str("Your rent increased this month." + "\r" + "You lose 30 credits.")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
		elif Global.event_number == 17 and Global.decaf_coffee_beans.size():
			Global.decaf_coffee_beans.remove_at(0)
			event_text.text = str("A decaf bean shipment was damaged." + "\r" + "You lose 1 decaf coffee bean.")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
		elif Global.event_number == 18:
			Global.coffee_money -= 10
			event_text.text = str("You paid for routine maintenance." + "\r" + "You lose 10 credits.")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
		elif Global.event_number == 19:
			Global.coffee_money += 50
			event_text.text = str("You received a business excellence award!" + "\r" + "You win 50 credits!")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
		elif Global.event_number == 20:
			Global.coffee_money -= 20
			event_text.text = str("A licensing fee came due." + "\r" + "You lose 20 credits.")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
		elif Global.event_number == 21:
			Global.ads.append(3)
			event_text.text = str("Your latest ad campaign was a major success!" + "\r" + "You gain 3 ads!")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
		elif Global.event_number == 22 and Global.regular_coffee_beans.size():
			Global.regular_coffee_beans.remove_at(0)
			event_text.text = str("Some regular coffee beans were accidentally thrown away." + "\r" + "You lose 1 regular coffee bean.")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
		elif Global.event_number == 23:
			Global.coffee_money += 20
			event_text.text = str("You received a tax refund!" + "\r" + "You win 20 credits!")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
		elif Global.event_number == 24 and Global.ads.size() >= 1:
			Global.ads.remove_at(1)
			event_text.text = str("A rival company has better ad campaigns." + "\r" + "You lose 1 ad.")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
		elif Global.event_number == 25:
			Global.coffee_money += 25
			event_text.text = str("You won an award for best new coffee shop in town!" + "\r" + "You win 25 credits!")
			event_rect.show()
			await get_tree().create_timer(8).timeout
			event_text.text = ""
			event_rect.hide()
	
