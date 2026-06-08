extends CheckButton

func _ready():
	button_pressed = Global.endless

func _on_toggled(toggled_on: bool) -> void:
	if toggled_on:
		Global.endless = true
	else:
		Global.endless = false
	print(Global.endless)
