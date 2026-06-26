extends AnimatedSprite2D

var buntype = ""
var burgtype = ""
var isready = false
var toppings = ""
signal nope
signal alron
signal tomuch

func _on_assemblyarea_fourthburg() -> void:
	if !visible:
		if Chefglobal.inventory == "Plain Bun" or Chefglobal.inventory == "Sesame Bun":
			visible = true
			buntype = Chefglobal.inventory
			Chefglobal.inventory = ""
			Chefglobal.assemblytable4 = "burg"
			set_frame(0)
		else:
			nope.emit()
	elif Chefglobal.inventory == "Cooked Meat Patty" or Chefglobal.inventory == "Cooked Veggie Patty":
		burgtype = Chefglobal.inventory
		Chefglobal.inventory = ""
		set_frame(1)
		isready = true
	elif get_frame() == 1 and (Chefglobal.inventory == "Ketchup" or Chefglobal.inventory == "Mustard" or
	Chefglobal.inventory == "Pickles" or Chefglobal.inventory == "Lettuce" or
	Chefglobal.inventory == "Tomatoes" or Chefglobal.inventory == "Onions" or
	Chefglobal.inventory == "Cheese"):
		if Chefglobal.inventory in Chefglobal.asemburgtop4:
			alron.emit()
		elif Chefglobal.asemburgtop4.size() > 3:
			tomuch.emit()
		else:
			Chefglobal.asemburgtop4.append(Chefglobal.inventory)
			Chefglobal.inventory = ""
	elif isready and Chefglobal.inventory == "":
		visible = false
		toppings = ", ".join(Chefglobal.asemburgtop4) 
		Chefglobal.inventory= buntype + " " + burgtype + " with\n" + toppings
		if Chefglobal.asemburgtop4 == []:
			Chefglobal.inventory = buntype + " " + burgtype
		Chefglobal.asemburgtop4.clear()
		toppings = ""
		isready = false
		Chefglobal.assemblytable4 = ""
	else:
		nope.emit()
