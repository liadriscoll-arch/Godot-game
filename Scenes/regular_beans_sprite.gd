extends Sprite2D


@onready var shop_item_instructions_label: Label = $"../shop_item_instructions_label"


func _ready() -> void:
	
	$Area2D.mouse_entered.connect(_on_mouse_entered)
	$Area2D.mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered() -> void:
	if Global.latte_discovered:
		shop_item_instructions_label.text = "regular beans to make caffeinated coffees and espresso" + "\r" + "makes 4 coffees"
	else: 
		shop_item_instructions_label.text = "regular beans to make caffeinated coffees" + "\r" + "makes 4 coffees"
	

func _on_mouse_exited() -> void:
	shop_item_instructions_label.text = "Hover over an item for help"
	
