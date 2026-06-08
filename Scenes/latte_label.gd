extends Label

@onready var latte_label: Label = $"."


func _ready():
	$latte_label.visible = false
