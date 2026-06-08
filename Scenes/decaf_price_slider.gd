extends HSlider



func _ready():
	value = Global.decaf_price
	




func _on_value_changed(value: int):
	Global.decaf_price = value
