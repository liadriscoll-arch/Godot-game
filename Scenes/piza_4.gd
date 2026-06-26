extends AnimatedSprite2D

var type = ""
var isready = false
var toppings = ""
signal nope
signal alron
signal tomuch

func _on_assemblyarea_fourthpizza() -> void:
	if !visible:
		if Chefglobal.inventory == "Dough":
			visible = true
			type = ""
			Chefglobal.inventory = ""
			Chefglobal.assemblytable4 = "pizza"
			set_frame(0)
		else:
			nope.emit()
	elif get_frame() == 0 and Chefglobal.inventory == "Marinara Sauce":
		set_frame(1)
		type = "Marinara"
		Chefglobal.inventory = ""
	elif get_frame() == 0 and Chefglobal.inventory == "White Sauce":
		set_frame(2)
		type = "White"
		Chefglobal.inventory = ""
	elif (get_frame() == 1 or get_frame() == 2) and Chefglobal.inventory == "Cheese":
		set_frame(4)
		isready = true
		Chefglobal.inventory = ""
	elif (Chefglobal.inventory == "Pepperoni" or Chefglobal.inventory == "Sausage" or
	Chefglobal.inventory == "Bell Peppers" or Chefglobal.inventory == "Black Olives" or
	Chefglobal.inventory == "Pineapple" or Chefglobal.inventory == "Mushrooms"):
		if Chefglobal.inventory in Chefglobal.asempiztop4:
			alron.emit()
		elif Chefglobal.asempiztop4.size() > 3:
			tomuch.emit()
		else:
			Chefglobal.asempiztop4.append(Chefglobal.inventory)
			Chefglobal.inventory = ""
	elif isready and Chefglobal.inventory == "":
		visible = false
		toppings = ", ".join(Chefglobal.asempiztop4) 
		Chefglobal.inventory= type + " Dough with\n" + toppings
		if Chefglobal.asempiztop4 == []:
			Chefglobal.inventory = type + " Ready Dough"
		Chefglobal.asempiztop4.clear()
		toppings = ""
		isready = false
		Chefglobal.assemblytable4 = ""
	else:
		nope.emit()
