extends Sprite2D


func _ready() -> void:
	visible = Global.regular_coffee_beans >= 1
		
func _process(delta):
	visible = Global.regular_coffee_beans >= 1
