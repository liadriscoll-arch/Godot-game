extends Area2D

var fry_sfx = preload("res://Assets/sfx music/deep_fryer.mp3")



var player_inside := false
signal firstinteract
signal secondinteract
signal triggercolor

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if player_inside and Input.is_action_just_pressed("first"):
		firstinteract.emit()
		ChefGameMusic.play_sfx(fry_sfx)
	if player_inside and Input.is_action_just_pressed("second"):
		secondinteract.emit()
		ChefGameMusic.play_sfx(fry_sfx)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Cheffella":
		player_inside = true
		triggercolor.emit()

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Cheffella":
		player_inside = false
		triggercolor.emit()
