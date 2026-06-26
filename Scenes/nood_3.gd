extends AnimatedSprite2D

var type = ""
var sauce = ""
var isready = false
signal nope

func _on_assemblyarea_thirdnood() -> void:
	if !visible:
		if Chefglobal.inventory == "Plate":
			visible = true
			type = ""
			Chefglobal.inventory = ""
			Chefglobal.assemblytable3 = "nood"
			set_frame(0)
		else:
			nope.emit()
	elif get_frame() == 0 and (Chefglobal.inventory == "Cooked Long Noodles" or Chefglobal.inventory == "Cooked Short Noodles"):
		set_frame(1)
		type = Chefglobal.inventory
		Chefglobal.inventory = ""
		sauce = "Sauceless"
		isready = true
	elif get_frame() == 1 and Chefglobal.inventory == "Marinara Sauce":
		set_frame(2)
		sauce = Chefglobal.inventory
		Chefglobal.inventory = ""
		isready = true
	elif get_frame() == 1 and Chefglobal.inventory == "White Sauce":
		set_frame(3)
		sauce = Chefglobal.inventory
		Chefglobal.inventory = ""
		isready = true
	elif isready and Chefglobal.inventory == "":
		visible = false
		Chefglobal.inventory= sauce + "\n" + type 
		isready = false
		sauce = ""
		Chefglobal.assemblytable3 = ""
	else:
		nope.emit()
