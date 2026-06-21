extends Sprite2D


func _ready() -> void:
	visible = Global.decaf_coffee_beans.size() >= 3
func _process(delta):
	visible = Global.decaf_coffee_beans.size() >= 3
