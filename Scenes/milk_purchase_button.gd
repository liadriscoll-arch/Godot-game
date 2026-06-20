extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = Global.latte_discovered


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	visible = Global.latte_discovered




func _on_pressed() -> void:
	if Global.coffee_money >= 5 and Global.latte_discovered:
		Global.coffee_milk += 4
		Global.coffee_money -= 5
