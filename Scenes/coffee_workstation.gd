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
		Global.time_taken += delta


func _on_customer_timer_timeout() -> void:
	try_add_customer()

var possible_customers: Array[Texture2D] = [
	preload("res://Assets/Coffee assets/customers/male_coffee_1.png"),
	preload("res://Assets/Coffee assets/customers/fem_coffee_1.webp"),
	preload("res://Assets/Coffee assets/customers/male_coffee_2.png"),
	preload("res://Assets/Coffee assets/customers/male_coffee_3.png"),
	preload("res://Assets/Coffee assets/customers/male_coffee_4.png"),
	preload("res://Assets/Coffee assets/customers/fem_coffee_2.png"),
	preload("res://Assets/Coffee assets/customers/fem_coffee_3.png"),
	preload("res://Assets/Coffee assets/customers/fem_coffee_4.png")
]

func get_customer_chance() -> float:
	var chance := 30.0
	chance += Global.ads.size() * (5.0 / (Global.coffee_difficulty + 1))
	chance += (5.0 + Global.coffee_difficulty - Global.regular_price) * 5.0

	if Global.latte_discovered:
		chance += (8.0 + Global.coffee_difficulty - Global.latte_price) * 4.0

	chance += (5.0 + Global.coffee_difficulty - Global.decaf_price) * 5.0

	return clamp(chance, 5.0, 85.0)

func try_add_customer() -> void:
	if Global.customer_line.size() >= 3:
		return

	var chance := get_customer_chance()

	if randi_range(1, 100) <= chance:
		add_random_customer()

func add_random_customer() -> void:
	if Global.customer_line.size() >= 3:
		return

	Global.customer_line.append(possible_customers.pick_random())
	Global.customer_orders.append(make_random_order())

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
