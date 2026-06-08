extends HSlider




func _ready():
	value = Global.regular_price




func _on_value_changed(value: int):
	Global.regular_price = value
