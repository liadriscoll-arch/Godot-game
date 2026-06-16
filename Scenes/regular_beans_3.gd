extends TextureButton


func _on_pressed() -> void:
	if Global.regular_coffee_beans >= 3:
		Global.beans_used = "regular"
