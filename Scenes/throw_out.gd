extends TextureButton

var empty_coffee = preload("res://Assets/Coffee assets/empty_coffee.webp")
var empty_latte = preload("res://Assets/Coffee assets/empty_latte.webp")
@onready var fella_latte_empty: Sprite2D = $"../fella_latte_empty"
@onready var fella_coffee_empty: Sprite2D = $"../fella_coffee_empty"


func _on_pressed() -> void:
	print("throw out pressed, drink is: ", Global.drink_selected)

	if Global.drink_selected == "coffee":
		print("resetting coffee cup")
		fella_coffee_empty.texture = empty_coffee
	elif Global.drink_selected != "none":
		print("resetting other cup")
		fella_latte_empty.texture = empty_latte
	else:
		print("nothing selected")
		return

	Global.drink_selected = "none"
	print("drink reset to: ", Global.drink_selected)
