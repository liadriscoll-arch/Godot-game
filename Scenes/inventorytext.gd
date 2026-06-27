extends Label

func _ready() -> void:
	if Chefglobal.mode == 0:
			visible = false

func _process(delta: float) -> void:
	set_text("In inventory:\n" + Chefglobal.inventory)
	if Input.is_action_just_pressed("tutorialopen"):
		if visible == true:
			visible = false
		else:
			visible = true
			
func _on_trasharea_action() -> void:
	set_text("In inventory:\n" + Chefglobal.inventory)


func _on_trash_2_area_action() -> void:
	set_text("In inventory:\n" + Chefglobal.inventory)
