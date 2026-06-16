extends TextureButton





func _on_pressed():
	Global.regular_coffee_beans += 1
	Global.coffee_money -= 5
