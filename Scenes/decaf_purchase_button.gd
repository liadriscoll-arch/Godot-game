extends TextureButton





func _on_pressed():
	if Global.coffee_money >= 5:
		Global.decaf_coffee_beans.append(3)
		Global.coffee_money -= 5
	
