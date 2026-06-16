extends Sprite2D


func _ready() -> void:
	visible = Global.decaf_coffee_beans >= 3
func _process(delta):
	visible = Global.decaf_coffee_beans >= 3
