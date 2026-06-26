extends Node2D


func _on_fridgearea_action() -> void:
	visible = true


func _on_exit_pressed() -> void:
	Chefglobal.canmove = true
	visible = false
