extends TextureButton





func _on_pressed() -> void:
	Global.latte_discovered = true
	Global.coffee_money -= 100
