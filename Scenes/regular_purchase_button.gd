extends TextureButton

@onready var purchase_fx = preload("res://Assets/sfx music/cha-ching.mp3")



func _on_pressed():
	if Global.coffee_money >= 5:
		CoffeeShopMusic.play_sfx(purchase_fx)
		Global.regular_coffee_beans.append(3)
		Global.coffee_money -= 5
