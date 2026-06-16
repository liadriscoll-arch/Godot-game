extends TextureButton





func _on_pressed() -> void:
	if Global.decaf_coffee_beans >= 3:
		Global.beans_used = "decaf"
