extends Sprite2D


@onready var shop_item_instructions_label: Label = $"../shop_item_instructions_label"


func _ready() -> void:
	
	$Area2D.mouse_entered.connect(_on_mouse_entered)
	$Area2D.mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered() -> void:
	shop_item_instructions_label.text = "An add to attract more customers" + "\r" + "can be stacked"
	

func _on_mouse_exited() -> void:
	shop_item_instructions_label.text = "Hover over an item for help"
