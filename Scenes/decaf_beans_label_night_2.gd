extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = str(Global.decaf_coffee_beans)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	text = str(Global.decaf_coffee_beans)
