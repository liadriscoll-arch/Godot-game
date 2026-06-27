extends Node2D


@onready var b_animation_player: AnimationPlayer = $Bird/BAnimationPlayer

@onready var bird_1: AnimatableBody2D = $Bird



# Called when the node enters the scene tree for the first time.
func _ready():
	CoffeeShopMusic.stop()
	MainGameMusic.play_main_music()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.esc_settings()
 


func _on_bird_timer_timeout() -> void:
	b_animation_player.play("move")
	
