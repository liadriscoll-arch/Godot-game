extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = Global.regular_coffee_beans >= 2
func _process(delta):
	visible = Global.regular_coffee_beans >= 2
