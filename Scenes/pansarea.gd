extends Area2D

var sizzle_sfx = preload("res://Assets/sfx music/chef_sizzle.mp3")
var player_inside := false
signal firstinteract
signal secondinteract
signal thirdinteract
signal fourthinteract
signal triggercolor

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if player_inside and Input.is_action_just_pressed("first"):
		ChefGameMusic.play_sfx(sizzle_sfx)
		firstinteract.emit()
	if player_inside and Input.is_action_just_pressed("second"):
		ChefGameMusic.play_sfx(sizzle_sfx)
		secondinteract.emit()
	if player_inside and Input.is_action_just_pressed("third"):
		ChefGameMusic.play_sfx(sizzle_sfx)
		thirdinteract.emit()
	if player_inside and Input.is_action_just_pressed("fourth"):
		ChefGameMusic.play_sfx(sizzle_sfx)
		fourthinteract.emit()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Cheffella":
		player_inside = true
		triggercolor.emit()

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Cheffella":
		player_inside = false
		triggercolor.emit()
