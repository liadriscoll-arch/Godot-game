extends Node2D

signal openedmenu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_cabinetarea_action() -> void:
	openedmenu.emit()
	get_tree().change_scene_to_file("res://Scenes/chef_cabinet.tscn")
