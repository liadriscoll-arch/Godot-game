extends TextureButton

var empty_coffee = preload("res://Assets/Coffee assets/empty_coffee.webp")
var empty_latte = preload("res://Assets/Coffee assets/empty_latte.webp")
@onready var fella_latte_empty: Sprite2D = $"../fella_latte_empty"
@onready var fella_coffee_empty: Sprite2D = $"../fella_coffee_empty"


func _on_pressed() -> void:
	if Global.drink_selected == "coffee":
		fella_coffee_empty.texture = empty_coffee
	else:
		fella_latte_empty.texture = empty_latte
	Global.drink_selected = "none"
		
