extends Node2D


func _on_cabinetarea_action() -> void:
	visible = true


func _on_exit_pressed() -> void:
	visible = false
	Chefglobal.canmove = true
