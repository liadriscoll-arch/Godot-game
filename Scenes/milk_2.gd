extends Sprite2D



func _ready() -> void:
	visible = Global.coffee_milk >= 3 and Global.latte_discovered
func _process(delta):
	visible = Global.coffee_milk >= 3 and Global.latte_discovered
