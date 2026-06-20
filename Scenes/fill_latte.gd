extends TextureButton
@onready var workstation_info_label: Label = $"../workstation_info_label"
@onready var fella_latte_empty: Sprite2D = $"../fella_coffee_empty"
@onready var regular_espresso_pot: regular_espresso_pot = $"../regular_espresso_pot"

var full_latte = preload("res://Assets/Coffee assets/full_latte.webp")
var empty_latte = preload("res://Assets/Coffee assets/empty_latte.webp")



func _ready() -> void:
	if Global.espresso_purchase_day != null and Global.coffee_day >= Global.espresso_purchase_day + 1:
		visible = true
	else:
		visible = false

	if Global.latte_cup_made == "latte":
		fella_latte_empty.texture = full_latte
	else:
		fella_latte_empty.texture = empty_latte

func _on_pressed() -> void:
	if Global.drink_selected == "regular_coffee" or Global.drink_selected == "decaf_coffee":
		workstation_info_label.text = "Espresso and milk only!"
		await get_tree().create_timer(2.5).timeout
		return

	if Global.latte_cup_made == "latte":
		Global.selected_cup = "latte"
		Global.drink_made = Global.latte_cup_made
		Global.type_made = Global.latte_cup_type_made
		return

	elif Global.drink_selected == "milk" and Global.latte_cup_made == "none":
		Global.latte_cup_made = "milk"
		Global.latte_cup_type_made = "regular"
		Global.coffee_milk -= 1

	elif Global.drink_selected == "espresso" and Global.latte_cup_made == "none":
		Global.latte_cup_made = "espresso"
		Global.latte_cup_type_made = "regular"
		Global.espresso_coffee_pot -= 1
		regular_espresso_pot.update_espresso_pot()

	elif Global.drink_selected == "milk" and Global.latte_cup_made == "espresso":
		Global.latte_cup_made = "latte"
		Global.latte_cup_type_made = "regular"
		Global.coffee_milk -= 1
		fella_latte_empty.texture = full_latte

	elif Global.drink_selected == "espresso" and Global.latte_cup_made == "milk":
		Global.latte_cup_made = "latte"
		Global.latte_cup_type_made = "regular"
		Global.espresso_coffee_pot -= 1
		regular_espresso_pot.update_espresso_pot()
		fella_latte_empty.texture = full_latte

	if Global.latte_cup_made != "none":
		Global.selected_cup = "latte"
		Global.drink_made = Global.latte_cup_made
		Global.type_made = Global.latte_cup_type_made
