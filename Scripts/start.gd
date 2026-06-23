extends Node2D

func _ready():
	CoffeeShopMusic.stop()
	MainGameMusic.play_main_music()
	
func _process(delta):
	Global.esc_settings()
