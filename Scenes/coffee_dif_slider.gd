extends HSlider


func _ready():
	value = Global.coffee_difficulty
	
func _on_value_changed(new_value: int) -> void:
	Global.coffee_difficulty = new_value
	print(Global.coffee_difficulty)
