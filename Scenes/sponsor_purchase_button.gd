extends TextureButton

@onready var purchase_fx = preload("res://Assets/sfx music/cha-ching.mp3")




func _on_pressed() -> void:
	if Global.coffee_money >= 100 * Global.coffee_week:
		CoffeeShopMusic.play_fx(purchase_fx)
		Global.coffee_money -= 100 * Global.coffee_week
		Global.ads.append(7)
		Global.sponsors.append(1)
