extends TextureButton

@onready var workstation_info_label: Label = $"../workstation_info_label"
@onready var fella_coffee_empty: Sprite2D = $"../fella_coffee_empty"
@onready var decaf_coffee_pot: decaf_coffee_pot = $"../decaf_coffee_pot"
@onready var regular_coffee_pot: regular_coffee_pot = $"../regular_coffee_pot"

var full_coffee = preload("res://Assets/Coffee assets/full_coffee.webp")
var empty_coffee = preload("res://Assets/Coffee assets/empty_coffee.webp")



func _ready() -> void:
	if Global.drink_made == "coffee":
		fella_coffee_empty.texture = full_coffee
	if Global.drink_made == "none":
		fella_coffee_empty.texture = empty_coffee

func _on_pressed() -> void:
	if Global.coffee_cup_made != "none":
		Global.selected_cup = "coffee"
		Global.drink_made = Global.coffee_cup_made
		Global.type_made = Global.coffee_cup_type_made
		return

	if Global.drink_selected == "decaf_coffee":
		Global.coffee_cup_made = "coffee"
		Global.coffee_cup_type_made = "decaf"

		Global.selected_cup = "coffee"
		Global.drink_made = Global.coffee_cup_made
		Global.type_made = Global.coffee_cup_type_made

		fella_coffee_empty.texture = full_coffee
		Global.decaf_coffee_pot -= 1
		decaf_coffee_pot.update_coffee_pot()

	elif Global.drink_selected == "regular_coffee":
		Global.coffee_cup_made = "coffee"
		Global.coffee_cup_type_made = "regular"

		Global.selected_cup = "coffee"
		Global.drink_made = Global.coffee_cup_made
		Global.type_made = Global.coffee_cup_type_made

		fella_coffee_empty.texture = full_coffee
		Global.regular_coffee_pot -= 1
		regular_coffee_pot.update_coffee_pot()
