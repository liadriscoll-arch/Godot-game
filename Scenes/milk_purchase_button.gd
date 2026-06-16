extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = Global.latte_discovered


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	visible = Global.latte_discovered




func _on_pressed() -> void:
	Global.coffee_milk += 1
	Global.coffee_money -= 5
