extends Area2D

var player_inside := false
signal action
signal triggercolor
signal invfull

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if player_inside and Input.is_action_just_pressed("ui_accept") and Chefglobal.inventory == "":
		open_menu()
	elif player_inside and Input.is_action_just_pressed("ui_accept") and Chefglobal.inventory != "":
		invfull.emit()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Cheffella":
		player_inside = true
		triggercolor.emit()

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Cheffella":
		player_inside = false
		triggercolor.emit()

func open_menu() -> void:
	Chefglobal.canmove = false
	action.emit()
