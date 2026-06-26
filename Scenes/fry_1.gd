extends AnimatedSprite2D

var heldfry = ""

func _on_fryerarea_firstinteract() -> void:
	if visible == false and (Chefglobal.inventory == "Curly Fries" or Chefglobal.inventory == "Straight Fries"):
		heldfry = Chefglobal.inventory
		Chefglobal.inventory = ""
		visible = true
		set_frame(0)
		await get_tree().create_timer(10.0).timeout
		if visible == true:
			set_frame(1)
			await get_tree().create_timer(10.0).timeout
			if visible == true:
				set_frame(2)
	elif visible == true and Chefglobal.inventory == "":
		if get_frame() == 0:
			visible = false
			Chefglobal.inventory = "Uncooked\n" + heldfry
			heldfry = ""
		if get_frame() == 1:
			visible = false
			Chefglobal.inventory = "Cooked\n" + heldfry
			heldfry = ""
		if get_frame() == 2:
			visible = false
			Chefglobal.inventory = "Overcooked\n" + heldfry
			heldfry = ""
