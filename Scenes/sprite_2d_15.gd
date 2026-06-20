extends Sprite2D




var full_latte = preload("res://Assets/Coffee assets/full_latte.webp")
var empty_latte = preload("res://Assets/Coffee assets/empty_latte.webp")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.espresso_purchase_day != null and Global.coffee_day >= Global.espresso_purchase_day + 1:
		visible = true
	else:
		visible = false
	if Global.drink_made == "coffee":
		texture = full_latte
	if Global.drink_made == "none":
		texture = empty_latte


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
