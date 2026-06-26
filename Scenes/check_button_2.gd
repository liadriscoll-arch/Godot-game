extends CheckButton

func _ready():
	pass

func _on_toggled(toggled_on: bool) -> void:
	if toggled_on:
		Chefglobal.hard = true
	else:
		Chefglobal.hard = false
	print(Chefglobal.hard)
