extends Node2D

signal ordupd

func _on_bookarea_action() -> void:
	ordupd.emit()


func _on_chef_game_openedmenu() -> void:
	if visible:
		visible = false
	else:
		visible = true
