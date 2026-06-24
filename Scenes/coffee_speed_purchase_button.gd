extends TextureButton
@onready var coffee_speed_upgrade: Label = $"../coffee_speed_upgrade"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_pressed() -> void:
	if Global.coffee_money >= 25 and Global.coffee_speed_purchased == false:
		Global.coffee_speed_purchased = true
		Global.coffee_money -= 25
		coffee_speed_upgrade.text = "purchased!"
		coffee_speed_upgrade.add_theme_font_size_override("font_size", 14)
