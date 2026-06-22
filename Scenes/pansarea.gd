extends Area2D

var player_inside := false
signal pansarea

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if player_inside and Input.is_action_just_pressed("ui_accept"):
		open_menu()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Cheffella":
		player_inside = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Cheffella":
		player_inside = false

func open_menu() -> void:
	pansarea.emit()
	print("open menu")
