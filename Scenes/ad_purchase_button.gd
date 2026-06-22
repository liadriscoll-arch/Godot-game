extends TextureButton

@onready var purchase_fx = preload("res://Assets/sfx music/cha-ching.mp3")



func _on_pressed() -> void:
	if Global.coffee_money >= 25:
		CoffeeShopMusic.play_sfx(purchase_fx)
		Global.ads.append(3)
		Global.coffee_money -= 25
		
