extends TextureButton





func _on_pressed():
	if Global.coffee_money >= 5:
		Global.regular_coffee_beans.append(3)
		Global.coffee_money -= 5
