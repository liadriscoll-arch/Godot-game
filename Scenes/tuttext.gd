extends Label

func _ready() -> void:
	if Chefglobal.mode == 0:
		set_visible(false)
		
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("tutorialopen"):
		if visible == true:
			visible = false
		else:
			visible = true
