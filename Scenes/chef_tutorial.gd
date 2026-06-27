extends Node2D


func _ready() -> void:
	if Chefglobal.mode == 0:
		Chefglobal.canmove = false
		visible = true

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("tutorialopen"):
		if visible == true:
			Chefglobal.canmove = true
			visible = false
		else:
			Chefglobal.canmove = false
			visible = true
