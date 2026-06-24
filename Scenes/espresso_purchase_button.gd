extends TextureButton


@onready var purchase_fx = preload("res://Assets/sfx music/cha-ching.mp3")


func _on_pressed() -> void:
	if Global.coffee_money >= 100:
		CoffeeShopMusic.play_sfx(purchase_fx)
		Global.espresso_purchase_day = Global.coffee_day
		Global.latte_discovered = true
		Global.coffee_money -= 100
	
