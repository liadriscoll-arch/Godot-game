extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = Global.decaf_coffee_beans.size() >= 1
func _process(delta):
	visible = Global.decaf_coffee_beans.size() >= 1
