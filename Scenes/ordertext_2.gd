extends Label


func _process(delta: float) -> void:
	set_text("")
	if Chefglobal.orders.size() > 3:
		for i  in range(3, Chefglobal.orders.size()):
			text += Chefglobal.orders.get(i).name
			if Chefglobal.orders.get(i).item1 != "":
				text += "\n-" + Chefglobal.orders.get(i).item1
			if Chefglobal.orders.get(i).item2 != "":
				text += "\n-" + Chefglobal.orders.get(i).item2
			if Chefglobal.orders.get(i).item3 != "":
				text += "\n-" + Chefglobal.orders.get(i).item3
			text += "\n\n"
	else:
		set_text("")
