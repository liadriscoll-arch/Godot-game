extends Node2D

@onready var win_sfx = preload("res://Assets/sfx music/coffee_win_sfx.mp3")
@onready var lose_sfx = preload("res://Assets/sfx music/coffee_lose_sfx.mp3")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MainGameMusic.stop()
	CoffeeShopMusic.stop()
	if Global.coffee_win:
		CoffeeShopMusic.play_fx(win_sfx)
	else:
		CoffeeShopMusic.play_fx(lose_sfx)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.esc_settings()
