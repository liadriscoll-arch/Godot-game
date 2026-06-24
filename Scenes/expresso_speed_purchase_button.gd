extends TextureButton

@onready var expresso_speed_upgrade: Label = $"../expresso_speed_upgrade"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = Global.latte_discovered
	
func _process(delta: float) -> void:
	visible = Global.latte_discovered
	





func _on_pressed() -> void:
	if Global.coffee_money >= 25 and Global.expresso_speed_purchased == false:
		Global.expresso_speed_purchased = true
		Global.coffee_money -= 25
		expresso_speed_upgrade.text = "purchased!"
		expresso_speed_upgrade.add_theme_font_size_override("font_size", 14)
