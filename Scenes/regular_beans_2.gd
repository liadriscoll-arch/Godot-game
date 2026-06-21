extends TextureButton





func _on_pressed() -> void:
	if Global.regular_coffee_beans.size() >= 2:
		Global.beans_used = "regular"
