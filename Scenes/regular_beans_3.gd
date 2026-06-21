extends TextureButton


func _on_pressed() -> void:
	if Global.regular_coffee_beans.size() >= 3:
		Global.beans_used = "regular"
