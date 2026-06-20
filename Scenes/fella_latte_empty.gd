extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.espresso_purchase_day != null and Global.coffee_day >= Global.espresso_purchase_day + 1:
		visible = true
	else:
		visible = false
