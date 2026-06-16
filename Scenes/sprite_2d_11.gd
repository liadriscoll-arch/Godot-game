extends Sprite2D



func _ready() -> void:
	if Global.coffee_milk >= 3 and Global.latte_discovered:
		visible = true
func _process(delta):
	if Global.coffee_milk >= 3 and Global.latte_discovered:
		visible = true
