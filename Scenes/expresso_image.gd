extends Sprite2D


@onready var info_label: Label = $"../info_label"


func _ready() -> void:
	
	$Area2D.mouse_entered.connect(_on_mouse_entered)
	$Area2D.mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered() -> void:
	info_label.text = str("New machine to make lattes" + "\r" + "not usable until tomorrow" + "\r" + "*requires milk")
	

func _on_mouse_exited() -> void:
	info_label.text = str("Hover over an item for help")
	
