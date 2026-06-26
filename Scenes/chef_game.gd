extends Node2D

signal openedmenu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.esc_settings()


func _on_cabinetarea_action() -> void:
	openedmenu.emit()


func _on_fridgearea_action() -> void:
	openedmenu.emit()
