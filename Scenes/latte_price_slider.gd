extends HSlider


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = Global.latte_discovered
	value = Global.latte_price
	





func _on_value_changed(value: int) -> void:
	Global.latte_price = value
