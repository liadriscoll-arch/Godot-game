extends Node2D


func _ready():
	MainGameMusic.stop()
	
func _process(delta: float) -> void:
	Global.esc_settings()
