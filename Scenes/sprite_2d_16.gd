extends Sprite2D

var full_coffee = preload("res://Assets/Coffee assets/full_coffee.webp")
var empty_coffee = preload("res://Assets/Coffee assets/empty_coffee.webp")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.drink_made == "coffee":
		texture = full_coffee
	if Global.drink_made == "none":
		texture = empty_coffee
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
