extends Label


func _process(delta: float) -> void:
	set_text("")
	if Chefglobal.orders.size() > 0:
		for i in Chefglobal.orders.size():
			if i > 2:
				pass
			else:
				text += Chefglobal.orders.get(i).name
				if Chefglobal.orders.get(i).item1 != "":
					text += "\n-" + Chefglobal.orders.get(i).item1
				if Chefglobal.orders.get(i).item2 != "":
					text += "\n-" + Chefglobal.orders.get(i).item2
				if Chefglobal.orders.get(i).item3 != "":
					text += "\n-" + Chefglobal.orders.get(i).item3
				text += "\n\n"
	else:
		set_text("No new orders!")
